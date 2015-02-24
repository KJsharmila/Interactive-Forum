class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
