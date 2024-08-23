# frozen_string_literal: true

# Comment: Good job using a rake task to load sample data in development; however, consider adding logs so the user can see what is going on.

desc 'Fill the database tables with some sample data'
task sample_data: :environment do
  # Clear existing data
  if Rails.env.development?
    User.delete_all
    PatientRequest.delete_all
    Comment.delete_all
    Role.delete_all
  end
  # Create roles if they don't already exist
  Role.find_or_create_by(name: 'admin')
  Role.find_or_create_by(name: 'patient')

  # Create an admin user
  admin = User.create(
    email: 'admin@example.com',
    password: 'password',
    username: 'admin',
    first_name: 'Admin',
    last_name: 'User',
    phone: Faker::PhoneNumber.cell_phone,
    dob: Faker::Date.birthday(min_age: 25, max_age: 65),
    role: 'patient',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
  )
  admin.add_role(:admin)

  # Create a sample test user (alice)
  alice = User.create(
    email: 'alice@example.com',
    password: 'password',
    username: 'alice99',
    first_name: 'Alice',
    last_name: 'Doe',
    phone: Faker::PhoneNumber.cell_phone,
    dob: Faker::Date.birthday(min_age: 25, max_age: 65),
    role: 'patient',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
  )
  alice.add_role(:patient)

  # Create sample patient users
  24.times do
    name = Faker::Name.first_name
    user = User.create(
      email: "#{name.downcase}@example.com",
      password: 'password',
      username: name.downcase,
      first_name: name,
      last_name: Faker::Name.last_name,
      phone: Faker::PhoneNumber.cell_phone,
      dob: Faker::Date.birthday(min_age: 18, max_age: 65),
      role: 'patient',
      address: Faker::Address.full_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zipcode: Faker::Address.zip_code
    )

    # Assign the patient role to each user
    user.add_role(:patient)
  end

  users = User.all

  users.each do |user|
    user.forms.create(
      image: Faker::Avatar.image,
      description: Faker::Food.description,
      status: 'under review',
      pain: rand(10),
      injury_type: %w[minor moderate severe critical].sample
    )
  end

  forms = PatientRequest.all

  forms.each do |form|
    form.comments.create(
      body: Faker::Markdown.emphasis
    )
  end
end
