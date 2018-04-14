var express = require('express')
var app = express()
var ejs =require('ejs')
var path = require('path')
var body =require('body-parser').urlencoded({extended:true})
var mysql = require('mysql')

app.engine('html',ejs.renderFile)
app.listen(3000)
app.use(express.static(path.join(__dirname, 'public')));

app.get("/",(req,res)=>{
    res.render('index.html')
})

app.get('/student',(req,res)=>{
    res.render('student.html')
})

app.get('/teacher',(req,res)=>{
    res.render('teacher.html')
})

app.post("/",body,(req,res)=>{
    if(req.body.typeLogin == 'student'){
        res.redirect('/student')
    }
    else if(req.body.typeLogin == 'teacher'){
        res.redirect('/teacher')
    }
})

app.post("/student",body,(req,res)=>{
    if(req.body.typeLogout == 'Logout'){
        res.redirect('/')
    }
})