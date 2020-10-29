class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :gossip_tags, dependent: :destroy
  has_many :tags, through: :gossip_tags
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  def comment_count
    comments.count
  end

  def like_count
    likes.count
  end

end
