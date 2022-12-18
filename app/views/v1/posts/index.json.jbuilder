json.posts @posts, partial: 'v1/posts/post', as: :post
json.partial! 'shared/pagination', collection: @posts