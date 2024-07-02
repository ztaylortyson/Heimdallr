class UsersController < ApplicationController
  def portfolio
      @tracked_lawsuits = current_user.lawsuits
  end

  def clients_portfolio
      @tracked_clients = current_user.clients
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
  def remove_client
      u = current_user
      c = params[:format]
      blah = Client.find(c)
      puts "before delete"
      u.clients.delete(blah)
      puts "after delete"
      redirect_to root_path
  end


end
