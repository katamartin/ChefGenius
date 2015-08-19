class CreateRecipeImages < ActiveRecord::Migration
  def change
    create_table :recipe_images do |t|
      t.integer :recipe_id, null: false
      t.integer :image_id, null: false

      t.timestamps null: false
    end
    add_index :recipe_images, :recipe_id
    add_index :recipe_images, :image_id
  end
end
