require 'open-uri'
require 'json'

open('http://api.wunderground.com/api/cf3d6d0531d1f384/geolookup/conditions/q/CO/Denver.json') do |f|
  json_string = f.read
  puts json_string
  parsed_json = JSON.parse(json_string)
  city = parsed_json['location']['city']
  state = parsed_json['location']['state']
  weather = parsed_json['current_observation']['weather']

  x = weather.downcase

  if x.include? "cloud"
    puts "Cloudy with a chance of bullshit."
  elsif x.include? "overcast"
    puts "Fifty fucking shades of grey."
  elsif x.include? "rain"
    puts "Rain, rain go the fuck away."
  elsif x.include? "clear"
    puts "Suns out, get naked. Is that right?"
  else
    puts "WTF is going on outside?"
  end


  print "Taking a look out the window in #{city}, #{state} and it's fucking #{weather.downcase}.\n"
end
