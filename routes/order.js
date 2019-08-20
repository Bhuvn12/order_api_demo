var express = require('express');
var router = express.Router();
var conn = require('../connection/mysqlcon.js');

router.get('/getorder:id', (req,res) => {
    var objectToSend={}
    const restaurant_id = req.params.id.trim();
    console.log(restaurant_id)
    const sqlQuery = " Select * from order_info where restaurant_id ='"+restaurant_id+"' ";
    console.log(sqlQuery);
    conn.query(sqlQuery, (err, results) => {
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
    const bill = (parseInt(params.quantity) * parseInt(params.unit_price));
    console.log(params)
    const sqlQuery = "INSERT INTO order_info (item_id,user_id,restaurant_id,item_name,unit_price,restaurant_name,user_name,restaurant_city,quantity,bill) VALUES "
    +" ('"+params.item_id+"','"+params.user_id+"','"+params.restaurant_id+"','"+params.item_name+"','"+params.unit_price+"' "
    +" ,'"+params.restaurant_name+"','"+params.user_name+"','"+params.restaurant_city+"','"+params.quantity+"','"+bill+"') "
    +" ON DUPLICATE KEY UPDATE item_name= '"+params.item_name+"', user_name= '"+params.user_name+"', restaurant_name= '"+params.restaurant_name+"' "
    +" , quantity='"+params.quantity+"', unit_price='"+params.unit_price+"' , bill= '"+bill+"', restaurant_city='"+params.restaurant_city+"' " ;
    conn.query(sqlQuery, (err, results) => {
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
    console.log(id);
    const sqlQuery = "delete from order_info where order_id ='"+id+"' ";
    conn.query(sqlQuery, (err, results) => {
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
