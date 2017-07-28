class Forecast < ActiveRecord::Base
 has_many :lists
 has_many :cities
 accepts_nested_attributes_for :lists
def get_weather        
  #ForecastIO.forecast(lat, lng)
  
 # options = { units: "metric", APPID: "a496f6cc9d256a3b5bcae251b1aae713" }
#OpenWeather::Current.city("Cochin, IN", options)
#OpenWeather::ForecastDaily.city(lat, options)
response = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?q='+city+'&APPID=a496f6cc9d256a3b5bcae251b1aae713')
   # @humidity= response['main']['humidity']
   # @humidity = response['humidity'] ? response['humidity'] : nil
    puts response
     body = JSON.parse(response.body)
    @city = body["city"]
    @cnt= body["cnt"]
    num=@cnt
    (0..num).each do |i|
    @lists = List.new
    @lists.dt= body["list"][0]["dt"]
    @lists.humidity=body["list"][0]["humidity"]
    @lists.pressure=body["list"][0]["pressure"]
    @temp= Temp.new
     @temp.day= body["list"][0]["temp"]["day"]
     @temp.min= body["list"][0]["temp"]["min"]
     @temp.max= body["list"][0]["temp"]["max"]
     @temp.night= body["list"][0]["temp"]["night"]
     @temp.eve= body["list"][0]["temp"]["eve"]
     @temp.morn= body["list"][0]["temp"]["morn"]
     @weather = Weather.new
    # @weather.main= body["list"][0]["weather"]["main"]
    #  @weather.description= body["list"][0]["weather"]["description"]
     # @weather.icon= body["list"][0]["temp"]["morn"]["weather"]["icon"]
     puts @lists.inspect
    @lists.save
    @temp.save
    @weather.save
    
    end
    puts @cnt.inspect
    puts @dt
    #puts @humidity.inspect
    #puts @forecast
    
   
   # @lists= List.new()
 #   @lists.save
    #lists =body["list"]
    
    #puts lists[0].inspect
 #   @list =lists[0]
    #@lists.humidity=lists[0][:humidity]
    #body = JSON.parse(@list.body)
#    @lists.dt=body["dt"]
#    @lists.humidity=body["humidity"]
#    puts @lists.inspect
   # @list.save
  #  if((lists.at(0)=='['))
   #       puts @cnt.inspect
    #        lists=lists.from(1).to(-2) 
    #        puts lists.inspect
    #    end
     #   puts lists.inspect
    #@lists =JSON.parse(lists.body)
    #@lists.save
    
    
    

    #puts self.weather.inspect
    #body = JSON.parse(response.)
    #list= response.JSON["lists"]
    #list.each do |item|
     #   puts item["day"]
     #   puts item["min"]
     #   puts item["max"]
    #end
    #@humidity = body["humidity"]
    #puts @humidity.inspect
    
end

end
