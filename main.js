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

app.get('/student/registar',(req,res)=>{
    res.render('registar.html')
})

app.get('/student/adddrop',(req,res)=>{
    res.render('adddrop.html')
})

app.get('/student/payment',(req,res)=>{
    res.render('payment.html')
})

app.get('/student/grade',(req,res)=>{
    res.render('grade.html')
})

app.get('/student/withdraw',(req,res)=>{
    res.render('withdraw.html')
})

app.get('/student/class_schedule',(req,res)=>{
    res.render('class_schedule.html')
})

app.get('/student/exam_teach_schedule',(req,res)=>{
    res.render('exam_teach_schedule.html')
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
