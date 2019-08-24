require_relative('../db/sql_runner')

class PetType

  attr_reader :id, :pettype

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pettype = options['pettype']
  end

  def save()
    sql = "INSERT INTO pettypes
    (
      pettype
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@pettype]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  # def self.find(id)
  #   sql = "SELECT * FROM vets
  #   WHERE id = $1"
  #   values = [id]
  #   result = SqlRunner.run(sql ,values).first
  #   vet = Vet.new(result)
  #   return vet
  # end
  #
  # def self.all()
  #   sql = "SELECT * FROM vets"
  #   vet_data = SqlRunner.run(sql)
  #   vets = map_items(vet_data)
  #   return vets
  # end
  #
  # def self.map_items(vet_data)
  #   return vet_data.map { |vet| Vet.new(vet) }
  # end

end
