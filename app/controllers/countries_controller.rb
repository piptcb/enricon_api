class CountriesController < ApplicationController




def index 
	@countries = Country.all
  if @countries.present?
  else  
    download_countries
  end 
   
end 


def download_countries 
	require 'open-uri'
	url_country = "http://kayaposoft.com/enrico/json/v1.0/?action=getSupportedCountries"
    countries = JSON.parse(open(url_country).read)
    countries.each do |country|
    	country_name_hash = country["fullName"]
    	country_code_hash = country["countryCode"]
    	Country.create(country_name: country_name_hash, country_code: country_code_hash)    
    end 
end 


# when user click download #
def download_holidays 
   
   require 'open-uri'
   @country = Country.find(params[:id])
   country_code = @country.country_code       
   url_request = "http://kayaposoft.com/enrico/json/v1.0/?action=getPublicHolidaysForYear&year=2013&country=#{country_code}&region="   
   holidays = JSON.parse(open(url_request).read)    
   holidays.each do |holiday|       
      year = holiday["date"]["year"]  
      month = holiday["date"]["month"]
      day = holiday["date"]["day"]
      start_hash  = "#{year}-#{month}-#{day}" 
      title_hash = holiday["englishName"]       
      @country.holidays.create(start_at: start_hash ,name: title_hash)
   end 
    redirect_to country_holidays_path(@country)
    
    if holidays.count > 0 
      @country.update(download: true)
    end 
end 

end 





 
