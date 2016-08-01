class CreateReservation < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :table, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
