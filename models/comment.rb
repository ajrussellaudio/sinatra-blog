class Comment

  attr_reader :body

  def initialize(options)
    @body = options["body"]
  end

end
