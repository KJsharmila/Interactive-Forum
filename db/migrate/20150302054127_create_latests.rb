class CreateLatests < ActiveRecord::Migration
  def change
    create_table :latests do |t|
      t.references :announcement, index: true
      t.references :general, index: true

      t.timestamps
    end
  end
end
