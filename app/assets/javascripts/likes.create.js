//①
// $("#like-buttons").html("<%= j(render partial: 'like', locals: { tweets: @tweets, likes: @likes, like: @like}) %>")

//③
// $('.buttons_<%= @book.id %>').html("<%= j(render partial: 'likes/like' ) %>");

//④
// $(".item-button-container__left").html("#{escape_javascript(render partial: 'like', locals: { product: @product, products: @products, likes: @likes, like: @like})}")