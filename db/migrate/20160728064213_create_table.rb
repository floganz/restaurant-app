class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.references :restaurant, foreign_key: true
    end
  end
end
