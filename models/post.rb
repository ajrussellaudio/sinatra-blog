class Post
  attr_reader :date
  attr_accessor :title, :body

  def initialize(title, body, date)
    @title = title
    @body = body
    @date = date
  end
end
