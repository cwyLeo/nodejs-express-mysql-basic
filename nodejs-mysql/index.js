const express = require('express');
const session = require('express-session');
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
var prices = []
var sum = 0
var username = ""
var userid = ""  
connection.query('SELECT * FROM car', (err, results) => {
    if (err) throw err;
    dict = results
    console.log(results);
});
app.get('/',(req,res) => {
  res.render('login.ejs');
});
app.post('/login',async (req,res) => {
  username = req.body.username;
  userid = req.body.pwd;
  const result = await querycust(username,userid);
  buy = []
  prices = []
  sum = 0
  if(result.length != 0){
    res.redirect('/index')
    // res.render('index.ejs',{message:dict,goods:buy,prices:prices,sum:String(sum),userid:userid,username:username})
  }
  else{
    res.redirect('/')
  }
})
app.post('/reg',async (req,res) => {
  username = req.body.username;
  userid = req.body.pwd;
  phone = req.body.phone;
  salary = req.body.salary;
  sex = req.body.sex;
  const isadded = await querycust2(req.body.username);
  if(isadded.length!=0){
    // alert("name has existed!");
    res.redirect('/');
    return;
  }
  const result = await addCustomer(req.body.username,req.body.pwd,phone,salary,sex);
  buy = []
  prices = []
  sum = 0
  if(result.length != 0){
    res.redirect('/index')
    // res.render('index.ejs',{message:dict,goods:buy,prices:prices,sum:String(sum),userid:userid,username:username})
  }
  else{
    res.redirect('/')
  }
})
// 定义进入127.0.0.1:3000/index时直接进入index.ejs界面
// app.post('/index', (req, res) => {
//   const addgood = req.body.goods;
//   const price = req.body.price;
//   // console.log(sum)
//   buy.push(addgood);
//   prices.push(price);
//   sum += parseInt(price);
//   const data = { message: dict, goods:buy, prices:prices, sum:String(sum),userid:userid,username:username };
//   res.render('index.ejs', data);
//   // res.redirect(301,'/index')
// });
// 显示购物车页面
app.get('/index', (req, res) => {
  // buy = buy || [];
  // prices = prices || [];
  // sum = sum || 0;

  const data = { message: dict, goods:buy, prices:prices, sum:String(sum),userid:userid,username:username };
  res.render('index.ejs', data);
});

// 添加商品到购物车
app.post('/add-to-cart', (req, res) => {
  const addgood = req.body.goods;
  const price = req.body.price;
  
  buy = buy || [];
  prices = prices || [];
  sum = sum || 0;
  
  buy.push(addgood);
  prices.push(price);
  sum += parseInt(price);
  
  // 跳转到购物车页面，并显示添加的商品、价格和总价
  res.redirect('/index');
});
app.get('/logout',(req,res) => {
  username = ""
  userid = ""
  res.redirect('/');
})
app.get('/delete', (req, res) => {
  const addgood = req.query.goods;
  const price = req.query.price;
  buy.splice(buy.indexOf(addgood),1);
  prices.splice(prices.indexOf(price),1);
  sum -= parseInt(price);
  // const data = { message: dict, goods:buy, prices:prices, sum:String(sum),userid:userid,username:username };
  // res.render('index.ejs', data);
  res.redirect('/index');
});
app.get('/delete2', async (req, res) => {
  const name = req.query.id;
  const deletePromise =await deleteCar(name);
  const queryPromise =await queryAllCar();
  res.render('edit.ejs',{username:username,userid:userid,cars:queryPromise})
});

app.get('/other',(req,res) => {
    res.render('edit.ejs',{username:username,userid:userid,cars:dict});
})
app.post('/edit',async (req,res) => {
  connection.query('update car set name = "'+ req.body.name +'" , price = "'+ req.body.price +'" , brand = "'+ req.body.brand +'" , size = "'+ req.body.size +'" where name = "' + req.body.name + '"', (err, results) => {
    if (err) throw err;
    // console.log(results);
  });
  var result = await queryAllCar();
  res.render('edit.ejs',{username:username,userid:userid,cars:result})
})
// 正常函数若非异步，定义如下：
function update(){
  var a = 1;
  console.log("hello");
  return a;
}
// 查询car表中特定size的汽车函数，注意connection是全局变量，此处注意要使用Promise解决异步函数的回调地狱问题，resolve可以传递查询结果
function queryAllCar() {
  return new Promise((resolve, reject) => {
    connection.query('SELECT * FROM car', (err, results) => {
      if (err) reject(err);
      resolve(results);
    });
  });
}
function querycar(str) {
    return new Promise((resolve, reject) => {
      connection.query('SELECT * FROM car where size = ' + '"' + str + '"', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
  function querycust(name,id) {
    return new Promise((resolve, reject) => {
      connection.query('SELECT * FROM customer where name = ' + '"' + name + '" and id = ' + '"' + id + '"', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
  function deleteCar(id) {
    return new Promise((resolve, reject) => {
      connection.query('delete FROM car where name = ?',[id], (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
  function querycust2(name) {
    return new Promise((resolve, reject) => {
      connection.query('SELECT * FROM customer where name = ' + '"' + name + '"', (err, results) => {
        if (err) reject(err);
        resolve(results);
      });
    });
  }
  function addCustomer(name,id,phone,salary,sex) {
    return new Promise((resolve,reject) => {
      connection.query('insert into customer(id,name,sex,phone,salary) values(?,"?","?","?",?)',[id,name,sex,phone,salary],(err,results) => {
        if(err) reject(err);
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

