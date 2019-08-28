require("minitest/autorun")
require_relative("../owner")

class TestOwner < MiniTest::Test

  def setup
    options = {"name" => "Kevin White", "mobile" => "123456" }

    @owner = Owner.new(options)
  end

  def test_name()
    result = @owner.name()
    assert_equal("Kevin White", result)
  end

  def test_mobile()
    result = @owner.mobile()
    assert_equal("123456", result)
  end

end
