require 'rubygems'
require 'sinatra'
require 'shotgun'

helpers do
  
  def generate_paragraphs
  	db = ["kitty", "cat", "lol", "haz"]
		requested_paragraphs = "#{params[:post][:requested]}".to_i
		paragraphs = []

		until requested_paragraphs == 0 #Make paragraphs of sentences

			number_of_sentences = rand(10) + 3
			init_number_of_sentences = number_of_sentences
			paragraph = ""

			until number_of_sentences == 0 #Make sentences of words

				sentence_size = rand(40) + 5
				init_sentence_size = sentence_size
				sentence = ""

				until sentence_size == 0
					pull = db[rand(db.size)] 
					
					if sentence_size == init_sentence_size && number_of_sentences == init_number_of_sentences 
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
				number_of_sentences = number_of_sentences - 1

			end	

			paragraphs.push(paragraph)
			requested_paragraphs = requested_paragraphs - 1

		end  
		paragraphs
  end

end

get '/' do
	erb :form
	
end

post '/' do
	generate_paragraphs

end