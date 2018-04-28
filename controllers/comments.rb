require("pry-byebug")

post "/comments" do
  comment = Comment.new(params)
  comment.save
  redirect to "/posts/#{params["post_id"]}"
end
