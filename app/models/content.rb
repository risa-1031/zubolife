class Content < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  validates :text, presence: true, unless: :image?
end
