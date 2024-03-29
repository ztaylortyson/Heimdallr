class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      has_many :user_lawsuits
      has_many :lawsuits, through: :user_lawsuits



   

    def already_tracking?(lawsuit_id)
        lawsuits.exists?(id: lawsuit_id) 
    end 



end
