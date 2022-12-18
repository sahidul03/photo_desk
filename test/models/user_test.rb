# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  email       :string(255)      not null
#  name        :string(255)      not null
#  phone       :string(255)      not null
#  posts_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
