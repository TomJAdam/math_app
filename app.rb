# Math App

require "./questions"
require "./players"

def new_questions()
  num_one = rand(1...21)
  num_two = rand(1...21)
  question = "What does #{num_one} + #{num_two} equal?"
  answer = num_one + num_two
  return Questions.new(question, answer)
end

player_one = Player.new('Player 1')
player_two = Player.new('Player 2')

player_one_turn = true 
player = player_one

while (player_one.score > 0 && player_two.score > 0) do
  questions_array = []
  questions_array.push(new_questions())

  player = player_one_turn ? player_one : player_two

  puts questions_array[questions_array.length - 1].question
  user_answer = gets.chomp

  if user_answer.to_i == questions_array[questions_array.length - 1].answer
    puts "#{player.name}: Great job!"
  else 
    player.score -= 1
    puts "#{player.name}: You suck!"
  end

  puts "P1: #{player_one.score}/3 vs P2: #{player_two.score}/3"

  puts "** NEXT TURN **"

  player_one_turn = player_one_turn ? false : true

  if player.score == 0
    puts "💀💀 GAME OVER #{player.name} LOSES! 💀💀"
  end
end

