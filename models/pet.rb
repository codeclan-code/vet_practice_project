require_relative('../db/sql_runner')

class Pet

  attr_accessor :name, :date_of_birth, :pet_type, :owner_name, :owner_mobile, :vet_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @pet_type = options['pet_type']
    @owner_name = options['owner_name']
    @owner_mobile = options['owner_mobile']
    @vet_id = options['vet_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets
    (
      name,
      date_of_birth,
      pet_type,
      owner_name,
      owner_mobile,
      vet_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @date_of_birth, @pet_type, @owner_name, @owner_mobile, @vet_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE pets
    SET
    (
      name,
      date_of_birth,
      pet_type,
      owner_name,
      owner_mobile,
      vet_id
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @date_of_birth, @pet_type, @owner_name, @owner_mobile, @vet_id, @id]
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

end
