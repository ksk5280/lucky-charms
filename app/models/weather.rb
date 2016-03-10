class Weather < ActiveRecord::Base

  def self.get_forecast(weather)
    weather.list.select do |day_part|
      DateTime.parse(day_part.dt_txt).strftime("%k %p") == "15 PM"
    end[0..3]
  end

end
