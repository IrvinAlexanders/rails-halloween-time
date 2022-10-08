class CreateCostumes < ActiveRecord::Migration[7.0]
  def change
    create_table :costumes do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
