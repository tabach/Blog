class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]
  # like unlike

  # avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # facebook
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar_file_name = auth.info.image # assuming the user model has an image
    end
  end

end
