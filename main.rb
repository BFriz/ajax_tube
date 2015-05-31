require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry'
require 'pg'

# root to /videos
get "/" do
  # redirect to("/videos")
  erb :index
end

# index method (show all videos)
get "/videos" do
  sql = 'select * from videos'
  # @videos = run_sql("SELECT * FROM videos ORDER BY artist")
  @videos = run_sql(sql)
  if request.xhr?
    json @videos.to_a
  else
  erb :index    
  end
end

# new method (create step 1/2)
# get "/videos/new" do
#   erb :new
# end

post '/videos' do 
  sql = "insert into videos (name, details, url, genre) values ('#{params[:name]}', '#{params[:details]}', '#{params[:url]}', '#{params[:genre]}') returning *"
  @video = run_sql(sql).first
  if request.xhr?
    json @video
  else
    erb :index
  end
end

get '/videos/:id' do 
  sql = "select * from videos where id = #{params[:id]}"
  @video = run_sql(sql).first
  if request.xhr?
    json @video
  else
    erb :index
  end
end

put '/videos/:id' do
  sql = "update items set name='#{params[:name]}', details='#{params[:details]}', params='#{params[:genre]}' where id='#{params[:id]}'"
  run_sql(sql)
  if request.xhr?
    json [{status: :ok}]
  else
    redirect_to '/videos'
  end
end

private

def run_sql(sql)
  conn = PG.connect(dbname: 'ajaxTube', host: 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end