Apitest::Application.routes.draw do
 

  root "countries#index"
  # custom nested route 
  get "countries/:id/download_holidays" => "countries#download_holidays", :as => "country_holiday_download"
 
  resources :countries do 
    resources :holidays
  end

end
