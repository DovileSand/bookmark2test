ENV['RACK-ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :session, true

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/saving' do
    Link.new(url:params[:url], title:params[:title], )
    Tag.create(name:params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  run! if app_file == $0

end
