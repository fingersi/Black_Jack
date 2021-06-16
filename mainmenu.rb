class MainMenu

  def initialize
    action_select
  end

  MAINMENU = { '1' => { 'action' => 'new_game', 'text' => 'Start new game' },
               '2' => { 'action' => 'hi_score', 'text' => 'Hi score' },
               '0' => { 'action' => 'exit', 'text' => 'quit' } }.freeze

  def show_menu
    puts ''
    MAINMENU.each { |key, value| puts "  For #{value['text']} enter - #{key}" }
    puts ''
  end

  def action_select
    intro
    loop do
      show_menu
      user_input = gets.chomp
      break if user_input == '0'

      if !MAINMENU.select { |key| key == user_input }.empty?
        begin
          run_action(MAINMENU[user_input])
        rescue StandardError => error
          puts ''
          puts 'ExceptionHadler'
          puts "Exception Class: #{error.class.name}"
          puts "Exception Message: #{error.message}"
          puts "Exception Backtrace: #{error.backtrace}"
          puts ''
        end
      else
        puts 'Cannot get you you. '
      end
    end
  end

  def run_action(hash)
    send(hash['action']) unless hash['action'].nil?
  end

  def new_game
    Interface.new
  end

  def hi_score
    HiScore.view_scores
  end

  def intro
    puts 'Welcome to Black Jack game'
  end

  def exit
    puts 'bye bye'
  end
end
