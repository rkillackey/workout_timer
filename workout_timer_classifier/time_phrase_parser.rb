module WorkoutTimerClassifier
  class TimePhraseParser < PhraseParser
    class << self
      def parsed_phrase
        num + ' ' + length
      end

      def tokens
        phrase.scan(/\d|\w+/)
      end

      def length
        return 'minutes' if (MINUTES_KEYWORDS & tokens).length > 0
        return 'seconds' if (SECONDS_KEYWORDS & tokens).length > 0
      end
    end
  end
end
