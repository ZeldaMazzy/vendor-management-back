class Project < ApplicationRecord
  has_many :vendors
  validates :title, presence: true
  validates :client, presence: true
  validates :budget, presence: true
  validates :due_date, presence: true
  
end
