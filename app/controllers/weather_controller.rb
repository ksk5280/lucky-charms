class WeatherController < ApplicationController
  attr_accessor :city
  def show
    weather_key = ENV["OPEN_WEATHER_KEY"]
    @city = session[:city].downcase
    result = Faraday.get("http://api.openweathermap.org/data/2.5/forecast?q=#{@city},us&units=imperial&APPID=#{weather_key}&mode=json")
    data = JSON.parse(result.body, object_class: OpenStruct)
    @forecast = Weather.get_forecast(data)
  end

  def create
    session[:city] = params[:weather][:us_city]
    redirect_to weather_path(1)
  end
end
