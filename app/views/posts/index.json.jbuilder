json.posts @posts, partial: 'posts/post', as: :post
json.partial! 'shared/pagination', collection: @posts