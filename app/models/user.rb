class User < ActiveRecord::Base
  has_secure_password

  has_many :songs
  has_many :adds
 
  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { in: 8..20 }, on: :create
end
