class Saying < ApplicationRecord
  belongs_to :user
  has_many :likes, :foreign_key => :saying_id
  has_many :comments
end
