require 'rubygems'
require 'sinatra'
require 'term-extractor'
require 'json'
require 'erb'
require 'builder'

def term_extractor
  Thread.current['term-extractor'] ||= TermExtractor.new 
end 

def do_extraction
  @terms = term_extractor.extract_terms_from_text(params[:text])
  
  case params[:format]
    when 'xml'
      content_type 'application/xml', :charset => 'utf-8'
      builder :terms
    when 'json'
      content_type :json
      @terms.map{ |t| term_to_hash(t) }.to_json
    else
      erb :terms
    end
end

def term_to_hash(t)
  {'term'=>t.to_s, 'pos'=>t.pos, 'sentence'=>t.sentence, 'chunks'=>t.chunks, 'tokens'=>t.tokens}
end


get '/' do
  'Hello world!'
end

get '/terms' do
  do_extraction
end

post '/terms' do
  do_extraction
end