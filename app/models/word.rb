
class Word < ActiveRecord::Base
  before_save :add_letters
  
def add_letters
	characters = self.text.chars
	alphabetized_characters = characters.sort
	self.letters = alphabetized_characters.join
end

def self.find_anagrams(string)
	letters = string.split(//)	
	combos = []
	anagrams = []
	
		letters.each do |letter|
		remaining = letters.select { |l| l !=letter }
		
		combos << letter + remaining.join('')
		combos << letter + reverse_letters(remaining).join('')
		end
	
	combos.each do |word|
		if Word.find_by_text(word).present?
			anagrams << word
		end
	end
	anagrams = anagrams.uniq
	anagrams.delete_if { |copy| copy == input }
	anagrams
end

def self.reverse_letters(letters)
	
	length = letters.length
	reversed_letters = Array.new(length)
		
	letters.each_with_index do |letter, index|
	reversed_letters[length - index - 1] = letter
end
	
	reversed_letters
	
	end

end
