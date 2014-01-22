class CreateMarshes < ActiveRecord::Migration
  def change
    create_table :marshes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
