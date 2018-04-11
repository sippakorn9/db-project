var express = require('express')
var app = express()
var ejs =require('ejs')
var body =require('body-parser').urlencoded({extended:true})
var mysql = require('mysql')




app.engine('html',ejs.renderFile)
app.listen(2000)
app.get("/",(req,res)=>{
    res.render('index.html')
})

app.get('/student',(req,res)=>{
    res.render('student.html')
})

app.post("/",body,(req,res)=>{
    if(req.body.typeLogin == 'student'){
        res.redirect('/student')
    }


})