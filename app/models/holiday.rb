class Holiday < ActiveRecord::Base
  belongs_to :country 

	COUNTRIES = ["US", "Hong Kong", "Australia"]
    
    YEARS = ["2013","2014", "2015"]

end
