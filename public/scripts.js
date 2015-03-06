function showSlide (){
  document.getElementById("response").innerHTML = "";
  var request = new XMLHttpRequest;
  request.open("get", "http://127.0.0.1:4567/");
  request.send();
  request.addEventListener("load", changeSlide);
}

function previousSlide (){
  document.getElementById("response").innerHTML = "";
  var request = new XMLHttpRequest;
  request.open("get", "http://127.0.0.1:4567/");
  request.send();
  request.addEventListener("load", changeSlide);
}

function nextSlide (){
  document.getElementById("response").innerHTML = "";
  var request = new XMLHttpRequest;
  request.open("get", "http://127.0.0.1:4567/");
  request.send();
  request.addEventListener("load", changeSlide);
}


function insertSlide(){
  document.getElementById("response").innerHTML = ""
  var formElement = document.getElementById("insertSlideForm");
  var request = new XMLHttpRequest;
  request.open("post", "http://127.0.0.1:4567/insert-slide");
  request.send(new FormData(formElement));
  request.addEventListener("load", changeSlide, false);
  document.getElementById("insertSlideForm").reset()
}

function editSlide(){
  document.getElementById("response").innerHTML = ""
  var formElement = document.getElementById("editStudentForm");
  var request = new XMLHttpRequest;
  request.open("post", "http://127.0.0.1:4567/edit-slide");
  request.send(new FormData(formElement));
  request.addEventListener("load", changeSlide, false);
  document.getElementById("editSlideForm").reset()
  
}

function deleteSlide(){
  document.getElementById("response").innerHTML = ""
  var formElement = document.getElementById("deleteSlideForm");
  var request = new XMLHttpRequest;
  request.open("post", "http://127.0.0.1:4567/delete-slide");
  request.send(new FormData(formElement));
  request.addEventListener("load", changeSlide, false);
  document.getElementById("deleteSlideForm").reset()
}

var changeSlide = function(event){
  var object = JSON.parse(event.target.response);
  var p = document.createElement("p");
  var txt = document.createTextNode(JSON.stringify(object));
  p.appendChild(txt);
  document.getElementById("response").appendChild(p)
}