require("minitest/autorun")
require_relative("../pettype")

class TestPetType < MiniTest::Test

  def setup
    options = {"pet_type" => "Dog" }

    @pettype = PetType.new(options)
  end

  def test_pet_type()
    result = @pettype.pet_type()
    assert_equal("Dog", result)
  end

end
