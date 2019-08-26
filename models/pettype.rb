require_relative('../db/sql_runner')

class PetType

  attr_reader :id, :pet_type, :pet_image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_type = options['pet_type']
    @pet_image = options['pet_image']
  end

  def save()
    sql = "INSERT INTO pettypes
    (
      pet_type,
      pet_image
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@pet_type, @pet_image]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM pettypes
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    pet_type = PetType.new(result)
    return pet_type
  end
  #
  def self.all()
    sql = "SELECT * FROM pettypes"
    pet_type_data = SqlRunner.run(sql)
    pet_type = map_items(pet_type_data)
    return pet_type
  end

  def self.map_items(pet_type_data)
    return pet_type_data.map { |pet_type| PetType.new(pet_type) }
  end

end
