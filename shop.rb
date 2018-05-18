##  create a menu
##  take input, delegate selection
##  be able to buy items
##  checkout when done shopping
##  
##  assume manager status, and add or delete items

# The menu items
@menu_items = [
    {
      item: "Burger",
      price: 6.00
    },
    {
      item: "Cheeseburger",
      price: 7.00
    },
    {
      item: "Double Burger",
      price: 8.00
    },
    {
      item: "Double Cheeseburger",
      price: 9.00
    },
    {
      item: "Fries",
      price: 2.50
    },
    {
      item: "Curly Fries",
      price: 3.50
    },
    {
      item: "Water",
      price: 1.00
    },
    {
      item: "Soda",
      price: 3.50
    },
    {
      item: "Bean Burrito",
      price: 6.00
    }
]
# The cart
@item_cart = []
# The price of all the items in the cart
@total = 0

# Choose between shopper and manager
def front_door
  puts "----------------------------------------"
  puts "       Welcome to Burger Hut"
  puts "----------------------------------------"
  puts "       Are you the Manager?"

  store_type = gets.strip
  if store_type == "Yes"
    puts "No you're not"
  else
    puts main_menu
  end
end

# They can choose to order, checkout, or quit
def main_menu
  puts "----------------------------------------"
  puts "What would you like to do"
    puts "Order"
    puts "Check Out"
    puts "Exit"
  puts "----------------------------------------"
  
  decision = gets.strip
  menu_option(decision)
end

# Sauce for their decision
def menu_option(decision)
  case decision
    when "Order"
      puts "         What would you like?"
      menu
    when "Check Out"
      check_out
    when "Exit"
      puts "Have a nice day"
      exit
  end
end

# The menu, order food here
def menu
  puts "---------------------------------------"

  @menu_items.each do |item|
    puts "    #{item[:item]} - $#{item[:price]}0"
  end

  puts "---------------------------------------"
  cart_item
end

# The method for putting the item in your cart
def cart_item
  choice = gets.chomp
  @menu_items.each do |item|
    if choice == item[:item]
      @item_cart << item
    end
    puts `clear`
  end

  # Be able to order more, or exit to the checkout
  puts "         Anything else?"
  puts "         (Yes) or (No)"
  yn = gets.strip

  if yn == "Yes"
    puts "       What would you like?"
    menu
  elsif yn == "No"
    main_menu
  else
    puts "Sorry, you have made a terrible mistake"
    exit
  end
end

# Display their cart and check if it's ok
def check_out

  puts "         Is this ok?"

  puts "---------------------------------------"

  @item_cart.each do |item|
    puts "    #{item[:item]} - $#{item[:price]}0"
  end

  puts "---------------------------------------"

  puts "         (Yes) or (No)"
  yn = gets.strip

  if yn == "Yes"
    total_price
  elsif yn == "No"
    menu
  else
    puts "Sorry, you have made a terrible mistake"
    exit
  end
end

# Calculate and show them their total
def total_price
  @item_cart.each do |item|
    @total += item[:price]
  end
  puts "       Your total is $#{@total}0"
  puts "       Have a nice day"
end

front_door

# I didn't have enough time to implement all the bonus stuff, but I tried dad