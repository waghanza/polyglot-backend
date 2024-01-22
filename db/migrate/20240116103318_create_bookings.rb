class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings, id: :uuid do |t|
      t.time :start_at
      t.references :driver, null: false, foreign_key: true, type: :uuid
      t.string :from
      t.string :to
      t.time :at
    end
  end
end
