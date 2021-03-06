class Comment

  attr_reader :posted_on, :post_id, :id
  attr_accessor :body

  def initialize(options)
    @id = options["id"].to_i
    @body = options["body"]
    @post_id = options["post_id"].to_i
    if options["posted_on"]
      @posted_on = Date.parse(options["posted_on"])
    else
      @posted_on = Date.today
    end
  end

  def save
    sql = "INSERT INTO comments (body, posted_on, post_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@body, @posted_on, @post_id]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def get_post
    sql = "SELECT * FROM posts WHERE id = $1"
    values = [@post_id]
    results = SqlRunner.run(sql, values)
    return Post.new(results.first)
  end

  def delete
    sql = "DELETE FROM comments WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM comments"
    results = SqlRunner.run(sql)
    return results.map { |result| Comment.new(result) }
  end

  def self.find(id)
    sql = "SELECT * FROM comments WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Comment.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM comments"
    SqlRunner.run(sql)
  end

end
