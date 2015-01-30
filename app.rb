require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
also_reload("lib/**/*.rb")


get '/' do
  @bands = Band.all
  @venues = Venue.all
  erb :index
end

post '/band' do
  name = params[:name]
  Band.create(:name => name)
  redirect back
end

post '/venue' do
  name = params[:name]
  Venue.create(:name => name)
  redirect back
end

get '/band/:id' do
  @band = Band.find(params[:id])
  @venues = Venue.all
  erb :venue
end

delete '/delete_band/:id' do
  band_to_delete = Band.find(params[:id])
  band_to_delete.destroy
  redirect '/'
end

patch '/edit_band/:id' do
  band_to_edit = Band.find(params[:id])
  band_to_edit.update(:name => params[:name])
  redirect back
end

patch '/venue/:id' do
  @band = Band.find(params[:id])
  @venue_ids = params[:venue_ids]
  @venue_ids.each do |id|
    v = Venue.find(id)
    @band.venues << v
  end
  redirect back
end
