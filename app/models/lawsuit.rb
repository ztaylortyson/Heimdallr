class Lawsuit < ApplicationRecord
 
  has_many :user_lawsuits
  has_many :users, through: :user_lawsuits
  

  has_many :ocs 
  has_many :participants

  validates :cn, presence: true

end
