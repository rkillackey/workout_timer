require 'json'
require_relative 'phrase_classifier'
require_relative 'phrase_parser'
require_relative 'time_phrase_parser'

module WorkoutTimerClassifier
  class NLP
    attr_reader   :query
    attr_accessor :query_array

    def initialize(query)
      @query = query.dup
      split_query
      validate_input
    end

    def parse
      parse_phrases(query_array)
    end

    private

    def split_query
      @query_array = @query.split(',').collect(&:strip)
    end

    def parse_phrases(query_array)
      output = {}
      query_array.each do |query|
        phrase_type = PhraseClassifier.new.classify(query)
        parser = phrase_type == :rounds ? PhraseParser : TimePhraseParser
        phrase = parser.parse_phrase(query)
        output.merge!(phrase_type => phrase)
      end
      output
    end

    def validate_input
      return empty_query_message if @query_array.empty? || @query_array.nil?
      return incorrect_query_structure if @query_array.length != 3
    end

    def empty_query_message
      'Please provide an interval input'
    end

    def incorrect_query_structure
      'Please provide an exercise time, a rest time, and a number of rounds, separated by commas.'
    end
  end
end
