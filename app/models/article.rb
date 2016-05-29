class Article < ActiveRecord::Base
  include WithTags

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
