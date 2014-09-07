class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :token
      t.references :reward, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
