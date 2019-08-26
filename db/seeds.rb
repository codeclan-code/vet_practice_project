require_relative('../models/pet')
require_relative('../models/vet')
require_relative('../models/pettype')
require('pry')

vet1 = Vet.new({'name' => 'Dr Monica Smith'})
vet1.save

vet2 = Vet.new({'name' => 'Dr Heather Jones'})
vet2.save

pettype1 = PetType.new ({'pet_type' => 'Cat', 'pet_image' => '/images/cat.jpg'})
pettype2 = PetType.new ({'pet_type' => 'Dog', 'pet_image' => '/images/dog.jpg'})
pettype3 = PetType.new ({'pet_type' => 'Horse', 'pet_image' => '/images/horse.jpg'})
pettype4 = PetType.new ({'pet_type' => 'Spider', 'pet_image' => '/images/spider.jpg'})
pettype5 = PetType.new ({'pet_type' => 'Snake', 'pet_image' => '/images/snake.jpg'})
pettype6 = PetType.new ({'pet_type' => 'Mouse', 'pet_image' => '/images/mouse.jpg'})
pettype7 = PetType.new ({'pet_type' => 'Fish', 'pet_image' => '/images/fish.jpg'})
pettype8 = PetType.new ({'pet_type' => 'Other', 'pet_image' => '/images/other.jpg'})

pettype1.save
pettype2.save
pettype3.save
pettype4.save
pettype5.save
pettype6.save
pettype7.save
pettype8.save


pet1 = Pet.new({
  'name' => 'Julius',
  'date_of_birth' => '12.12.19',
  'owner_name' => 'Mr Clark',
  'owner_mobile' => '0131 6648384',
  'treatment_notes' => 'Julius Treatment Notes',
  'vet_id' => vet1.id,
  'pet_type_id' => pettype1.id
   })

pet1.save

pet2 = Pet.new({
  'name' => 'King',
  'date_of_birth' => '12.12.12',
  'owner_name' => 'Miss Evermond',
  'owner_mobile' => '0131 123456',
  'treatment_notes' => 'King Treatment Notes',
  'vet_id' => vet2.id,
  'pet_type_id' => pettype2.id
   })

pet2.save



binding.pry
nil
