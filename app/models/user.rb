class User < ActiveRecord::Base
  has_many :authentications
  has_many :lists
  has_many :permissions
  has_many :permitted_lists, :through => :permissions, :source => :list

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_omniauth (omniauth)
    authentications.build(:provider => omniauth["provider"], :uid => omniauth["uid"])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def can_view? (list)
    list.viewable_by?(self)
  end

  def can_edit? (list)
    list.editable_by?(self)
  end
end
