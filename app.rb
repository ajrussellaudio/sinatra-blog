require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/post")
require_relative("./models/comment")

require_relative("./controllers/posts")
require_relative("./controllers/comments")
require_relative("./controllers/admin")

get "/" do
  @posts = Post.all
  erb(:"posts/index")
end
