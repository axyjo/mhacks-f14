class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.integer :sort_value
      t.references :publication, index: true

      t.timestamps
    end
  end
end
