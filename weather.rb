require 'yahoo_weatherman'

puts "Please enter your zip code: "
zip_code = gets.to_s

client = Weatherman::Client.new(unit: 'f')
weather = client.lookup_by_location(zip_code)

current_temp = weather.condition['temp']
current_conditions = weather.condition['text']
current_city = weather.location['city']
current_country = weather.location['country']


puts "It's currently #{current_temp} degrees with #{current_conditions.downcase} conditions in #{current_city}, #{current_country}.\n"

current_day = Time.now.strftime('%w').to_i

weather.forecasts.each do |forecast|
day_of_week = forecast['date']
other_days = day_of_week.strftime('%w').to_i

if other_days == current_day
	name_of_day = 'Today'
elsif other_days == current_day + 1
	name_of_day = 'Tomorrow'
else
	name_of_day = day_of_week.strftime('%A')
end

	puts name_of_day + "'s forecast is " + forecast['text'].downcase + " with a high of " + forecast['high'].to_s + " and a low of " + forecast['low'].to_s + "."
end





