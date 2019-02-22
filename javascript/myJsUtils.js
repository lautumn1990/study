// this is my javascript utils

// -----------------------
// 从数组中随机获取js中的值
function getRandomFromArray(arr){
    return arr[Math.floor((Math.random()*arr.length))];
}

// test

function testGetRandomFromArray(){
    var arr = ['a','b','c','d'];
    for (let i = 0; i < 10; i++) {
        console.log(getRandomFromArray(arr));
    }
}
testGetRandomFromArray();

// -----------------------



// -----------------------