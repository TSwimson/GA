class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :nickname
      t.string :age
      t.string :status
      t.string :description

      t.timestamps
    end
  end
end
