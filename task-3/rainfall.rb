#!/usr/bin/env ruby

WELCOME_MESSAGE = "Enter city name: "
ERROR_MESSAGE = "City name can not be blank!"
EXIT_MESSAGE = "exit!"
NUMBER_OF_MONTHS = 12

def get_data
  @data ||= File.read("data") #It doesn't work as 'data' or 'task-3/data.txt' ¯\_(ツ)_/¯

end

def mean(town, data)
  if data.include?(town)
    weather_data(town, data).sum / NUMBER_OF_MONTHS
  else
    -1
  end
end

def variance(town, data)
  if data.include?(town)
    weather_data(town, data).map { |city| (mean(town, data) - city) ** 2 }.sum / NUMBER_OF_MONTHS
  else
    -1
  end
end

def weather_data(town, data)

  monthly_rainfall = data.split("\n").find { |data_row| data_row.match "#{town}:" }

  return unless monthly_rainfall
  monthly_rainfall.scan(/\d*\.\d/).map(&:to_f)
end

def run_cli
  loop do
    puts WELCOME_MESSAGE
    entered_string = gets.chomp
    break if entered_string == EXIT_MESSAGE

    entered_string.empty? ? puts(ERROR_MESSAGE) : show_result(entered_string)

  end
end

def show_result(input)
  puts "Rainfall mean: #{mean(input, get_data)}"
  puts "Rainfall variance: #{variance(input, get_data)}"
end

run_cli