class Comment < ApplicationRecord
  belongs_to :commentor, :class_name => "User"
  belongs_to :saying
end
