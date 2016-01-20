module Spree
  module Admin
    class ProductCustomizationOptionValuesController < ResourceController
      belongs_to 'spree/admin/product_customization_option', :find_by => :id
  
    end
  end
end
