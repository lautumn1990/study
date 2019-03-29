// this is my javascript utils

// -----------------------
// 从数组中随机获取js中的值
function getRandomFromArray(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

// test

function testGetRandomFromArray() {
  var arr = ["a", "b", "c", "d"];
  for (let i = 0; i < 10; i++) {
    console.log(getRandomFromArray(arr));
  }
}
testGetRandomFromArray();

// -----------------------

// 生成随机数
function getRandomInt(max) {
  return Math.floor(Math.random() * (max + 1));
}

// -----------------------

// 生成随机字符串
function randomString(len) {
  len = len || 32;
  var $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  var maxPos = $chars.length;
  var pwd = "";
  for (var i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}

// 测试
for (var i = 0; i < 20; i++) {
  console.log(randomString(16));
}
// -----------------------
// -----------------------
