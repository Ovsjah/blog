module Proper
  extend ActiveSupport::Concern

  def proper?(str)
    return unless str
    words = str.split
    first = words.first
    second = words.second

    (words.size == 2 && first.size >= 2 && first_two_letters?(first) &&
      second.size >= 2 && first_two_letters?(second) ||
      words.size > 2) && str.include?('.')
  end

  def first_two_letters?(word)
    word.match?(/[A-Za-z]{2,}/)
  end
end
