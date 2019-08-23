require("minitest/autorun")
require_relative("../pet")

class TestPizzaOrder < MiniTest::Test

  def setup
    options = {"name" => "Pixie", "date_of_birth" => "12.12.12",
    "pet_type" => "Snake", "owner_name" => "Mr Thomas", "owner_mobile" => "1234567890"}

    @pet = Pet.new(options)
  end

  def test_name()
    result = @pet.name()
    assert_equal("Pixie", result)
  end

  def test_date_of_birth()
    result = @pet.date_of_birth()
    assert_equal("12.12.12", result)
  end

  def test_pet_type()
    result = @pet.pet_type()
    assert_equal("Snake", result)
  end

  def test_owner_name()
    result = @pet.owner_name()
    assert_equal("Mr Thomas", result)
  end

  def test_owner_mobile()
    result = @pet.owner_mobile()
    assert_equal("1234567890", result)
  end


end
