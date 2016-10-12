class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :items, :dependent => :destroy
  validates :name, :email, presence: true
  before_save :assign_role

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
end
