#!/usr/bin/env ruby
MESSAGE = "enter word"
EXIT_MESSAGE = "exit!"
ERROR_MESSAGE = "can't be blank"

def get_middle(word)
  length = word.length
  word.length.even? ? "middle: #{word[length / 2 - 1]}#{word[length / 2]}" : "middle: #{word[length / 2]}"
end

def run
  loop do
    puts MESSAGE
    word = gets.chomp
    break if word == EXIT_MESSAGE
    puts word.empty? ? (puts ERROR_MESSAGE) : (get_middle(word))

  end
end

run