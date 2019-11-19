# ASSESSMENT 5: INTRO TO RAILS
# Coding practical questions

# 1. Create a method called hello_world that takes a language code (e.g. "es", "de", "ru", "ja") as an argument and returns the appropriate version of "Hello, World" for the given language. The default should be English. Test your code with THREE method calls. Expected output for hello_world 'es': 'Hola Mundo', hello_world 'de': 'Hallo Welt'
def hello_world (language_code = 'en')
  case
  when language_code == 'es' then puts 'Hola Mundo'
  when language_code == 'de' then puts 'Hallo Welt'
  when language_code == 'en' then puts "Hello, World"
  end
end

# test calls
hello_world
hello_world('es')
hello_world('de')
hello_world('es')


# 2a. Create a method called assign_grade that takes a number as an argument and returns the corresponding letter grade. Test your code with THREE method calls. Expected output for assign_grade 96: 'A', assign_grade 75: 'C'

def assign_grade (num)
  case
  when num >= 89 then puts 'A'
  when num >= 79 then puts 'B'
  when num >= 69 then puts 'C'
  when num >59 then puts 'D'
  when num <59 then puts 'Fail!'
  end
end

assign_grade(96)
assign_grade(88)
assign_grade(75)
assign_grade(60)
assign_grade(55)


# 2b. STRETCH: Create exceptions to your method if the number passed is less than 0 or greater than 100. Copy and paste the original code below to add the exceptions.

def assign_grade (num)
  case
  when num > 100 then puts "Error. 100 is the maximum grade"
  when num >= 89 then puts 'A'
  when num >= 79 then puts 'B'
  when num >= 69 then puts 'C'
  when num >59 then puts 'D'
  when num <0 then puts "Error. Grade can't be negative"
  when num <59 then puts 'Fail!'
  end
end

assign_grade(101)
assign_grade(-2)


# 3a. Create a method called pluralizer that takes 2 arguments - a singular noun and a number - and returns the number and the pluralized form of the noun, if necessary. Test your code with THREE method calls. Expected output of pluralizer(5, cat): '5 cats', expected output of pluralizer(1, dog): '1 dog'

def pluralizer(num, noun)
  if num == 1
    puts "#{num} #{noun}"
  elsif num > 1
    puts "#{num} #{noun}s"
  else
    puts "Error. Expecting positive number."
  end
end

pluralizer(1, 'dog')
pluralizer(5, 'cat')
pluralizer(-1, 'dog')


# 3b. STRETCH: Pick three nouns with irregular pluarlization like sheep, goose/geese, child/children, person/people, crossroads, pants and add the exceptions to your code. Copy and paste the original code below to add the exceptions.

def pluralizer2(num, noun)
  if num == 1
    case
    when noun == 'crossroad' then puts "#{num} crossroads"
    when noun == 'pant' then puts "#{num} pants"
    else puts "#{num} #{noun}"
 end
  elsif num > 1
    case
    when noun == 'sheep' then puts "#{num} #{noun}"
    when noun == 'goose' then puts "#{num} geese"
    when noun == 'child' then puts "#{num} children"
    when noun == 'person' then puts "#{num} people"
    else puts "#{num} #{noun}s"
    end
  else
    puts "Error. Expecting positive number."
  end
end

pluralizer2(1, 'dog')
pluralizer2(1, 'crossroad')
pluralizer2(1, 'pant')
pluralizer2(-1, 'sheep')
pluralizer2(3, 'sheep')
pluralizer2(3, 'goose')
pluralizer2(3, 'child')
pluralizer2(21, 'person')
pluralizer2(1, 'person')
