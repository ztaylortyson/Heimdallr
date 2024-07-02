class Courtdate < ApplicationRecord
  belongs_to :lawsuit

  before_save :cdate_logger

  def cdate_logger
    if saved_change_to_complaint?
      puts " = = = = = = = "
      puts "Complaint was updated!!!"
      puts " "
    end
  end


end


