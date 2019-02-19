User.destroy_all
Client.destroy_all
Policy.destroy_all
FireHall.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('clients')
ActiveRecord::Base.connection.reset_pk_sequence!('policies')
ActiveRecord::Base.connection.reset_pk_sequence!('firehalls')

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
        user_id: users.sample
    )
    
    rand(1..5).times do
        c.policies << Policy.new(
            policy_number: Faker::IDNumber.valid,
            annual_premium: rand(500..10_000),
            start_date: Faker::Date.backward(28),
            expiry_date: Faker::Date.forward(365)
        )
    end
end


FireHall.create(fire_hall_name:"No 1", latitude:49.2757557879496, longitude:-123.089633564924, address: "900 Heatley Av")
FireHall.create(fire_hall_name:"No 2",	latitude:49.2833989343018, longitude:-123.100028850031, address: "199 Main St")
FireHall.create(fire_hall_name:"No 3",	latitude:49.2599716555727, longitude:-123.1034324331, address: "2801 Quebec St")
FireHall.create(fire_hall_name:"No 4",	latitude:49.2628710568171, longitude:-123.137578980719, address: "1475 W 10th Av")
FireHall.create(fire_hall_name:"No 5",	latitude:49.219883858393, longitude:-123.041750823072, address: "3090 E 54th Av")
FireHall.create(fire_hall_name:"No 6",	latitude:49.2864877423013, longitude:-123.134786345561, address: "1001 Nicola St")
FireHall.create(fire_hall_name:"No 7",	latitude:49.2835249047624, longitude:-123.125930803993, address: "1090 Haro St")
FireHall.create(fire_hall_name:"No 8",	latitude:49.2780606555938, longitude:-123.117639437094, address: "895 Hamilton St")
FireHall.create(fire_hall_name:"No 9",	latitude:49.2681117935618, longitude:-123.066183093448, address: "1805 Victoria Drive")
FireHall.create(fire_hall_name:"No 12", latitude:49.2647927430118, longitude:-123.173614488597, address: "2460 Balaclava St")
FireHall.create(fire_hall_name:"No 13", latitude:49.2488906817429, longitude:-123.088063456192, address: "4013 Prince Alber)ST")
FireHall.create(fire_hall_name:"No 14", latitude:49.2763886663577, longitude:-123.046353700482, address: "2804 Venables St")
FireHall.create(fire_hall_name:"No 15", latitude:49.2508855516351, longitude:-123.041230454628, address: "3003 E 22nd Av")
FireHall.create(fire_hall_name:"No 17", latitude:49.2198056785493, longitude:-123.076718029789, address: "7070 Knight St")
FireHall.create(fire_hall_name:"No 18", latitude:49.2372716521754, longitude:-123.136612705885, address: "1375 W 38th Av")
FireHall.create(fire_hall_name:"No 19", latitude:49.2616794433299, longitude:-123.205942401991, address: "4396 W 12th Av")
FireHall.create(fire_hall_name:"No 20", latitude:49.2357791498382, longitude:-123.065052263309, address: "5402 Victoria Drive")
FireHall.create(fire_hall_name:"No 21", latitude:49.2373032465887, longitude:-123.173281362176, address: "5425 Carnarvon St")
FireHall.create(fire_hall_name:"No 22", latitude:49.2174253755325, longitude:-123.129770081888, address: "1005 W 59th Av")
FireHall.create(fire_hall_name:"No 10", latitude:49.258019, longitude:-123.2381692992, address: "Wesbrook Mall")


clients = Client.all
policies = Policy.all
firehalls = FireHall.all

puts "Login with #{super_user.email} and password: #{PASSWORD}"
puts "Generated #{users.count} users"
puts "Generated #{clients.count} clients"
puts "Generated #{policies.count} policies"
puts "Generated #{firehalls.count} fire hall locations"