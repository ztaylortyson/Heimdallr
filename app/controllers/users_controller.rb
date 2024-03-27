class UsersController < ApplicationController
  def portfolio
      @tracked_lawsuits = current_user.lawsuits
  end


  def remove
      u = current_user
      l = params[:format]
      blah = Lawsuit.find(l)
      puts "before delete"
      u.lawsuits.delete(blah)
      puts "after delete"
      redirect_to root_path
  end


end
