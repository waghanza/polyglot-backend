class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers, id: :uuid do |t|
      t.string :name
      t.float :lat
      t.float :long
    end
  end
end
