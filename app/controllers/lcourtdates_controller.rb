class LcourtdatesController < ApplicationController
  def edit
      @blah = Courtdate.find_by(lawsuit_id: params[:id])
      puts " = = = "
      puts @blah.inspect
  end
end
