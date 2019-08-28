require("minitest/autorun")
require_relative("../vet")

class TestVet < MiniTest::Test

  def setup
    options = {"name" => "Dr Henderson", "mobile" => "123456" }

    @vet = Vet.new(options)
  end

  def test_name()
    result = @vet.name()
    assert_equal("Dr Henderson", result)
  end

  def test_mobile()
    result = @vet.mobile()
    assert_equal("123456", result)
  end

end
