class Post < ActiveRecord::Base
  mount_uploader :image, PostUploader
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy

# count view
  is_impressionable
end
