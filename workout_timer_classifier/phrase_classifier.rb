require 'stuff-classifier'

module WorkoutTimerClassifier
  class PhraseClassifier

    def initialize
      classifier.ignore_words = []
      classifier.train(:rest, REST_KEYWORDS.join('. '))
      classifier.train(:work, WORK_KEYWORDS.join('. '))
      classifier.train(:rounds, ROUNDS_KEYWORDS.join('. '))
    end

    def classify(phrase)
      classifier.classify(phrase)
    end

    def classifier
      @classifier ||= StuffClassifier::Bayes.new('Workout Timer')
    end
  end
end
