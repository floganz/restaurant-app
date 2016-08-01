class CreateRestaurant < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.datetime :open_time
      t.datetime :close_time
    end
  end
end
