class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  validates_presence_of :name
  
  has_many :memberships
  has_many :organizations, :through => :memberships

  has_many :participations
  has_many :projects, :through => :participations
  
  def gravatar_url(size = 64)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=#{size.to_i}&d=identicon"
  end

end
