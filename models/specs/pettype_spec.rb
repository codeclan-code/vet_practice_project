require("minitest/autorun")
require_relative("../pettype")

class TestPetType < MiniTest::Test

  def setup
    options = {"pet_type" => "Dog", "pet_image" => "/images/snake.jpg" }

    @pettype = PetType.new(options)
  end

  def test_pet_type()
    result = @pettype.pet_type()
    assert_equal("Dog", result)
  end

  def test_pet_image()
    result = @pettype.pet_image()
    assert_equal("/images/snake.jpg", result)
  end

end
