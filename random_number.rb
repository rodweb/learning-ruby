number = rand(10)
guess = -1

print 'Guess a number: '
until guess == number
  guess = gets.to_i
  puts 'Too low' if guess < number
  puts 'Too high' if guess > number
end
puts 'You guessed it!'
