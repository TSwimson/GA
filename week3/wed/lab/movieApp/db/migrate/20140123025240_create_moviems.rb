class CreateMoviems < ActiveRecord::Migration
  def change
    create_table :moviems do |t|
      t.string :title
      t.string :description
      t.string :imdbId

      t.timestamps
    end
  end
end
