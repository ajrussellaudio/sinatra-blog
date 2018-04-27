require("minitest/autorun")
require("minitest/rg")
require("date")

require_relative("../comment")

class CommentTest < MiniTest::Test

  def setup
    @sample_text = "This is a test comment."
    @comment = Comment.new({
      "body" => @sample_text,
      "posted_on" => Date.today.to_s,
      "post_id" => "1"
    })
  end

  def test_has_body
    assert_equal(@sample_text, @comment.body)
  end

  def test_has_date
    assert_equal(Date.today, @comment.posted_on)
  end

  def test_has_post_id
    assert_equal(1, @comment.post_id)
  end

  def test_has_id
    assert_equal(0, @comment.id)
  end

  def test_can_edit_comment
    new_text = "Changed text"
    @comment.body = new_text
    assert_equal(new_text, @comment.body)
  end

end
