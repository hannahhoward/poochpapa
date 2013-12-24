Fabricator(:client) do
  street_address_1 { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip { Faker::Address.zip }
  special_instructions "Do awesome"
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  phone_number { Faker::PhoneNumber.phone_number}
end