Fabricator(:user) do
  email { sequence(:email) { |i| "foo#{i}@example.com"} }
  password 'foobarbaz'
end

Fabricator(:admin_user, :from => :user) do
  role(fabricator: :admin)
end

Fabricator(:client_user, :from => :user) do
  role(fabricator: :client)
end
