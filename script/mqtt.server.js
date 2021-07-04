var schedule = require("./fetchSchedule")
var update_schedule = require('./event')
var node_cron = require('node-cron')


module.exports.autoRespone = async function(
    userName , password , clientSubcribe
){
    var mqtt = require('mqtt');
    var data_schedule
    await schedule.fetchSchedule().then(data =>{
        data_schedule = data 
    })
    console.log(data_schedule)

    update_schedule.on("update", async ()=>{
        await schedule.fetchSchedule().then(data =>{
            data_schedule = data 
        })

    })
   
    const client = mqtt.connect('tcp://io.adafruit.com:1883', {
        username: userName,
        password: password,
    });

    client.on('connect', () => {
    client.subscribe(clientSubcribe)
    })

    client.on("error" , function(error){
        console.log(error)
    })
    
    // client.publish("sytungan/feeds/garden" , "OFF")

    var temp
    var client_topic
    client.on('message', function(topic, message, packet) {
    
        try {
            var mes_json = JSON.parse(message)
            if (mes_json.last_value == undefined)
                temp = mes_json

        }catch(err){
            console.log(err)
        }
        if (topic.indexOf("/json") == -1 && topic.indexOf("/csv") == -1 && topic.indexOf('bk-iot') != -1)
        client_topic = topic
    });

    node_cron.schedule("0-59 * * * *", async ()=>{
        try{
        var currentTime  = getTime()
        var currentDate = getDate() 
        for (x of data_schedule)
            {
                x.schedule = JSON.parse(x.schedule)
                for (i of x.schedule.data)
                {
                    if (i.status != true) continue
                    if (i.ho != undefined && i.hof != undefined)
                    {
                        if (
                            Date.parse("01/01/2021 " +i.ho) >= Date.parse("01/01/2021 " +currentTime) || 
                            Date.parse("01/01/2021 " +i.hof) <= Date.parse("01/01/2021 " +currentTime)
                        )
                        {
                            continue
                        }
                    }

                    if (temp.name == i.name)
                    {
                        var trigger
                        if (i.name != "TEMP-HUMID")
                            trigger = i.on <= parseInt(temp.data) &&
                            i.off >= parseInt(temp.data)
                        else
                            {
                                var a = temp.data.split("-")
                                var a1 = i.on.split("-")
                                var a2 = i.off.split("-")
                                var b =  parseInt(a1[0]) <= parseInt(a[0]) &&
                                parseInt(a2[0]) >= parseInt(a[0])
                                var c = parseInt(a1[1]) <= parseInt(a[1]) &&
                                parseInt(a2[1]) >= parseInt(a[1])
                                trigger = b && c
                            }
                        
                       
                        var device = await schedule.getDevice(x.userId, i.id)
                        if (device.status == trigger ) continue
                        var text = trigger ? "ON" :"OFF"
                        client.publish(client_topic , text )
                        await schedule.updateDevice(x.userId, i.id , trigger)
                        await schedule.updateLog(x.userId , currentDate, {"text":"turn " + text + " the " +  i.name, "time":currentTime})
                    }
                }    
            }
        }
        catch(er)
        {
            console.log(er)
        }
    },{
        scheduled: true,
        timezone: "Asia/Bangkok"
    })
    
}

function getTime()
{
    var date = new Date()
    var currentTime  = date.getHours() +":"+date.getMinutes() + ":" + date.getHours();
    return currentTime
}

function getDate()
{
    var date = new Date()
    var currentDate = date.getDate() +" "+ date.getMonth()+ " " + date.getFullYear();
    return currentDate
}

