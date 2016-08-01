class CreatePropuests < ActiveRecord::Migration[5.0]
  def change
    create_table :propuests do |t|
      t.text :descripcion
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
