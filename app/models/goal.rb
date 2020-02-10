class Goal < ApplicationRecord
    belongs_to :project

    has_many :resources
    has_many :images
    has_many :updates

    validates :title, presence: true
    validates :description, presence: true
    validates :budget, presence: true, numericality: true
    STATUS_OPTIONS = ["Not Started", "Incomplete", "Completed"]
    validates :status, presence: true, inclusion: STATUS_OPTIONS


#       # Scope
#   scope :new_shoes, -> {where('condition = ?', 'new')}
#   scope :order_by_price, -> {order(:price)}
#   # def self.order_by_price
#   #   order(:price)
#   # end

#   # def self.new_shoes
#   #   #where(condition: 'new')
#   # end
#   def self.most_expensive
#     Shoe.where(price: Shoe.maximum('price')).last
#   end

end
