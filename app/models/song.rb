class Song < ActiveRecord::Base
  belongs_to :user
  has_many :adds, dependent: :destroy
  has_many :users, through: :adds
  
  validates :artist, :title, presence: true,length: { in: 2..20 }
end
