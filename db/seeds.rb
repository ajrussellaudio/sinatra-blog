require_relative("../models/post")
require("pry-byebug")

Post.delete_all

post1 = Post.new({
  "title" => "First Post",
  "body" => "Lorem ipsum dolor sit amet, eos ei everti volutpat convenire. No viris noluisse argumentum sea. Ne sit causae apeirian accusamus, sed case ullum quando ei. Civibus accommodare at vis.",
  "date" => Date.today.to_s
})

post2 = Post.new({
  "title" => "Second Post",
  "body" => "Ridens audire saperet an mei. Te dicam perfecto vis. Per prompta impedit imperdiet et, ei sea idque quidam impedit, nisl zril praesent te mel. Verterem vituperatoribus ad qui. Mei partiendo consulatu an.",
  "date" => Date.today.to_s
})

post1.save
post2.save

binding.pry
nil
