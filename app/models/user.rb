# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  email        :string(255)      not null
#  name         :string(255)      not null
#  phone_number :string(255)      not null
#  posts_count  :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
    has_many :posts, dependent: :destroy
end
