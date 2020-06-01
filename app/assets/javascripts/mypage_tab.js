$(document).on('turbolinks:load', function(){
 
  $('.status-tab li').click(function() {
 
    var index = $('.status-tab li').index(this);
 
    $('.status-tab li').removeClass('active');
 
    $(this).addClass('active');
 
    $('.books-area ul').removeClass('book-list').eq(index).addClass('book-list');
 
  });
});
