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


end
