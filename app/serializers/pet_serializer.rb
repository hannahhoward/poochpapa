class PetSerializer < BaseSerializer
  attributes :id, :name, :age, :animal_type, :breed,
    :medical_history, :special_needs, :instructions, :param # prev code

  def param
    "#{id}-#{name.dasherize.parameterize}"
  end
end