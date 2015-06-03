require 'sinatra'
require 'haml'
require './lib/PostRepository'
require 'json'

class Rlog < Sinatra::Application
  posts = PostRepository.new

  get '/' do
    haml :hello
  end
  
  get '/posts/:id' do |id|
    posts.getById(id).to_json
  end
end
