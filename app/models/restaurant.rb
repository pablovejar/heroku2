class Restaurant < ApplicationRecord
    has_many :dishes
    has_many :comments
    has_many :orders
    belongs_to :user 
end
