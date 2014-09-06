class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :publication, index: true

      t.timestamps
    end
  end
end
