class WeatherController < ApplicationController
  attr_accessor :city
  def show
    weather_key = ENV["OPEN_WEATHER_KEY"]
    @city = session[:city]
    result = Faraday.get("http://api.openweathermap.org/data/2.5/forecast?q=#{session[:city].downcase},us&units=imperial&APPID=#{weather_key}&mode=json")
    @forecast = JSON.parse(result.body, object_class: OpenStruct)
    @forecast = @forecast.list.select do |day_part|
      DateTime.parse(day_part.dt_txt).strftime("%k %p") == "15 PM"
    end[0..3]
    # binding.pry
  end

  def new
  end

  def create
    session[:city] = params[:weather][:us_city]
    redirect_to weather_path(1)
  end
end
