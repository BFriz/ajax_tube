function getVideos(){
  //Ajax request to retrive all the items from the database
  $.ajax({
    type: "GET",
    url: "/videos",
    dataType: 'json'
  }).done(function)(data){
    $.each(data, function(index, item){
      appendNewItem(item);
    })
  }
}