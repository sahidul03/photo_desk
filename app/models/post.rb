# == Schema Information
#
# Table name: posts
#
#  id                :bigint           not null, primary key
#  body              :text(65535)      not null
#  comments_count    :integer          default(0), not null
#  post_images_count :integer          default(0), not null
#  status            :integer          default(0), not null
#  title             :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :post_images, dependent: :destroy

    counter_culture :user
    enum :status, { published: 0, draft: 1, only_me: 2, deleted: 3 }, default: :published

    scope :latest_top, -> { order(updated_at: :desc) }
end
