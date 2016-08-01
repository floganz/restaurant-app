class RemoveStartTimeEndTimeFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :start_time, :time
    remove_column :reservations, :end_time, :time
  end
end
