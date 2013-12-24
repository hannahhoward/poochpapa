class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip
      t.text :special_instructions
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.timestamps
    end
    add_index :clients, :first_name
    add_index :clients, :last_name
    add_column :users, :role_type, :string
    add_column :users, :role_id, :integer
    add_column :pets, :client_id, :integer
  end
end
