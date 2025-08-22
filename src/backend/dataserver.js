// boilerplate

const express = require('express')();
const sqlite = require('sqlite3').verbose();
const db = new sqlite.Database('../../Database/cin_hardware.db',(err) => {
    if(err){
        console.error("failed to connect");
    }
    else{
        console.log("connected")
    }
})


const app = express;

const PORT = 3000;


const hello = "hello";



app.get('/', (req, res) => {
    res.json({
        message: hello
    })
});

app.get('/tables', (req, res) =>{
    const table = req.query.table;
    const sql = "SELECT * FROM " + table;
    db.all(sql, [], (err, rows) => {
        if(err){
            res.status(500).json({ error: err.message });
        }
        else{
            res.json(rows);
            console.log(rows);
        }
    })
})

app.listen(PORT, () =>{
    console.log("server is running");
});