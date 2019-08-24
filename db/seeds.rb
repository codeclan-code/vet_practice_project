require_relative('../models/pet')
require_relative('../models/vet')
require('pry')

vet1 = Vet.new({'name' => 'Dr Smith'})
# vet1.save

vet2 = Vet.new({'name' => 'Dr Jones'})
# vet2.save


pet1 = Pet.new({
  'name' => 'Julius',
  'date_of_birth' => '12.12.19',
  'pet_type' => 'Dog',
  'owner_name' => 'Mr Clark',
  'owner_mobile' => '0131 6648384',
  'vet_id' => vet1.id
   })

# pet1.save

pet2 = Pet.new({
  'name' => 'King',
  'date_of_birth' => '12.12.12',
  'pet_type' => 'Snake',
  'owner_name' => 'Miss Evermond',
  'owner_mobile' => '0131 123456',
  'vet_id' => vet2.id
   })

# pet2.save

binding.pry
nil
