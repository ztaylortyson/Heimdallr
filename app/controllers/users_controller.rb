class UsersController < ApplicationController
  def portfolio
      @tracked_lawsuits = current_user.lawsuits
  end
end
