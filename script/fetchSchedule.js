const scheduleModel = require('../models/schedule')
const logModel = require("../models/log")
const devideModel = require("../models/device")
module.exports.fetchSchedule = async function()
{
    var result
    await scheduleModel.find({__v:0} ,function(er,data){
        if(er){
            result = null
            return
        }
        result = data
    })
    // console.log(result[0].schedule)
    return result  
}

module.exports.updateLog = async function(userId, date, status)
{
    var userId, date, data, log
    try {
        userId = userId
        date = date
        data = status
    } catch (err) {
       
        return
    }
  
    var logQuerry = await logModel.findOne({
        userId : userId
    } , function (err , data){
        if (err){
            
            return
        }
        log = data
    })

    if (log == null){
        let object = {}
        object[date] = data

        log = new logModel({
            userId : userId,
            history : [
                object
            ]
        })
        await log.save(function(err){
            return
        })
    } 
    else 
    {
        let object = {}
        object[date] = data
        log.history.push(object);
        console.log(log)
        await logQuerry.updateOne({
            $set: {
                history : log.history
            }
        }, function(err){
           
            return
        })
    }
}

module.exports.updateDevice = async function(userId, id , status)
{
    try {
        
        var deviceQuerry = await deviceModel.findOne({
            id : id,
            userId: userId
        }
        , function(err , data){
            if (err){
                return undefined
            }
            if (data == null) {
                return undefined
            }
        })
        
        await deviceQuerry.updateOne(
        {
            $set: {
                status: status
            }
        }, function(err)
            {
                if(err)
                {
                    res.send(err)
                    return undefined
                } 
   
                return ""
            }
        )

    } catch (error) {
        return undefined        
    } 
}

module.exports.getDevice = async function(userId, id)
{

    var deviceList
    await deviceModel.findOne({
        userId: userId,
        id : id
    },function(err , data){
        if (err)
        { 
            return undefined
        }
        deviceList = data
    })
    
    return deviceList 
}