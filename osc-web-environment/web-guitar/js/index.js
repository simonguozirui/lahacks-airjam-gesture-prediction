// append letters dynamically into array
array = ['A', 'B', 'C']

console.log(array);
//
// // osc socket connection
var socket = io('http://127.0.0.1:8081');
console.log('oi');
socket.on('connect', function() {
		 // sends to socket.io server the host/port of oscServer
		 // and oscClient
		 socket.emit('config',
				 {
						 server: {
								 port: 3333,
								 host: '127.0.0.1'
						 },
						 client: {
								 port: 3334,
								 host: '127.0.0.1'
						 }
				 }
		 );
 });

 socket.on('message', function(obj) {
		 // var status = document.getElementById("status");
		 // status.innerHTML = obj[0];
		 console.log(obj[1]);
		 array.push(obj[1]);
		 console.log(array);

 });

setInterval(function(){

// highlight corresponding chord
switch (array[0]) {
		case 'A':
			myFunction(1);
			break;
		case 'B':
			myFunction(2);
			break;
		case 'C':
			myFunction(3);
			break;
		case 'D':
			myFunction(4);
			break;
		case 'E':
			myFunction(5);
			break;
		case 'F':
			myFunction(6);
			break;
	}
array.shift();

 }, 1000);



function myFunction(numb) {
  var elements = document.getElementsByClassName('selected');
  elements[0].classList.remove("selected");
  var element = document.getElementById("string" + String(numb));
  element.classList.add("selected");
}
