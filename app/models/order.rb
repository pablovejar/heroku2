class Order < ApplicationRecord
    belongs_to :users
    has_many :dishes
    belongs_to :restaurants
end
