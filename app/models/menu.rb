class Menu < ActiveRecord::Base
    has_many :orders
    has_many :users, through: :orders
    belongs_to :restaurant
end