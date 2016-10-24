require 'stuff-classifier'

module WorkoutTimerClassifier
  class PhraseClassifier

    def initialize
      classifier.ignore_words = []
      classifier.train(:rest, TimeKeywords::REST.join('. '))
      classifier.train(:work, TimeKeywords::WORK.join('. '))
      classifier.train(:rounds, TimeKeywords::ROUNDS.join('. '))
    end

    def classify(phrase)
      classifier.classify(phrase)
    end

    def classifier
      @classifier ||= StuffClassifier::Bayes.new('Workout Timer')
    end
  end
end
