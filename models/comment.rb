class Comment

  attr_reader :posted_on, :post_id, :id
  attr_accessor :body

  def initialize(options)
    @id = options["id"].to_i
    @body = options["body"]
    @posted_on = Date.parse(options["posted_on"])
    @post_id = options["post_id"].to_i
  end

end
