class Country < ActiveRecord::Base
	has_many :holidays 	

	def holiday_downloaded? 
		not download 
	end 
end
