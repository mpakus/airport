class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :when_it,   limit: 16, index: true
      t.string :direction, limit: 8,  index: true
      t.text   :schedule,  limit: 16777215

      t.timestamps
    end
  end
end
