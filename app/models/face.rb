class Face < ApplicationRecord
  has_and_belongs_to_many :friends, class_name: "Face", foreign_key: "face_id"
end
