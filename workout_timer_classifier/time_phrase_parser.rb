module WorkoutTimerClassifier
  class TimePhraseParser < PhraseParser
    class << self
      def parsed_phrase
        num + ' ' + length
      end

      def num
        find_num
      end

      def length
        return 'minutes' if (TimeKeywords::MINUTES & tokens).length > 0
        return 'seconds' if (TimeKeywords::SECONDS & tokens).length > 0
      end
    end
  end
end
