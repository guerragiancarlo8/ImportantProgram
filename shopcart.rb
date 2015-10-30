require 'date'

class ShoppingCart 

  attr_accessor :cost

	def initialize season

    @available = {

      apple: season[0],
      orange: season[1],
      grape: season[2],
      banana: season[3],
      watermelon: 50

    }

    if Date.today.wday == 7

      @available[:watermelon] = 100

    end

		@item_list = {}
    @cost = 0

    @oranges_count = @item_list[:orange]/@available[:orange]
    @grapes_count = @item_list[:grape]/@available[:grape]
    @apple_count = @item_list[:apple]/@available[:apple]
    @banana_count = @item_list[:banana]/@available[:banana]
    @watermelon_count = @item_list[:watermelon]/@available[:watermelon]

	end

	def add_item_to_cart item
    if @available.has_key?(item.to_sym) && !(@item_list[item].nil?)
		  @item_list[item] += @available[item.to_sym]
    else
      @item_list[item] = @available[item.to_sym]
    end
	end

  def show

    @oranges_count = @item_list[:orange]/@available[:orange]
    @grapes_count = 0
    @apple_count = 0

    @item_list.each do |key,x|
      #puts (x/@available[key]).to_s + " " + key.to_s + ": "+x.to_s+"$"
      puts (x/@available[key]).to_s + " " + key.to_s + ": "+x.to_s+"$"
    end
  end

  def cost 
    total = 0
    @item_list.each do |key,x|
      total += x
    end
    @cost = total
  end

  def calculate_discount
    

    if !@item_list[:apple].nil?
      @apple_count = @item_list[:apple]/(@available[:apple])
    end
    if !@item_list[:orange].nil?
      @oranges_count = @item_list[:orange]/(@available[:orange])
    end
    if !@item_list[:grape].nil?
      @grapes_count = @item_list[:grape]/(@available[:grape])
    end

    if @apple_count.even? && @apple_count > 1
      @item_list[:apple] /= 2
    end

    if @oranges_count%3 == 0 && @oranges_count > 2
      @item_list[:orange] -= (@item_list[:orange]/3) 
    end

    if @grapes_count%4 == 0 && @grapes_count != 0

      @item_list[:banana] += @available[:banana]

    end
  end
    
end

spring = [10,5,15,20]
summer = [10,2,15,20]
autumn = [15,5,15,20]
winter = [12,5,15,21]

cart = ShoppingCart.new(spring)

cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :orange
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.add_item_to_cart :grape
cart.calculate_discount
cart.show
puts cart.cost


