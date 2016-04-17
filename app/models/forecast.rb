class Forecast < ActiveRecord::Base

def get_weather        
  ForecastIO.forecast(lat, lng)  
end

end
