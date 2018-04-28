get "/admin" do
  @posts = Post.all
  erb(:"admin/index")
end
