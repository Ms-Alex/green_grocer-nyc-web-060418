require 'pry'

def consolidate_cart(cart)
  # code here
  result = {}
  
  cart.uniq.each do |items|
    items.each do |item, info|
      result.merge!({item => info})
      result[item].merge!({:count => cart.count(items)})
    end
  end
  result
end


def apply_coupons(cart, coupons)
  # code here
  
  result = cart
      
  coupons.each do |coupon_items|
    item = coupon_items[:item]
      
    if cart[item] && cart[item][:count] >= coupon_items[:num]
      result[item][:count] -= coupon_items[:num]
        
      if result["#{item} W/COUPON"] 
        result["#{item} W/COUPON"][:count] += 1
      else
        result["#{item} W/COUPON"] = { 
          :price => coupon_items[:cost], 
          :clearance => cart[item][:clearance], 
          :count => 1 }
          
        end
      end
    end
  
  result
end


def apply_clearance(cart)
  # code here
  result = cart
  
  cart.each do |item, info|
    info.each do |category, value|
      if value == true && category == :clearance
        result[item][:price] = (cart[item][:price] * 0.8).round(2)
      end
    end
  end
  
  result
end

def checkout(cart, coupons)
  # code here
  
  
  total *= (0.90) if total > 100.0
  total
end
