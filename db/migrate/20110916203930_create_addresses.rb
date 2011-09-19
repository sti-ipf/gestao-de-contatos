class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :description
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.references :institution
      t.references :contact

      t.timestamps
    end
    add_index :addresses, :institution_id
    add_index :addresses, :contact_id
  end

  def self.down
    drop_table :addresses
  end
end
