class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :address
      t.references :contact
      t.references :institution

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
