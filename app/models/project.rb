class Project < ActiveRecord::Base

  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  
end
