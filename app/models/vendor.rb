class Vendor < ApplicationRecord
  belongs_to :user 
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :race, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :dayrate, presence: true

end
