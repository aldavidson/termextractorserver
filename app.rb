require 'rubygems'
require 'sinatra'
require 'term-extractor'
require 'json'
require 'erb'
require 'builder'

TERM_EXTRACTOR = TermExtractor.new()
 

get '/' do
  'Hello world!'
end

get '/terms' do
  @terms = TERM_EXTRACTOR.extract_terms_from_text(params[:text])
  
  case params[:format]
    when 'xml'
      content_type 'application/xml', :charset => 'utf-8'
      builder :terms
    when 'json'
      content_type :json
      @terms.to_json
    else
      erb :terms
    end
end

post '/terms' do
  
  @terms = TERM_EXTRACTOR.extract_terms_from_text(params[:text])
  
  case params[:format]
    when 'xml'
      content_type 'application/xml', :charset => 'utf-8'
      builder :terms
    when 'json'
      content_type :json
      @terms.to_json
    else
      erb :terms
    end
end