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
        find_keywords || find_num
      end

      def find_keywords
        kw = (tokens & TimeKeywords::SHORTHANDS).first
        KEYWORD_MAPPING[kw]
      end

      def find_num
        phrase.match(RegEx::NUMBERS).to_s
      end

      def tokens
        phrase.scan(RegEx::NUMBERS_OR_WORDS)
      end

      def phrase
        @phrase
      end
    end
  end
end
