class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :publication, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
