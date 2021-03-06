require_relative('../db/sql_runner')

class Pet

  attr_accessor :name, :date_of_birth, :pet_type_id, :vet_id, :treatment_notes, :owner_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @pet_type_id = options['pet_type_id'].to_i
    @vet_id = options['vet_id'].to_i
    @treatment_notes = options['treatment_notes']
    @owner_id = options['owner_id'].to_i

  end

  def save()
    sql = "INSERT INTO pets
    (
      name,
      date_of_birth,
      pet_type_id,
      vet_id,
      treatment_notes,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @date_of_birth, @pet_type_id, @vet_id, @treatment_notes, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def vet()
    vet = Vet.find(@vet_id)
    return vet
  end

  def pettype()
    pet_type = PetType.find(@pet_type_id)
    return pet_type
  end

  def owner()
    owner = Owner.find(@owner_id)
    return owner
  end

  def update()
    sql = "UPDATE pets
    SET
    (
      name,
      date_of_birth,
      pet_type_id,
      vet_id,
      treatment_notes,
      owner_id
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@name, @date_of_birth, @pet_type_id, @vet_id, @treatment_notes, @owner_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM pets
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM pets"
      pet_data = SqlRunner.run(sql)
      pets = map_items(pet_data)
      return pets
    end

    def self.map_items(pet_data)
      return pet_data.map { |pet| Pet.new(pet) }
    end

    def self.find(id)
      sql = "SELECT * FROM pets
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      pet = Pet.new(result)
      return pet
    end

    def self.vetspets(vet_id)
      sql = "SELECT * FROM pets WHERE vet_id = $1"
      values  = [vet_id]
      pet_data = SqlRunner.run(sql, values)
      pets = map_items(pet_data)
      return pets
    end

    def self.ownerspets(owner_id)
      sql = "SELECT * FROM pets WHERE owner_id = $1"
      values  = [owner_id]
      pet_data = SqlRunner.run(sql, values)
      pets = map_items(pet_data)
      return pets
    end

  end
