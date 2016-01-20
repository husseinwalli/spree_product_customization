class CreateProductCustomizationOptionValues < ActiveRecord::Migration
  def change
    create_table :spree_product_customization_option_values do |t|
      t.references :product_customization_option
      t.integer :position
      t.string :name
      t.string :presentation
      t.string :image_id
      t.decimal :price, :precision => 8, :scale => 2
      t.boolean :price_per_unit

      t.timestamps null: false
    end
  end
end
