class AddColumnToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :general, index: true
  end
end
