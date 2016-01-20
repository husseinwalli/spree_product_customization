class CreateCustomizationOptions < ActiveRecord::Migration
  def change
    create_table :spree_customization_options do |t|
    	t.string :name
    	t.string :presentation

      t.timestamps null: false
    end
  end
end
