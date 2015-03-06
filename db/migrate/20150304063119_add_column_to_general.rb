class AddColumnToGeneral < ActiveRecord::Migration
  def change
    add_reference :generals, :user, index: true
  end
end
