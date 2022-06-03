class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships
  has_many :befriendor_friendships, :foreign_key => :befriendor_id, :class_name => "Friendship"
  has_many :befriendor_friends, :through => :befriendor_friendships, :source => :befriendee
  has_many :befriendee_friendships, :foreign_key => :befriendee_id, :class_name => "Friendship"
  has_many :befriendee_friends, :through => :befriendee_friendships, :source => :befriendor

  def friends
  (befriendor_friends + befriendee_friends).flatten.uniq
  end
end
