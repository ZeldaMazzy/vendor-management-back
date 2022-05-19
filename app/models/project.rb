class Project < ApplicationRecord
  has_many :assignments
  has_many :vendors, through: :assignments

  validates :title, presence: true
  validates :client, presence: true
  validates :budget, presence: true
  validates :due_date, presence: true
  validates :talent_needed, presence: true
  
end