require("minitest/autorun")
require_relative("../pet")

class TestPet < MiniTest::Test

  def setup
    options = {"name" => "Pixie", "date_of_birth" => "12.12.12",
      "pet_type_id" => "1", "owner_id" => "3", "vet_id" => "2",
       "treatment_notes" => "Pixie: Treatment Notes"}

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
      result = @pet.pet_type_id()
      assert_equal(1, result)
    end

    def test_vet_id()
      result = @pet.vet_id()
      assert_equal(2, result)
    end

    def test_treatment_notes()
      result = @pet.treatment_notes()
      assert_equal('Pixie: Treatment Notes', result)
    end

    def test_owner_id()
      result = @pet.owner_id()
      assert_equal(3, result)
    end

  end
