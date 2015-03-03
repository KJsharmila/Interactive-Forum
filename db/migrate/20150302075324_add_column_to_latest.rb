class AddColumnToLatest < ActiveRecord::Migration
  def change
    add_reference :latests, :user, index: true
  end
end
