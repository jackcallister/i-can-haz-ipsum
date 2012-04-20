require 'rubygems'
require 'sinatra'
require 'shotgun'

helpers do
  def generate_sentence
    db = ["kitty", "cat", "lol", "haz"]
		paragraph = ""
		requested_sentences = "#{params[:post][:requested]}".to_i
		init_requested_sentences = requested_sentences

		until requested_sentences == 0
			sentence_size = rand(40) + 20
			init_sentence_size = sentence_size
			sentence = ""
			until sentence_size == 0
				pull = db[rand(db.size)] 
				
				if sentence_size == init_sentence_size && requested_sentences == init_requested_sentences 
					sentence << pull.capitalize
				elsif sentence_size == init_sentence_size
					sentence << " " + pull.capitalize
				elsif sentence_size == 1
					sentence << " " + pull + "."
				else
					sentence << " " + pull 
				end
				
				sentence_size = sentence_size - 1
			end
			paragraph << sentence
			requested_sentences = requested_sentences - 1
		end
		@result = paragraph.to_s
  end
end

get '/' do
	erb :form
end

post '/' do
	generate_sentence
end