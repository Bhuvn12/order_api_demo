var express = require('express');
var router = express.Router();
var conn2 = require('../connection/mysqlcon2.js');

router.get('/getorder:id', (req,res) => {
    var objectToSend={}
    const restaurant_id = req.params.id.trim();
    const sqlQuery = "Select o.order_id,o.user_id,o.item_id,o.restaurant_id,r.restaurant_name,r.city,i.item_name,i.unit_price "
    +" ,o.quantity ,(i.unit_price* o.quantity) as bill from order_info o "
    +" INNER JOIN restaurant_info r ON o.restaurant_id = r.restaurant_id "
    +" INNER JOIN item_info i ON o.item_id = i.item_id where o.restaurant_id='"+restaurant_id+"' ";
    console.log(sqlQuery);
    conn2.query(sqlQuery, (err, results) => {
        if(err) {
            console.log("Error getting order",err);
            objectToSend["error"]=true;
            objectToSend["data"]="Error getting order. Please try again later"
            res.end(JSON.stringify(objectToSend))
        }else {
            objectToSend["error"]=false;
            objectToSend["data"]=results;
            res.end(JSON.stringify(objectToSend))
        }
    })
});



router.post('/placeOrder', (req,res) => {
    
    var objectToSend={}
    const params = req.body;
    const bill = (parseInt(params.quantity) * parseInt(params.item_price));
    const sqlQuery = "INSERT INTO order_info (item_id,user_id,restaurant_id,quantity) VALUES "
    +" ('"+params.item_id+"','"+params.user_id+"','"+params.restaurant_id+"','"+params.quantity+"') "
    +" ON DUPLICATE KEY UPDATE  quantity='"+params.quantity+"' " ;
    console.log(sqlQuery);
    conn2.query(sqlQuery, (err, results) => {
        if(err) {
            console.log("Error in insert or update an order",err);
            objectToSend["error"]=true;
            objectToSend["data"]="Error in insert or update an order. Please try again later"
            res.end(JSON.stringify(objectToSend))
        }else {
            objectToSend["error"]=false;
            objectToSend["data"]="data insert or update successfully";
            res.end(JSON.stringify(objectToSend))
        }
    })
});


router.delete('/deleteOrder:id', (req,res) => {
    var objectToSend={}
    const id = req.params.id;
    const sqlQuery = "delete from order_info where order_id ='"+id+"' ";
    console.log(sqlQuery);
    conn2.query(sqlQuery, (err, results) => {
        if(err) {
            console.log("Error in delete an order",err);
            objectToSend["error"]=true;
            objectToSend["data"]="Error in delete an order. Please try again later"
            res.end(JSON.stringify(objectToSend))
        }else {
            objectToSend["error"]=false;
            objectToSend["data"]=results;
            res.end(JSON.stringify(objectToSend))
        }
    })
});

module.exports = router;
