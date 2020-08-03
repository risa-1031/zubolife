class Content < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :group
  has_many :comments

  validates :text, presence: true, unless: :image?

  def self.search(search)
    if search
      Content.where('text LIKE(?)', "%#{search}%")
    else
      Content.all
    end
  end
end
