class CreateVats < ActiveRecord::Migration
  def change
    create_table :vats do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
