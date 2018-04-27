class Post
  attr_reader :title, :body, :date

  def initialize(title, body, date)
    @title = title
    @body = body
    @date = date
  end
end
