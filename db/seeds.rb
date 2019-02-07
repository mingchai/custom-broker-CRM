User.destroy_all
Client.destroy_all
Policy.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('clients')
ActiveRecord::Base.connection.reset_pk_sequence!('policies')

PASSWORD = 'test'

super_user = User.create(
    first_name: "test",
    last_name: "test",
    email: "test@test.com",
    password: PASSWORD,
    admin: true
)

25.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}-#{last_name}@mauro.org",
        password: PASSWORD
    )
end
users = User.all

100.times do
    Faker::Config.locale = 'en-CA'
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    c = Client.create(
        first_name: first_name,
        last_name: last_name,
        phone_number: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        street_address: Faker::Address.street_address,
        city: Faker::Address.city,
        postal_code: Faker::Address.postcode,
        province: ['AB', 'BC', 'SK', 'MB','QC','ON','NL','NS','PEI','YT','NT', 'NU'].sample,
        marketing_consent: ["true", "false"].sample,
        broker_id: users.sample
    )
    
    rand(1..5).times do
        c.policies << Policy.new(
            policy_number: Faker::IDNumber.valid,
            annual_premium: rand(500..10_000)
        )
    end
end


clients = Client.all
policies = Policy.all

puts "Login with #{super_user.email} and password: #{PASSWORD}"
puts "Generated #{users.count} users"
puts "Generated #{clients.count} clients"
puts "Generated #{policies.count} policies"