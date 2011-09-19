class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :number
      t.string :phone_type
      t.references :institution
      t.references :contact

      t.timestamps
    end
    add_index :phones, :institution_id
    add_index :phones, :contact_id
  end

  def self.down
    drop_table :phones
  end
end
