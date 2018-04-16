var express = require('express')
var app = express()
var ejs =require('ejs')
var path = require('path')
var body =require('body-parser').urlencoded({extended:true})
var mysql = require('mysql')
var connection = {
    host: 'sariedb.c0q2zhaerlke.ap-southeast-1.rds.amazonaws.com',
    user: 'admin',
    password: 'password', 
    database: 'sarie'
}
var pool = mysql.createPool(connection)

app.engine('html',ejs.renderFile)
app.listen(3000)
app.use(express.static(path.join(__dirname, 'public')));

var name;

app.get("/",(req,res)=>{
    name=""
    res.render('index.html')
})

app.get('/student',(req,res)=>{
    res.render('student.html',{name: name})
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

app.get('/studentGrade',(req,res)=>{
    pool.query("select * from test",
    (error, data) => {
        console.log("pass")
        //console.log( data)
        res.json(data)

        
    })

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
        pool.query("select * from login where username= ? and password=?",
        [req.body.username, req.body.password],
        (error, data) => {
            console.log("login")
            //console.log( data)
           if(data.length==1){
               name = data[0].username
               console.log(name)
                res.redirect('/student')
           }
           else{
               console.log('wrong password')
           }
    
            
        })
       
    }
    else if(req.body.typeLogin == 'teacher'){
        res.redirect('/teacher')
    }
})
