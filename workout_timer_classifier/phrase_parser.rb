module WorkoutTimerClassifier
  class PhraseParser
    class << self
      def parse_phrase(phrase)
        @phrase = phrase
        parsed_phrase
      end

      def parsed_phrase
        num
      end

      def num
        phrase.match(/\d+/).to_s
      end

      def phrase
        @phrase
      end
    end
  end
end
