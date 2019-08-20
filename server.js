var  express = require('express');
const bodyParser =  require('body-parser');
const cors = require('cors');
var app =  express();

app.use(bodyParser.json({limit : '5mb' }));
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));

app.use(cors());
app.options('*', cors());
app.use(function (req, res, next) {
    //set headers to allow cross origin request.
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
}); 


const order1 = require('./routes/order.js');
const order2 = require('./routes/order2.js');
app.use('/api1', order1)
app.use('/api2', order2)
//Server listen method
var server = app.listen(3000,'127.0.0.1', function () {
    var host = server.address().address
    var port = server.address().port
    console.log("Example app listening at http://%s:%s", host, port)
});