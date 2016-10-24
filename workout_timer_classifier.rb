#!/usr/bin/env ruby

require_relative 'workout_timer_classifier/nlp'
require 'pry'

module WorkoutTimerClassifier

  WORK_KEYWORDS     = %w(work on)
  REST_KEYWORDS     = %w(off rest)
  ROUNDS_KEYWORDS   = %w(rounds times x)
  TIME_KEYWORDS     = [WORK_KEYWORDS, REST_KEYWORDS]

  MINUTES_KEYWORDS  = %w(minutes min m)
  SECONDS_KEYWORDS  = %w(seconds sec s)

  class << self
    def create_workout(query)
      nlp = NLP.new(query)
      puts nlp.parse
      nlp.parse
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  WorkoutTimerClassifier.create_workout(ARGV[0])
end
