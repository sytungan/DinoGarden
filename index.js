const express = require('express');
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const mongoose = require('mongoose')
const path = require('path')

const creatRouter = require('./router/creat.router')
const authRouter = require('./router/authen.router')
const reviewRouter = require('./router/review.router')
const homeRouter = require('./router/home.router')
const validateAuth = require('./validate/auth.validate')
const categoryRouter = require('./router/category.router')
const commentRouter = require('./router/comment.router')
const viewRouter = require('./router/view.router')

const backUp = require('./backup_data/back_up')

require('dotenv').config();



const sessionMiddleware = require('./middleware/session.middleware')


mongoose.connect(process.env.MONGO_URL, { 
    useNewUrlParser: true, 
    useUnifiedTopology: true, 
    serverSelectionTimeoutMS: 5000 
}).catch(err => console.log(err)); 


const app = express();
const port = process.env.PORT || 3000;

app.set('view engine', 'pug');
app.set('views', './views');

app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({
    extended: true
})) // for parsing application/x-www-form-urlencoded
app.use(cookieParser('process.env.SESSION_SECRET'));
app.use(sessionMiddleware)
app.use(express.static('public'));

// app.get('/', function (req, res) {
//     res.render('home');
// });

app.use(function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'HEAD, GET, POST, PUT, PATCH, DELETE');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept,  X-Auth-Token');
  next();
});



app.use('/creat', validateAuth.requestAuth , creatRouter)
app.use('/auth' , authRouter)
// app.use('https://tuananh0209.github.io/review_manga/', reviewRouter)

app.use('/review', reviewRouter)
app.use('/home', homeRouter)
app.use('/category', categoryRouter)
app.use('/comment', commentRouter)
app.use('/view' , viewRouter)

backUp.backUp()


app.listen(3000, function () {
    console.log("port: " + port);
}) 