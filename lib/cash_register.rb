require 'pry'
class CashRegister
  attr_accessor :discount, :total, :quantity, :item_list, :last_transaction
  
    def initialize(discount=0)
        @discount =discount
        @total =0
        @item_list=[]
    end

    def add_item title, price, quantity=1

        self.last_transaction = price* quantity
        self.total += self.last_transaction

        quantity.times do
            item_list << title
        end
    end

    def apply_discount 
        if self.discount !=0
            discount_as_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_as_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        self.item_list
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
  end

