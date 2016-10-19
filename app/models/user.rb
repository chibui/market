class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  belongs_to :role
  has_many :items, :dependent => :destroy
  has_many :orders
  validates :name, :email, presence: true
  validates :tos_status, acceptance: true

  mount_uploader :image, ImageUploader

  before_save :assign_role

  def self.search(search)
    where("name ILike ?", "%#{search}%")
  end

  # Callback to send mail after user created
  after_create :send_welcome_email

  def send_welcome_email
    ModelMailer.new_seller_notification(self).deliver_now
  end

  # omniauth facebook
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    end
  end

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def seller?
    self.role.name == "Seller"
  end

  def regular?
    self.role.name == "Regular"
  end

  def suspended?
    self.role.name == "Suspended"
  end

end
