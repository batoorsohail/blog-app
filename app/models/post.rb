class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_author_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_author_posts_counter
    author.increment!(:posts_counter)
  end

  validates :title, presence: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :likes_counter, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
