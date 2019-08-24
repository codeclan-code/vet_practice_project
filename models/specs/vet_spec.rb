require("minitest/autorun")
require_relative("../vet")

class TestVet < MiniTest::Test

  def setup
    options = {"name" => "Dr Henderson" }

    @vet = Vet.new(options)
  end

  def test_name()
    result = @vet.name()
    assert_equal("Dr Henderson", result)
  end

end
