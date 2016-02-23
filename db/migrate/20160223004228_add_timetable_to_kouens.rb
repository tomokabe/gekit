class AddTimetableToKouens < ActiveRecord::Migration
  def change
    add_column :kouens, :timetable, :text
  end
end
