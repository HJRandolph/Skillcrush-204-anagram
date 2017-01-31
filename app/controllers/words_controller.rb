get '/words' do
	@word = Word.all
	erb :"/words/index"
end

get '/words/new' do
	@word = Word.new
	erb :"/words/new"
end


post '/words' do
	word = Word.create(text: params[:text]).downcase
	redirect "words/#{word.id}"
end

get '/words/:id/edit' do
	@word = Word.find(params[:id])
	erb :"words/edit"
end


get '/words/:id' do
	@word = Word.find(params[:id])
	erb :"/words/show"
end	

put '/words/:id' do
	@word = Word.find(params[:id])
	@word.save
	erb :"/words/show"
end
