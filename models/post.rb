require("date")

class Post
  attr_reader :id, :date
  attr_accessor :title, :body

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @body = options["body"]
    @date = Date.parse(options["date"])
  end
end
