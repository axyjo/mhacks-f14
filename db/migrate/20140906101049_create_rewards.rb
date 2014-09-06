class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.integer :limit
      t.decimal :price, precision: 10, scale: 2
      t.references :campaign, index: true

      t.timestamps
    end
  end
end
