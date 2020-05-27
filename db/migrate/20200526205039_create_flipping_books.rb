class CreateFlippingBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :flipping_books do |t|
      t.string :name
      t.string :description
      t.integer :pages

      t.timestamps
    end
  end
end
