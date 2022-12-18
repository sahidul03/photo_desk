# == Schema Information
#
# Table name: posts
#
#  id                :bigint           not null, primary key
#  body              :text(65535)      not null
#  comments_count    :integer          default(0), not null
#  post_images_count :integer          default(0), not null
#  status            :integer          default("published"), not null
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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
