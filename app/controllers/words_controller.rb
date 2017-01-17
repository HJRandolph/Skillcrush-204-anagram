get '/words' do
	@word = Word.all
	erb :"/words/index"
end


get '/words/:word' do
	@word = Word.find_by_text(params[:word])
	erb :"/words/show"
end

		
