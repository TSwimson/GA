class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name
      t.string :engine_type
      t.string :description

      t.timestamps
    end
  end
end
