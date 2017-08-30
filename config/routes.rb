Rails.application.routes.draw do
get "/products_instock" => "products#all_method"
end
