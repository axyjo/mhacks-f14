class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.references :genre, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
