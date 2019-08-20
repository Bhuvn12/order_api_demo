# order_api_demo
# This is demo purpose api written in node.js and mysql using express.js

# Getting Start
install
npm install

# run 
node server.js

# structure
We have 2 directories inside root directory.
# 1- Connection  2-routes 3-database sql files

# connection with database
Root contains config_con.js file for connection properties.
Change following variables if required
var mysqlHost="localhost";
var mysqlPwd="root";
var mysqlUser="root";
var mysqldatabase="order_data1";
var mysqldatabase2="order_data2";

# Connection:-  
connection script with mysql . This folder contains 2 connection file.
(i) mysqlcon.js for connecting with order_data1 database which contains only single table order_info.
(ii) mysqlcon2.js for connecting with order_data4 database which contains 4 tables.
(a) item_info
(b) user_info
(c) order_info
(d) restaurant_info
# routes
routes folder contains route files.
# order.js :-
order.js is using order_data1 for crud operation on order_info table.

# Api request url for order.js
1- GET() :- http://localhost:3000/api1/getorder 2 restaurant_id(params)
2- POST() Upsert request :- http://localhost:3000/api1/placeorder accept json body having keys as follows.
user_id : number
restaurant_id: number
item_id: number
item_name: string
user_name: string
restaurant_name: string
unit_price: number
qauntity: number
restaurant_city: string

3-DELETE():- http://localhost:3000/api1/deleteorder 3(order_id)  
order_id pass in params


# order2.js
order2.js is using order_data2 fro crud operation.
(i) Upsert an order to a restaurant in order_info
(ii) Delete order from order_info using order_id
(iii) getting order list of restaurant and details using restaurant_id. I join order_info , restaurent_info and item_info for details

# Api request url for order2.js
1- GET() :- http://localhost:3000/api2/getorder 2 restaurant_id(params)
2- POST() Upsert request :- http://localhost:3000/api2/placeorder accept json body having keys as follows.
user_id : number
restaurant_id: number
item_id: number
qauntity: number


3-DELETE():- http://localhost:3000/api2/deleteorder 3(order_id)
order_id pass in params
