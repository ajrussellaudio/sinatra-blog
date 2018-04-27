require("minitest/autorun")
require("minitest/rg")
require("date")

require_relative("../post")

class PostTest < MiniTest::Test
  def setup
    @lorem = "Lorem ipsum dolor sit amet, eos ei everti volutpat convenire. No viris noluisse argumentum sea. Ne sit causae apeirian accusamus, sed case ullum quando ei. Civibus accommodare at vis."
    @post = Post.new("Test Post", @lorem, Date.today)
  end

  def test_has_title
    assert_equal("Test Post", @post.title)
  end

  def test_has_body
    assert_equal(@lorem, @post.body)
  end

  def test_has_date
    assert_equal(Date.today, @post.date)
  end
end
