class CreateMoviems < ActiveRecord::Migration
  def change
    create_table :moviems do |t|

      t.timestamps
    end
  end
end
