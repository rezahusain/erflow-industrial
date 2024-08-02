desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  User.delete_all
  PatientRequest.delete_all
  Comment.delete_all

  24.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
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
  end

  users = User.all

  users.each do |user|
    user.forms.create(
      image: Faker::Avatar.image,
      description: Faker::Food.description,
      status: "under review",
      pain: rand(10),
      injury_type: ['minor', 'moderate', 'severe', 'critical'].sample
    )
  end

  forms = PatientRequest.all

  forms.each do |form|
    form.comments.create(
      body: Faker::Markdown.emphasis
    )
  end
end
