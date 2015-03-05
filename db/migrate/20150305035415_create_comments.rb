class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.references :announcement, index: true
      t.references :general, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
