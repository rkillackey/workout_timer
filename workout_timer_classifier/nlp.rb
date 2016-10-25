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
    end

    def parse
      validate_input
      correct_case
      parse_phrases
    end

    private

    def correct_case
      @query_array.each_with_index do |q, i|
        @query_array[i] = q.downcase
      end
    end

    def invalid?
      @query_array.empty? || @query_array.nil? || @query_array.length != 3
    end

    def parse_phrases
      output = {}
      @query_array.each do |query|
        phrase_type = PhraseClassifier.new.classify(query)
        parser = time_phrase(phrase_type, query) ? PhraseParser : TimePhraseParser
        phrase = parser.parse_phrase(query)
        output.merge!(phrase_type => phrase)
      end
      output
    end

    def split_query
      @query_array = @query.split(',').collect(&:strip)
    end

    def time_phrase(type, query)
      type == :rounds || query.match(RegEx::NUMBERS).nil?
    end

    def validate_input
      raise empty_query_message if @query_array.empty? || @query_array.nil?
      raise incorrect_query_structure if @query_array.length != 3
    end

    def empty_query_message
      'Please provide an interval input'
    end

    def incorrect_query_structure
      'Please provide an exercise time, a rest time, and a number of rounds, separated by commas.'
    end
  end
end
