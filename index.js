const express = require('express')

// create express app

const app = express()
var cors = require('cors')

app.use(express.json())
app.use(express.urlencoded())
app.use(cors())

// set up the server port 

const port = process.env.port || 4001 ;

// define root route for the server 

app.get('/',(req, res)=>{
    res.send("hello World")
})

// import admin routes

const adminRoutes = require('./src/routes/admin.route')

// Admin API
app.use('/admin', adminRoutes)

// port listen

app.listen(port ,()=>{
    console.log(`Express Running On Server ${port}`)
})

