puts '--- Welcome to Magic 8 Ball ---'


@default_answers = [
  "It's certain",
  "It's decidedly so",
  "Without a doubt",
  "Yes, definitely",
  "You may rely on it",
  "As I see it, yes",
  "Most likely",
  "Outlook good",
  "Yes",
  "Signs point to yes",
  "Try again",
  "Ask me later",
  "Cannot predict now",
  "Do not count on it",
  "My sources say no",
  "My reply is no",
  "Outlook isn't so good",
  "Very doubtful"
]

@clone = @default_answers.clone

def main_menu
  puts 'Select one of the following'
  puts '1. Ask Question(s)'
  puts '2. Add Answer(s)'
  puts '3. Quit'
  menu_selection
end

def menu_selection
  select = gets.strip.downcase
  case select
  when '1', 'ask', 'ask question', 'ask questions', 'ask question(s)'
    ask_questions
  when '2', 'add', 'add answer', 'add answer(s)'
    add_answers
  when '3', 'quit', 'stop', 'exit'
    puts 'Thank you for playing!'
    exit(0)
  else
    puts 'Please select a valid option.'
  end
end


def ask_questions
  puts 'Ask the ball whatever you would like, quit to end program.'
  question = gets.strip.downcase
  should_quit?(question)
  puts @clone.sample
  puts '---------------------------'
  ask_again
end

def ask_again
  puts 'Ask another question? (yes/no)'
  another = gets.strip.downcase
  case another
  when 'yes', 'y', 'yeah'
    ask_questions
  when 'no', 'n', 'nope'
    main_menu
  else
    puts 'Insert valid input'
    ask_again
  end
end

# def add_answers
#   puts 'Add an answer!'
#   add = gets.strip
#   @clone << add
#   add_another
# end

def add_answers
  puts 'Add an answer!'
  add = gets.strip
  if
    @clone.include?(add) == true
    puts 'Already an option, add someething else'
  else
    @clone << add
    puts "#{add} successfully added"
  end
  add_another
end

def add_another
  puts 'Add another answer? (yes/no)'
  another = gets.strip.downcase
  case another
  when 'yes', 'y', 'yeah'
    add_answers
  when 'no', 'n', 'nope'
    main_menu
  else
    puts 'Insert valid input'
    add_another
  end
end

def should_quit?(thing)
  if thing == 'quit'
    puts 'Thank you for playing!'
    exit(0)
  end
end


def loop
  main_menu
  loop
end


loop



# -- BONUS --
# *ability to add more answers:
# via easter egg question("add_answers")
# do not let them add the same answer if the eightball already has it
# ability to reset answers back to original bank(hint: think arr.clone)
# via easter egg questoin ("reset_answers")
# ability to have eightball print answers
# via easter egg question ("print_answers")
