// console.log("hope")

function getVideos(){
  console.log('hope')
  //Ajax request to retrive all the items from the database
  $.ajax({
    type: "GET",
    url: "/videos",
    dataType: 'json'
  }).done(function(data){
    $.each(data, function(index, item){
      debugger;
      binding.pry
      appendNewItem(item);
    })
  })
}
$(document).ready(function(){
  // addNew();
  $('#stat').on('click', function(){
   console.log(this)
  })
  
})

//   var addNew = $('#stat')

//   console.log(addNew)
//   debugger;
//   binding.pry
//   $.ajax({
//     type: 'POST',
//     url: '/items',
//     dataType: 'json', 
//   }).done(function(data){
//     console.log("help")
//     debugger;
//     nil
//   })


// // Define Variables
// var uploadVid = $('#stat');
// // //create event listener's
// uploadVid.on('click', uploadVideo);
