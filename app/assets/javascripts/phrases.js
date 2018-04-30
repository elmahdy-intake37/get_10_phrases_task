// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function myFunction(){
  var arr = []
  var len = $('li').length
var html = JSON.parse(localStorage.getItem("phrase"));
  for (let i=0 ; i< len; i++){
   var attr = $('li')[i].childNodes['0'].data
   arr.push(attr)
}

localStorage.setItem("phrase", JSON.stringify(arr));

if(html !== null){
  var arr2 = []
  for(let i = 0; i<html.length; i++){
    arr2.push(html[i])
  }
}

  $.ajax({
        method: 'GET',
        url: '/phrase',
        dataType: 'script',
        data: {arr: arr, arr2:arr2}
      }).done(function(data){
        console.log(data);
      })
}

function myFunctionClear()
{
  $('li').remove()
  localStorage.clear();
  let elem = document.getElementById('foo')
  elem.parentNode.removeChild(elem);

}
// $(function(){
//   $(".button").on("click", function(event) {
//     // do something
//     debugger
//     event.preventDefault();
//     $.ajax({
//       method: 'GET',
//       url: "/pharse/list",
//       dataType: 'script'
//     })
//   });
// });
