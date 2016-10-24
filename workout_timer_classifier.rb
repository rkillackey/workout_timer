#!/usr/bin/env ruby

require_relative 'workout_timer_classifier/nlp'
require 'pry'

module WorkoutTimerClassifier
  module TimeKeywords
    WORK    = %w(work on)
    REST    = %w(off rest)
    ROUNDS  = %w(rounds times x once twice)
    MINUTES = %w(minutes min mins m)
    SECONDS = %w(seconds sec secs s)
    TIME_SHORTHANDS   = %w(once none no)
  end

  module RegEx
    NUMBERS          = /\d+/
    NUMBERS_OR_WORDS = /\d|\w+/
  end

  KEYWORD_MAPPING = {
    'no' => '0',
    'once' => '1',
    'twice' => '2'
  }

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
