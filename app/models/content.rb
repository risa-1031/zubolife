class Content < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comment
end
