require_relative("../models/post")
require_relative("../models/comment")
require("pry-byebug")

Post.delete_all

post1 = Post.new({
  "title" => "First Post",
  "body" => "Lorem ipsum dolor sit amet, eos ei everti volutpat convenire. No viris noluisse argumentum sea. Ne sit causae apeirian accusamus, sed case ullum quando ei. Civibus accommodare at vis.",
  "posted_on" => Date.today.to_s
})

post2 = Post.new({
  "title" => "Second Post",
  "body" => "Ridens audire saperet an mei. Te dicam perfecto vis. Per prompta impedit imperdiet et, ei sea idque quidam impedit, nisl zril praesent te mel. Verterem vituperatoribus ad qui. Mei partiendo consulatu an.",
  "posted_on" => Date.today.to_s
})

post1.save
post2.save

comment1 = Comment.new({
  "body" => "Rubbish.",
  "posted_on" => Date.today.to_s,
  "post_id" => post1.id
})

comment2 = Comment.new({
  "body" => "I agree.",
  "posted_on" => Date.today.to_s,
  "post_id" => post1.id
})

comment3 = Comment.new({
  "body" => "lol",
  "posted_on" => Date.today.to_s,
  "post_id" => post2.id
})

comment4 = Comment.new({
  "body" => "Delete your blog",
  "posted_on" => Date.today.to_s,
  "post_id" => post2.id
})

comment1.save
comment2.save
comment3.save
comment4.save

binding.pry
nil
