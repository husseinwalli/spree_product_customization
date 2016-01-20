module Spree
	class ProductCustomizationOption < Spree::Base
		acts_as_list scope: :product

		belongs_to :product, class_name: 'Spree::Product', inverse_of: :product_customization_options
		belongs_to :customization_option, class_name: 'Spree::CustomizationOption', inverse_of: :product_customization_options

		has_many :product_customization_option_values
		accepts_nested_attributes_for :product_customization_option_values, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

    validates :customization_option, :product, :name, presence: true

    validates_with Spree::Validations::DbMaximumLengthValidator, field: :name

    default_scope { order("#{self.table_name}.position") }
    # scope :sorted, -> { order(:name) }

    self.whitelisted_ransackable_attributes = ['name']

    after_touch :touch_all_products

    # virtual attributes for use with AJAX completion stuff
    def customization_option_name
      customization_option.name if customization_option
    end

    def customization_option_name=(name)
      unless name.blank?
        unless customization_option = CustomizationOption.find_by(name: name)
          customization_option = CustomizationOption.create(name: name, presentation: name)
        end
        self.customization_option = customization_option
      end
    end

    private

    def touch_all_products
      product.update(updated_at: Time.current)
    end


	end
end
