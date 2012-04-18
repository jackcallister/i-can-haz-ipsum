require 'rubygems'
require 'sinatra'
require 'shotgun'

helpers do
  def generate_sentance
    # 
  end
end

get '/' do
	erb :index
end