require_relative 'reverse_letters'

def find_anagram(string)
	#Change word into string
	letters = string.split(//)
	
	#Put string into an array
	anagrams = []
	
	#Loop through each letter
	letters.each do |letter|
	
	#Choose remaining letters
	remaining = letters.select { |l| l != letter }
	
	#Make new word by combining letter and remaining letters
	#Add the new letter to the array
	anagrams << letter + remaining.join('')
	
	#Make new word by combining letter and the reverse of the remaining letters
	#Add the new letter to the array
	anagrams << letter + reverse_letters(remaining).join('')
	end

#Return anagrams in array
anagrams

end


#Used GitHub user BeckyBair's solution as a guide