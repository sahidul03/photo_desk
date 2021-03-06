# == Schema Information
#
# Table name: post_images
#
#  id         :bigint           not null, primary key
#  file_path  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_post_images_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class PostImage < ApplicationRecord
    belongs_to :post
    mount_uploader :file_path, PostImageUploader

    counter_culture :post
end
