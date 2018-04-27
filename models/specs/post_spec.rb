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

  def test_can_edit_title
    @post.title = "Edited title"
    assert_equal("Edited title", @post.title)
  end

  def test_can_edit_body
    new_text = "Ridens audire saperet an mei. Te dicam perfecto vis. Per prompta impedit imperdiet et, ei sea idque quidam impedit, nisl zril praesent te mel. Verterem vituperatoribus ad qui. Mei partiendo consulatu an."
    @post.body = new_text
    assert_equal(new_text, @post.body)
  end
end
