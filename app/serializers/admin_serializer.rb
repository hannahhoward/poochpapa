class AdminSerializer < BaseSerializer
  attributes :id, :first_name, :last_name, :param

  has_one :user

  def param
    "#{id}-#{first_name.dasherize.parameterize}-#{last_name.dasherize.parameterize}"
  end
end