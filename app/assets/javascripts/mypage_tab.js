$(document).on('turbolinks:load', function(){
 
  $('.status-tab li').click(function() {
 
    var index = $('.status-tab li').index(this);
 
    $('.status-tab li').removeClass('active');
 
    $(this).addClass('active');
 
    $('.books-area ul').removeClass('book-list').eq(index).addClass('book-list');
 
  });
});

// $(document).on('turbolinks:load', function(){
 
//   $('.trade-tab li').click(function() {
 
//     var index = $('.trade-tab li').index(this);
 
//     $('.trade-tab li').removeClass('active');
 
//     $(this).addClass('active');
 
//     $('.tab-area ul').removeClass('list-show').eq(index).addClass('list-show');
 
//   });
// });