class Forecast < ActiveRecord::Base

def get_weather        
  #ForecastIO.forecast(lat, lng)
  
 # options = { units: "metric", APPID: "a496f6cc9d256a3b5bcae251b1aae713" }
#OpenWeather::Current.city("Cochin, IN", options)
#OpenWeather::ForecastDaily.city(lat, options)
response = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?q='+city+'&APPID=a496f6cc9d256a3b5bcae251b1aae713')
   # @humidity= response['main']['humidity']
   # @humidity = response['humidity'] ? response['humidity'] : nil
    puts response.inspect
    #puts @humidity.inspect
    #self.weather = response
    #body = JSON.parse(response.)
    list= ret.parsed_response["lists"]
    list.each do |item|
        puts item["day"]
        puts item["min"]
        puts item["max"]
    end
    #@humidity = body["humidity"]
    #puts @humidity.inspect
    
end

end
