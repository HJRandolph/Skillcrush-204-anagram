get '/' do
	erb :index
end


#Determine if the input is a three letter word 
#def three_letters?(input)
#	if input.length <= 3
#		true
#	else
#		false
#	end
#end

#Determine that the words does not have repeating letters
#def distinct_letters?(input)
#	letter_array = input.chars
#	unique_letters = letter_array.uniq
	
#		if unique_letters.length < letter_array.length
#			false
#		else
#			true
#		end
#end

#Combine the previous two checks
#def valid_input?(input)
 #   if three_letters?(input) && distinct_letters?(input)
  #    true
   # else
    #  false
   # end
#end

#Refactor valid_input
def valid_input(input)
	letter_array = input.chars
	unique_letters = letter_array.uniq
	
	if input.length != 3
		raise Exception.new("Word must equal three characters.")
	elsif unique_letters.length < letter_array.length
		raise Exception.new("Word must not contain duplicate letters.")
	end
	
end

#get '/anagrams/:word' do
#	@word = params[:word]
#	word_array = @word.chars.sort
#	alphabetized_string = word_array.join
#	@anagrams = Word.where("letters=?", alphabetized_string)
#	erb :show
#end



get '/anagrams/:word' do
	@word = params[:word]
	word_array = @word.chars.sort
	alphabetized_string = word_array.join
	@anagrams = Word.where("letters=?", alphabetized_string)
	erb :show
end


get '/anagrams/' do
	erb :index
end

post '/' do
	@word = params[:word]
	begin valid_input(@word)
	redirect "/anagrams/#{@word}"
	rescue Exception => error
	@error = error.message
	erb :index
	end
end

get '/anagrams/:word' do
	@word = params[:word]
	word_array = @word.chars.sort
	alphabetized_string = word_array.join
	@anagrams = Word.where("letters=?", alphabetized_string)
	erb :show
end