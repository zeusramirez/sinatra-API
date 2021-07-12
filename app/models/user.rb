class User < ActiveRecord::Base
    has_many :orders
    has_many :menus, through: :orders

end