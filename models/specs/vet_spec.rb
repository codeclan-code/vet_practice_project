require("minitest/autorun")
require_relative("../vet")

class TestPizzaOrder < MiniTest::Test

  def setup
    options = {"name" => "Dr Henderson" }

    @vet = Vet.new(options)
  end

  def test_name()
    result = @vet.name()
    assert_equal("Dr Henderson", result)
  end

end
