class Vendor < ApplicationRecord
  belongs_to :user 
  has_many :assignments
  has_many :projects, through: :assignments

  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :race, presence: true
  validates :phone, presence: true
  validates :email, presence: true

end
