var link = $('.pagination__link');
link.on('click', function(){
  link.removeClass('is_active');
  $(this).addClass('is_active');
});