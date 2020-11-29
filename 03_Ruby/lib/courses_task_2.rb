def fizzbuzz(num)
  array = (1..num).to_a
  array.each { |n| 
    if n % 15 == 0
      puts 'FizzBuzz'
    elsif n % 5 == 0
      puts 'Buzz'
    elsif n % 3 == 0
      puts 'Fizz'
    else
      puts n
    end
  }
end
p fizzbuzz(20)