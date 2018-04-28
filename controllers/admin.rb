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
