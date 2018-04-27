require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/post")

get "/" do
  @posts = Post.all
  erb(:"posts/index")
end
