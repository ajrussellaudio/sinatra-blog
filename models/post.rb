require("date")
require_relative("../db/sql_runner")

class Post
  attr_reader :id, :date
  attr_accessor :title, :body

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @body = options["body"]
    @date = Date.parse(options["date"])
  end

  def save
    sql = "INSERT INTO posts (title, body) VALUES ($1, $2) RETURNING id"
    values = [@title, @body]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end
end
