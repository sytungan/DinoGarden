const { json } = require('body-parser');

module.exports.autoRespone = function(
    userName , password , clientSubcribe
){
    var mqtt = require('mqtt');
    var clent;
  

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
    
    client.publish("sytungan/feeds/garden" , "OFF")

    client.on('message', function(topic, message, packet) {

        try {
            var temp = JSON.parse(message)
            if (temp.last_value == undefined)
            console.log(temp)
        }catch(err){

        }

        if (topic.indexOf("/json") == -1 && topic.indexOf("/csv") == -1 && topic.indexOf('bk-iot') != -1)
        console.log("topic is " + topic);
    });
    
}