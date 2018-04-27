require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/post")

require_relative("./controllers/posts")

get "/" do
  @posts = Post.all
  erb(:"posts/index")
end
