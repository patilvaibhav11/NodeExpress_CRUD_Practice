const mysql = require('mysql')

// Mysql Connection

const dbConn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'New_task'
})


dbConn.connect(function(error){
    if(error) throw error;
    console.log("Database Connection Connected Sucsessfully")
})

module.exports = dbConn;