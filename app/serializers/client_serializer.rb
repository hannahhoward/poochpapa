class ClientSerializer < BaseSerializer
  attributes :id, :street_address_1, :street_address_2, :city,
    :state, :zip, :special_instructions, :first_name, :last_name, :phone_number, :param

  has_one :user
  has_many :pets

  def param
    if last_name
      "#{id}-#{first_name.dasherize.parameterize}-#{last_name.dasherize.parameterize}"
    else
      "#{id}-#{first_name.dasherize.parameterize}"
    end
  end
end