get '/words' do
	@word = Word.all
	erb :"/words/index"
end

get '/words/new' do
	erb :"/words/new"
end

get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end	

post '/words' do
	word = Word.create(text: params[:new_word])
	redirect "words/#{word.id}"
end