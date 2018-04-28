require("pry-byebug")

post "/comments" do
  comment = Comment.new(params)
  comment.save
  redirect to "/posts/#{params["post_id"]}"
end

post "/comments/:id/delete" do
  comment = Comment.find(params["id"])
  comment.delete
  redirect to "/posts/#{params["post_id"]}"
end
