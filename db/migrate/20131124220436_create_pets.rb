class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :animal_type
      t.string :breed
      t.text :medical_history
      t.text :special_needs
      t.text :instructions

      t.timestamps
    end
  end
end
