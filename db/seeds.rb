# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(name: 'SeedCo Inc.', add_ln1: '246 Fake St.', city_state_zip: 'Ashtabula, OH 44004')

Company.create(name: 'PlusEquals', add_ln1: '357 No Lane', city_state_zip: 'Greensboro, NC 27477')

User.create(f_name: 'Jim', l_name: 'Jim', email: 'jim@jim.com',
            password: 'password', company_id: 2, role: "#{ENV['BILLING_TYPE']}")

User.create(f_name: 'Joseph', l_name: 'Seedman', email: 'jseedman@gmail.com',
            password: Faker::Company.buzzword, company_id: 3, role: 'client')

10.times do
  Invoice.create(
    billing_start: Faker::Date.backward(5),
    contact: 'Joseph Seedman',
    company_id: 3,
    project: Faker::Job.key_skill,
    paid: true
  )
end

10.times do
  Invoice.create(
    billing_start: Faker::Date.backward(5),
    contact: 'Joseph Seedman',
    company_id: 3,
    project: Faker::Job.key_skill,
    paid: false
  )
end
