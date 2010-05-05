require 'rubygems'
require 'term-extractor'
require 'singleton'

class TermExtractorWrapper
  include Singleton
  
  def initialize
    puts "initializing TermExtractor"
    @term_extractor = TermExtractor.new
  end
  
  def extract_terms_from_text( text )
    @term_extractor.extract_terms_from_text(text)
  end
  
end
