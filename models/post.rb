require("date")
require_relative("../db/sql_runner")

class Post
  attr_reader :id, :date_posted
  attr_accessor :title, :body

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @body = options["body"]
    @date_posted = Date.parse(options["date_posted"]) if options["date_posted"]
  end

  def save
    sql = "INSERT INTO posts (title, body) VALUES ($1, $2) RETURNING id"
    values = [@title, @body]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
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
