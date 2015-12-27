class CongressmanAnalyzer
  def initialize(congressman)
    @congressman = congressman
  end


  # Returns:
  #
  # [
  #   {
  #     question => {
  #       mean: Float,
  #       median: Float,
  #       standard_deviation: Float
  #     }
  #   }
  # ]

  def analyze
    results = answers_group_by_question.map do |question, answers|
      {
        question => {
          mean: mean(answers),
          median: median(answers),
          standard_deviation: standard_deviation(answers)
        }
      }
    end
  end

  private

  # References:
  # https://books.google.com.tw/books?id=JeqjQc_ikPUC&pg=PA62&lpg=PA62&dq=ruby+standard+deviation+of+array&source=bl&ots=Zh2yPuGmZR&sig=8er5RIFjm2vcsixoTf7kWNVgLMs&hl=zh-TW&sa=X&ved=0ahUKEwjqrrHcx6TJAhXCOJQKHWOECYM4ChDoAQgzMAQ#v=onepage&q=ruby%20standard%20deviation%20of%20array&f=false

  def mean(answers)
    answers.sum(&:point).to_f / answers.count
  end

  def median(answers)
    sorted_points = answers.map(&:point).sort
    mid = answers.size/2
    sorted_points[mid]
  end

  def standard_deviation(answers)
    points = answers.map(&:point)
    m = mean(answers)
    variance = points.inject(0) { |variance, x| variance += (x - m) ** 2 }

    Math.sqrt(variance/(points.size-1))
  end

  def answers_group_by_question
    @answers_group_by_question ||= @congressman.answers.group_by(&:question)
  end

end
