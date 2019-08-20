var mysql = require('mysql');
var propObj=require('../config_con.js');
//start mysql connection
var connection = mysql.createConnection(propObj.databaseObj2);
connection.connect(function (err) {
    if (err) {
        console.log('Error in Mysql connection With bhuvnesh_test database :-', err);
    } else {
        console.log('You are now connected with mysql bhuvnesh_test database...');
    }
}) 


module.exports= connection;