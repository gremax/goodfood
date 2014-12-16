class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.timestamps            null: false
      t.string :name,         null: false
      t.text :body,           null: false
      t.text :ingredients,    null: false
      t.integer :views,       default: 0
      t.references :category, index: true
      t.references :user,     index: true
    end
    add_index :recipes, :name
    add_foreign_key :recipes, :categories
    add_foreign_key :recipes, :users
  end
end
