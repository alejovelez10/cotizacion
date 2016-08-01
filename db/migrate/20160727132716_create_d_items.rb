class CreateDItems < ActiveRecord::Migration[5.0]
  def change
    create_table :d_items do |t|
      t.references :propuest, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
