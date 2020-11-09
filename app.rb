# Math App

require "./questions"
require "./players"

player_one = Player.new('Player 1')
player_two = Player.new('Player 2')

def new_questions()
  num_one = rand(1...21)
  num_two = rand(1...21)
  question = "What does #{num_one} + #{num_two} equal?"
  answer = num_one + num_two
  return Questions.new(question, answer)
end

test = new_questions()

puts test.question
ans = gets.chomp

if ans.to_i == test.answer
  puts "#{player_one.name}: Great job!"
else 
  player_one.score -= 1
  puts "#{player_one.name}: You suck!"
end

puts "P1: #{player_one.score} vs P2: #{player_two.score}"

