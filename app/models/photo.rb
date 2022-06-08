class Photo < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likable, :foreign_key => :photo_id
  has_many :comments, as: :commentable
end
