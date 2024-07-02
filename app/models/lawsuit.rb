class Lawsuit < ApplicationRecord

  has_many :depositions, dependent: :destroy

  has_many :discoveries, dependent: :destroy

  has_many :journals, dependent: :destroy

  has_one :courtdate
  accepts_nested_attributes_for :courtdate, allow_destroy: true
 
  has_many :user_lawsuits
  has_many :users, through: :user_lawsuits
  
  has_many :ocs 
  has_many :participants

  validates :cn, presence: true

end


# cdk program; 
