require_relative('../models/pet')
require_relative('../models/vet')
require_relative('../models/pettype')
require_relative('../models/owner')
require('pry')

vet1 = Vet.new({'name' => 'Dr Monica Smith', 'mobile' => '0978 1234 999'})
vet1.save

vet2 = Vet.new({'name' => 'Dr Heather Jones', 'mobile' => '0978 6565 123'})
vet2.save

vet3 = Vet.new({'name' => 'Dr Jason Bourne', 'mobile' => '0800 1234 456'})
vet3.save

pettype1 = PetType.new ({'pet_type' => 'Cat', 'pet_image' => '/images/cat.jpg'})
pettype2 = PetType.new ({'pet_type' => 'Dog', 'pet_image' => '/images/dog.jpg'})
pettype3 = PetType.new ({'pet_type' => 'Horse', 'pet_image' => '/images/horse.jpg'})
pettype4 = PetType.new ({'pet_type' => 'Spider', 'pet_image' => '/images/spider.jpg'})
pettype5 = PetType.new ({'pet_type' => 'Snake', 'pet_image' => '/images/snake.jpg'})
pettype6 = PetType.new ({'pet_type' => 'Mouse', 'pet_image' => '/images/mouse.jpg'})
pettype7 = PetType.new ({'pet_type' => 'Fish', 'pet_image' => '/images/fish.jpg'})
pettype8 = PetType.new ({'pet_type' => 'Bird', 'pet_image' => '/images/bird.jpg'})
pettype9 = PetType.new ({'pet_type' => 'Insect', 'pet_image' => '/images/insect.jpg'})
pettype10 = PetType.new ({'pet_type' => 'Other', 'pet_image' => '/images/other.jpg'})

pettype1.save
pettype2.save
pettype3.save
pettype4.save
pettype5.save
pettype6.save
pettype7.save
pettype8.save
pettype9.save
pettype10.save


owner1 = Owner.new(
  {
    'name' => 'Kevin King',
    'mobile' => '0123 456 789'
  }
)

owner1.save

owner2 = Owner.new(
  {
    'name' => 'Carol Corn',
    'mobile' => '0987 654 321'
  }
)

owner2.save

owner3 = Owner.new(
  {
    'name' => 'James Gardener',
    'mobile' => '0131 675 1212'
  }
)

owner3.save


owner4 = Owner.new(
  {
    'name' => 'Hilary Clinton',
    'mobile' => '0120 765 1234'
  }
)

owner4.save

owner5 = Owner.new(
  {
    'name' => 'Margaret Sharp',
    'mobile' => '0130 445 1334'
  }
)

owner5.save

owner6 = Owner.new(
  {
    'name' => 'Nicola Sturgeon',
    'mobile' => '0160 111 1555'
  }
)

owner6.save


pet1 = Pet.new({
  'name' => 'Julius',
  'date_of_birth' => '12.12.19',
  'treatment_notes' => 'J\'s Treatment Notes',
  'vet_id' => vet1.id,
  'pet_type_id' => pettype1.id,
  'owner_id' => owner1.id
   })

pet1.save

pet2 = Pet.new({
  'name' => 'King',
  'date_of_birth' => '12.12.12',
  'treatment_notes' => 'Treatment Notes',
  'vet_id' => vet2.id,
  'pet_type_id' => pettype2.id,
  'owner_id' => owner2.id
   })

pet2.save

pet3 = Pet.new({
  'name' => 'Wee Jessie',
  'date_of_birth' => '06.09.17',
  'treatment_notes' => 'Jessie\'s Treatment Notes',
  'vet_id' => vet2.id,
  'pet_type_id' => pettype2.id,
  'owner_id' => owner2.id
   })

pet3.save

pet4 = Pet.new({
  'name' => 'Pigpen',
  'date_of_birth' => '12.12.12',
  'treatment_notes' => 'Pigpen\'s Treatment Notes',
  'vet_id' => vet3.id,
  'pet_type_id' => pettype5.id,
  'owner_id' => owner3.id
   })

pet4.save

pet5 = Pet.new({
  'name' => 'Pete',
  'date_of_birth' => '12.12.14',
  'treatment_notes' => 'Pete\'s Treatment Notes',
  'vet_id' => vet3.id,
  'pet_type_id' => pettype5.id,
  'owner_id' => owner4.id
   })

pet5.save

pet6 = Pet.new({
  'name' => 'Pete',
  'date_of_birth' => '12.12.14',
  'treatment_notes' => 'Pete\'s Treatment Notes',
  'vet_id' => vet3.id,
  'pet_type_id' => pettype7.id,
  'owner_id' => owner5.id
   })

pet6.save



binding.pry
nil
