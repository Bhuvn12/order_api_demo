// sql connection  variables
var mysqlHost="localhost";
var mysqlPwd="root";
var mysqlUser="root";
var mysqldatabase="order_data1";
var mysqldatabase2="order_data2";

var databasecon={
    host: mysqlHost, //mysql database host name
    user: mysqlUser, //mysql database user name
    password: mysqlPwd, //mysql database password
    database: mysqldatabase, //mysql database name
}
var databasecon2={
    host: mysqlHost, //mysql database host name
    user: mysqlUser, //mysql database user name
    password: mysqlPwd, //mysql database password
    database: mysqldatabase2, //mysql database name
}



module.exports={
    //sql connection prop
    databaseObj: databasecon,
    databaseObj2: databasecon2,
}
