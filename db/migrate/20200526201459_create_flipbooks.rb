class CreateFlipbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :flipbooks do |t|
      t.string :name
      t.string :description
      t.integer :pages

      t.timestamps
    end
  end
end
