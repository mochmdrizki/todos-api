class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done
      t.references :todo, index: true

      t.timestamps
    end
  end
end
