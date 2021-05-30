class HiScore
  def self.add_score(score)
    @scores ||= []
    @scores << score
  end

  def self.scores
    @scores ||= []
    @scores
  end

  def self.view_scores
    puts 'Game Hi Scores'
    puts
    puts 'No results yet' if scores.size.zero?
    scores.each do |score|
      puts "nickname: #{score[:nickname]} wins: #{score[:wins]}"
    end
  end
end
