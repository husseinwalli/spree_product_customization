module Spree
  module Admin
    class ProductCustomizationOptionsController < ResourceController
      belongs_to 'spree/product', :find_by => :slug
      before_action :find_customization_options
      before_action :setup_customization_option, only: :index

      def edit
         # = ProductCustomizationOption.find(params[:id])
        if @product_customization_option.product_customization_option_values.blank?
          @product_customization_option.product_customization_option_values.build
        end
      end

      private
        def find_customization_options
          @customization_options = Spree::CustomizationOption.pluck(:name)
        end

        def setup_customization_option
          @product.product_customization_options.build
        end
    end
  end
end
