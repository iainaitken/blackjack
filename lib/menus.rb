def display_hit_or_stick_menu
  puts "--Hit or Stick---"
  puts "1. Hit"
  puts "2. Stick"
  puts "-----------------"
end

def display_end_menu
  puts "---Round Over----"
  puts "1. New round"
  puts "2. Save game"
  puts "3. Main menu"
  puts "4. Exit"
  puts "-----------------"
end

def display_main_menu
  puts "\nWelcome to Blackjack!"
  puts "\n----Main Menu----"
  puts "1. New game"
  puts "2. Load game"
  puts "3. Exit"
  puts "-----------------"
end

def display_options_menu
  puts "-----Options-----"
  puts "1. Split"
  puts "2. Double"
  puts "3. Insurance"
  puts "4. None of the above"
  puts "-----------------"
end

def end_menu
  loop do
    display_end_menu
    process_end(user_input)
  end
end

def hit_or_stick_menu
  loop do
    display_hit_or_stick_menu
    process_hit_or_stick(user_input)
  end
end

def main_menu
  loop do
    display_main_menu
    if process_main(user_input) == "new round"
      round_loop
    end
  end
end

def options_menu
  display_options_menu
  process_options(user_input)
end

def process_end(selection)
  case selection
    when "1"
      round_loop
    when "2"
      # save game
    when "3"
      main_menu
    when "4"
      exit
    else
      puts "Please try again"
  end
end

def process_hit_or_stick(selection)
  case selection
    when "1"
      hit
    when "2"
      # dealer turn
    else
      puts "Please try again"
  end
end

def process_main(selection)
  case selection
    when "1"
      new_game
    when "2"
      load_game
    when "3"
      end_game
    else
      puts "Please try again"
  end
end

def process_options(selection)
  case selection
    when "1"
      split
    when "2"
      double
    when "3"
      # to do
    when "4"
      return
    else
      puts "Please try again"
  end
end

def round_menu
  # to do
end
