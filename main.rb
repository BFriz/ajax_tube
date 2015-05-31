require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'
require 'pry'


 # root to /videos
 get "/" do 
  redirect to ("/videos")
end

 # index method (show all the videos)
 get "/videos" do
  @videos = run_sql("select * FROM videos ORDER BY artist")
  erb :index
end

# post "/videos" do 
#   artist = params[:artist]
#   title = params[:title]
#   description = params[:description]
#   category = params[:category]
#   genre = params[:genre]
#   url = params[:url]
#   sql = "INSERT INTO videos (artist, title, description, category, genre, url, views) VALUES (#{sql_string(artist)}, #{sql_string(title)}, #{sql_string(description)}, '#{category}','#{genre}', '#{url}', 0);"
#   run_sql(sql)
#   redirect to ("/videos")
# end

# method to pass the sql statments into sql
def run_sql(sql)
  conn = PG.connect(dbname: "ajaxTube", host: "localhost")
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end


# method to ensure sql can accept text with single quotes when adding/editing videos
def sql_string(value)
  "'#{value.gsub("'", "''")}'"  
end