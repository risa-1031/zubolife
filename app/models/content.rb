class Content < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :group
  has_many :comments

  validates :text, presence: true, unless: :image?

  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
