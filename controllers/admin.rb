get "/admin" do
  @posts = Post.all
  erb(:"admin/index")
end

get "/admin/new" do
  erb(:"admin/new")
end

post "/admin" do
  post = Post.new(params)
  post.save
  redirect to "/admin"
end

post "/admin/:id/delete" do
  post = Post.find(params[:id])
  post.delete
  redirect to "/admin"
end
