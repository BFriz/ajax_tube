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