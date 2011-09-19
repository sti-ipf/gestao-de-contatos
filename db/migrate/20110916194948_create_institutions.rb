class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name
      t.text :mission
      t.date :fundation_at
      t.string :site

      t.timestamps
    end

  end

  def self.down
    drop_table :institutions
  end
end

