const express = require('express');
const app = express();
const ejs = require('ejs');
const mysql = require("mysql")

// 解析http请求的表单数据
app.use(express.urlencoded({ extended: true }));
// 为其客户端提供静态资源文件
app.use(express.static(__dirname));
// 创建数据库连接
const connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'041236',
    database:'car'
});
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database!');
});
// 查询car表中的所有数据并返回
var dict = ""
var buy = []
var sum = 0  
connection.query('SELECT * FROM car', (err, results) => {
    if (err) throw err;
    dict = results
    console.log(results);
});
// 定义进入127.0.0.1:3000/index时直接进入index.ejs界面
app.get('/index', (req, res) => {
  const addgood = req.query.goods;
  const price = req.query.price;
  // console.log(sum)
  buy.push(addgood);
  sum += parseInt(price);
  const data = { message: dict, goods:buy, sum:sum };
  res.render('index.ejs', data);
});
// 正常函数若非异步，定义如下：
function update(){
  var a = 1;
  console.log("hello");
  return a;
}
// 查询car表中特定size的汽车函数，注意connection是全局变量，此处注意要使用Promise解决异步函数的回调地狱问题，resolve可以传递查询结果
function querycar(str) {
    return new Promise((resolve, reject) => {
      connection.query('SELECT * FROM car where size = ' + '"' + str + '"', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
// 使用 async/await 来等待查询结果，然后将其传递给模板引擎进行渲染。如果查询发生错误，则会捕获并处理异常
  app.post('/submit-form', async (req, res) => {
    const inputData = req.body.inputData;
    console.log(inputData);
    try {
      const str2 = await querycar(inputData);
      console.log(str2);
      res.render('output.ejs', { message: str2 });
    } catch (error) {
      console.error(error);
      res.status(500).send('Internal Server Error');
    }
  });
// 修改car表中特定函数汽车的价格，也需要用到异步回调
app.post('/change-form', async (req, res) => {
  const inputData = req.body.inputData;
  const inputData2 = req.body.inputData2;
  connection.query('update car set price = '+ inputData2 +' where name = ' + '"'+ inputData +'"', (err, results) => {
    if (err) throw err;
    console.log(results);
  });
  var result =await querycar("4door");
  res.render('output.ejs',{message:result})
  // Do something with the input data here
});
// 监听端口号3000，页面在该端口执行
app.listen(3000, () => {
  console.log('Server started on port 3000');
});

// 关闭数据库连接
// connection.end();

