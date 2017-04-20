class CreateFactorial < ActiveRecord::Migration[5.0]
  def change
    create_table :factorials do |t|
      t.integer :of, unique: true
      t.string :is
    end
  end
end
