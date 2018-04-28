get "/admin" do
  @posts = Post.all
  erb(:"admin/index")
end

get "/admin/new" do
  erb(:"admin/new")
end

get "/admin/:id" do
  @post = Post.find(params[:id])
  erb(:"admin/edit")
end

post "/admin" do
  post = Post.new(params)
  post.save
  redirect to "/admin"
end

post "/admin/:id/edit" do
  post = Post.new(params)
  post.update
  redirect to "/posts/#{post.id}"
end

post "/admin/:id/delete" do
  post = Post.find(params[:id])
  post.delete
  redirect to "/admin"
end
