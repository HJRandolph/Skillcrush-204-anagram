get '/dictionary' do
	@word = Word.all
	erb :"/dictionary/index"
end

get '/dictionary/new' do
	@word = Word.new
	erb :"/dictionary/new"
end


post '/dictionary' do
    @word = Word.create(text: params[:text])
    redirect "/dictionary/#{@word.id}"
  end


get '/dictionary/:id' do
	@word = Word.find(params[:id])
	erb :"/dictionary/show"
end	

get '/dictionary/:id/edit' do
	@word = Word.find(params[:id])
	erb :"dictionary/edit"
end


put '/dictionary/:id' do
	@word = Word.find(params[:id])
	@word.text = params[:text]
	@word.save
	erb :"/dictionary/show"
end

delete '/dictionary/:id' do
	word = Word.find(params[:id])
	word.delete
	redirect "/dictionary"
end