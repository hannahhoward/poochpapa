class UserSerializer < BaseSerializer
  attributes :id, :email, :param, :role_id, :role_type

  def attributes
    data = super
    data[:role] = {id: data[:role_id], type: data[:role_type]}
    data.delete(:role_type)
    data.delete(:role_id)
    data
  end

  def param
    namePortion = email.split('@').first
    "#{id}-#{namePortion.dasherize.parameterize}"
  end
end