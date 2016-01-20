class CreateSpreeProductCustomizationOptions < ActiveRecord::Migration
  def change
    create_table :spree_product_customization_options do |t|
      t.references :product
      t.references :customization_option
      t.integer :position
      t.string :name
      t.string :required

      t.timestamps null: false

    end
  end
end
