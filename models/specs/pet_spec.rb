require("minitest/autorun")
require_relative("../pet")

class TestPet < MiniTest::Test

  def setup
    options = {"name" => "Pixie", "date_of_birth" => "12.12.12",
      "pet_type_id" => 1, "owner_name" => "Mr Thomas", "vet_id" => 2,
      "owner_mobile" => "1234567890", "treatment_notes" => "Pixie: Treatment Notes"}

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

    def test_owner_name()
      result = @pet.owner_name()
      assert_equal("Mr Thomas", result)
    end

    def test_owner_mobile()
      result = @pet.owner_mobile()
      assert_equal("1234567890", result)
    end

    # TO do OR not?

    # def vet()
    #   vet = Vet.find(@vet_id)
    #   return vet
    # end
    #
    # def pettype()
    #   pet_type = PetType.find(@pet_type_id)
    #   return pet_type
    # end

    # TO do OR not?
    end
