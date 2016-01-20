module Spree
	class ProductCustomizationOptionValue < Spree::Base
		acts_as_list scope: :product_customization_option

    belongs_to :product_customization_option, dependent: :delete, inverse_of: :product_customization_option_values
    has_one :product, through: :product_customization_options

    validates :name, :presentation, presence: true

    scope :sorted, -> { order(:name) }

    after_touch :touch_product_customization_options

    self.whitelisted_ransackable_attributes = ['presentation']

    private

    def touch_product_customization_options
      product_customization_option.update(updated_at: Time.current)
    end
	end
end
