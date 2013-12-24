Fabricator(:user) do
  email { sequence(:email) { |i| "foo#{i}@example.com"} }
  password 'foobarbaz'
end

Fabricator(:admin, :from => :user) do
  role_type 'admin'
end

Fabricator(:client_user, :from => :user) do
  role(fabricator: :client)
end
