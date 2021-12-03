#!/usr/bin/env ruby
MESSAGE = "Enter word"
EXIT_MESSAGE = "exit!"
ERROR_MESSAGE = "can't be blank"

def get_middle(word)
  length = word.length
  puts word[length / 2] if length % 2 != 0
  puts "#{word[length / 2 - 1]}#{word[length / 2]}" if length % 2 == 0
end

def run
  loop do
    puts MESSAGE
    word = gets.chomp
    break if word == EXIT_MESSAGE
    word.empty? ? (puts ERROR_MESSAGE) : (puts get_middle(word))
  end
end

run