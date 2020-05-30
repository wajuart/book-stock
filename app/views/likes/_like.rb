# ④
- if user_signed_in?
  ログインしているユーザーがすでに「いいね」しているかどうか
  - if book.like_user(current_user.id)
    .item-button-container__left__dislike
      =link_to user_book_like_path(current_user, book, like), method: "DELETE", remote: true do
        %i.fas.fa-heart
        %span いいね！
        %span 
          = book.likes_count
  - else
    .item-button-container__left__like
      =link_to user_book_likes_path(current_user, book), method: "POST", remote: true do
        %i.fas.fa-heart
        %span いいね！
        %span
          = book.likes_count
-else
  .item-button-container__left__like
    %i.fas.fa-heart
      %span いいね！
      %span = book.like_count