get '/' do
	erb :index
end


#Determine if the input is a three letter word 
def three_letters?(input)
	if input.length <= 3
		true
	else
		false
	end
end

#Determine that the words does not have repeating letters
def distinct_letters?(input)
	letter_array = input.chars
	unique_letters = letter_array.uniq
	
		if unique_letters.length < letter_array.length
			false
		else
			true
		end
end

#Combine the previous two checks
def valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
      true
    else
      false
    end
end



get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	erb :show
end

post '/' do
	@word = params[:word]
	if valid_input?(@word)
	redirect "/anagrams/#{@word}"
	else 

	@error = "Words must be three letters long and cannot contain duplicate letters."
	erb :index
	end
end