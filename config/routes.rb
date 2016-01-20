Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
  	resources :customization_options

  	resources :products do
      resources :product_customization_options do
        collection do
          post :update_positions
        end
        
    		resources :product_customization_option_values do
    			collection do
    				post :update_positions
    			end
    		end
      end
    end
  end
end
