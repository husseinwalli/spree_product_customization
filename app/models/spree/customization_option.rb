module Spree
	class CustomizationOption < Spree::Base
		# has_and_belongs_to_many :prototypes, join_table: 'spree_customization_options_prototypes'

    has_many :product_customization_options, dependent: :delete_all, inverse_of: :customization_option
    has_many :products, through: :product_customization_options

    validates :name, :presentation, presence: true

    scope :sorted, -> { order(:name) }

    after_touch :touch_all_products

    self.whitelisted_ransackable_attributes = ['presentation']

    private

    def touch_all_products
      products.update_all(updated_at: Time.current)
    end
	end
end
