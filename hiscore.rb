class HiScore
  def self.add_score(score)
    puts "score: #{score}"
    @scores ||= []
    @scores << score
    puts "@scores #{@scoresS}"
  end

  def self.scores
    puts "@scores #{@scores}"
    @scores ||= []
    @scores
  end

  def self.view_scores
    @scores.each do |score|
      puts "nickname: #{score[:nickname]} wins: #{score[:wins]}"
    end
  end
end
