module CourtdatesHelper

	def format_date(date_obj)
		date_obj.strftime("%m/%d/%Y")
	end

end
