class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  has_many :friendships
  has_many :sayings, :foreign_key => :user_id
  has_many :photos, :foreign_key => :user_id
  has_many :befriendor_friendships, :foreign_key => :befriendor_id, :class_name => "Friendship"
  has_many :befriendor_friends, :through => :befriendor_friendships, :source => :befriendee
  has_many :befriendee_friendships, :foreign_key => :befriendee_id, :class_name => "Friendship"
  has_many :befriendee_friends, :through => :befriendee_friendships, :source => :befriendor

  has_many :saying_likes, :foreign_key => :liker_id, :class_name => "Like"
  has_many :liked_sayings, :through => :saying_likes, :source => :likable, source_type: "Saying"

  has_many :photo_likes, :foreign_key => :liker_id, :class_name => "Like"
  has_many :liked_photos, :through => :photo_likes, :source => :likable, source_type: "Photo"

  has_many :comments, :foreign_key => :commentor_id
  has_many :commented_sayings, :through => :comments, :source => :commentable, source_type: "Saying"
  has_many :commented_photos, :through => :comments, :source => :commentable, source_type: "Photo"

  has_one :profile

  def friends
  (befriendor_friends + befriendee_friends).flatten.uniq
  end



  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  

  class User < ApplicationRecord
    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
end
