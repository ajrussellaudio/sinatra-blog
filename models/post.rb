require("date")
require_relative("../db/sql_runner")
require_relative("./comment")

class Post
  attr_reader :id, :posted_on
  attr_accessor :title, :body

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @body = options["body"]
    @posted_on = Date.parse(options["posted_on"]) if options["posted_on"]
  end

  def save
    sql = "INSERT INTO posts (title, body, posted_on) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @body, @posted_on]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def comments
    sql = "SELECT * FROM comments WHERE post_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Comment.new(result) }
  end

  def self.all
    sql = "SELECT * FROM posts"
    results = SqlRunner.run(sql)
    return results.map { |result| Post.new(result) }
  end

  def self.delete_all
    sql = "DELETE FROM posts"
    SqlRunner.run(sql)
  end
end
