class AddColumnToAnnouncement < ActiveRecord::Migration
  def change
    add_reference :announcements, :user, index: true
  end
end
