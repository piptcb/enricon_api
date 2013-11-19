module CountriesHelper
 # download holiday  and show in details 
  # require object  = country 
  def button_download_show_holidays_for(country)
     if country.holiday_downloaded?  
 	 	 link_to 'Download Holidays', country_holiday_download_path(country), 
 	 	 class: 'btn btn-default'   	 			  
 	 else 
 	 	 link_to 'Show Holidays', country_holidays_path(country), 
 	 	 class: 'btn btn-default'
 	 	 		 
     end 
  end 

end
