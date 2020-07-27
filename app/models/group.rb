class Group < ApplicationRecord
  has_many :users
  has_many :group_users,  through: :group_users
  has_many :contents
end
