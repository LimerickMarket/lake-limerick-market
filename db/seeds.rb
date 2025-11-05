# 3rd Generation Limerick Market - Seed Data
# This creates sample data to showcase the market's offerings

puts "🌱 Seeding 3rd Generation Limerick Market data..."

# Create Admin Account
admin = Admin.find_or_create_by!(email: 'admin@limerickmarket.com') do |a|
  a.password = 'password123'
  a.password_confirmation = 'password123'
end
puts "✅ Admin account created: #{admin.email}"

# Create Menu Items
menu_items_data = [
  # Breakfast Favorites - Perfect Before Your Round!
  { name: "Golfer's Breakfast Burrito", description: "Our famous breakfast burrito packed with scrambled eggs, crispy bacon, sausage, hash browns, and melted cheese. Fuel up before hitting the links at Lake Limerick Golf Course!", price: 9.99, category: "Breakfast", image: "breakfast-burrito.svg" },
  { name: "Fisherman's Sunrise", description: "Two poached eggs on toasted English muffins with country ham, topped with homemade hollandaise sauce. Perfect for early morning anglers on Lake Limerick.", price: 12.99, category: "Breakfast", image: "eggs-benedict.svg" },
  { name: "Stack of Pancakes", description: "Three fluffy buttermilk pancakes served with butter, maple syrup, and your choice of bacon or sausage links. A Lake Limerick tradition!", price: 8.99, category: "Breakfast", image: "pancakes.svg" },
  { name: "Clubhouse Omelet", description: "Three-egg omelet filled with your choice of ham, bacon, sausage, cheese, peppers, onions, and mushrooms. Served with toast and hash browns.", price: 10.99, category: "Breakfast", image: "omelet.svg" },
  { name: "Biscuits & Sausage Gravy", description: "Two fluffy buttermilk biscuits smothered in creamy sausage gravy. A southern comfort classic that'll fuel your day on the course or lake.", price: 7.99, category: "Breakfast", image: "biscuits-gravy.svg" },
  
  # Burgers & Sandwiches - 19th Hole Favorites
  { name: "19th Hole Burger", description: "Half-pound Angus beef patty with American cheese, lettuce, tomato, onion, and pickles on a toasted brioche bun. The perfect burger after your round! Served with crispy fries.", price: 13.99, category: "Burgers & Sandwiches", image: "burger.svg" },
  { name: "Birdie Bacon Burger", description: "Juicy beef patty topped with crispy bacon, cheddar cheese, BBQ sauce, and onion rings. Celebrate your birdie with this beauty! Served with fries.", price: 15.99, category: "Burgers & Sandwiches", image: "burger.svg" },
  { name: "Catch of the Day Sandwich", description: "Beer-battered cod fillet with tartar sauce, lettuce, and tomato on a toasted bun. Fresh from the lake tradition! Served with fries.", price: 12.99, category: "Burgers & Sandwiches", image: "fish-sandwich.svg" },
  { name: "Philly Cheesesteak", description: "Thinly sliced ribeye with grilled onions and peppers, topped with melted provolone cheese on a hoagie roll. Served with chips.", price: 14.99, category: "Burgers & Sandwiches", image: "cheesesteak.svg" },
  { name: "Clubhouse Triple-Decker", description: "Triple-decker with turkey, ham, bacon, lettuce, tomato, and mayo on toasted bread. Named after the clubhouse! Cut into quarters and served with fries.", price: 11.99, category: "Burgers & Sandwiches", image: "club-sandwich.svg" },
  
  # Comfort Food Classics - Lake Limerick Traditions
  { name: "Country Fried Steak", description: "Hand-breaded cube steak fried golden and smothered in white gravy. A Lake Limerick tradition! Served with mashed potatoes and green beans.", price: 16.99, category: "Comfort Food", image: "fried-steak.svg" },
  { name: "Meatloaf Dinner", description: "Homestyle meatloaf made with ground beef and secret seasonings, topped with brown gravy. Three generations of family recipe! Served with mashed potatoes and corn.", price: 14.99, category: "Comfort Food", image: "meatloaf.svg" },
  { name: "Lakeside Fish & Chips", description: "Beer-battered cod served with crispy fries, coleslaw, and tartar sauce. Perfect after a day on Lake Limerick!", price: 13.99, category: "Comfort Food", image: "fish-and-chips.svg" },
  { name: "Chicken Tenders", description: "Hand-breaded chicken tenders served with your choice of dipping sauce and fries. Kid-friendly and golfer approved!", price: 11.99, category: "Comfort Food", image: "chicken-tenders.svg" },
  { name: "Apple Pie à la Mode", description: "Slice of our famous homemade apple pie served warm with a scoop of vanilla ice cream. The perfect 19th hole dessert!", price: 6.99, category: "Desserts", image: "apple-pie.svg" }
]

menu_items_data.each do |item_data|
  item = MenuItem.find_or_create_by!(name: item_data[:name]) do |mi|
    mi.description = item_data[:description]
    mi.price = item_data[:price]
    mi.category = item_data[:category]
    mi.image_url = "/#{item_data[:image]}" if item_data[:image]
  end
  
  # Update image_url if it changed
  if item_data[:image] && item.image_url != "/#{item_data[:image]}"
    item.update!(image_url: "/#{item_data[:image]}")
  end
  
  puts "🍽️  Created menu item: #{item.name}"
end

# Create Events
events_data = [
  {
    title: "Golf Tournament Breakfast",
    description: "Start tournament day right! Join us for our special Golf Tournament Breakfast featuring our famous breakfast burritos, fresh coffee, and pastries. Free coffee for all golfers competing at Lake Limerick Country Golf Course. Fuel up before your round and enjoy the camaraderie of fellow golfers!",
    event_date: 2.weeks.from_now.change(hour: 7, min: 0),
    location: "Limerick Market Dining Room"
  },
  {
    title: "Fish Fry Friday - Opening Day",
    description: "Celebrate fishing season opening day with our legendary Fish Fry! Fresh-caught Lake Limerick fish, beer-battered and served with all the fixings. Live music, fishing stories, and great company. Show off your catch of the day for a chance to win prizes!",
    event_date: 3.weeks.from_now.change(hour: 17, min: 0),
    location: "Lake Limerick Market Pavilion"
  },
  {
    title: "Golfer's BBQ & Putting Contest",
    description: "An evening of golf, grilling, and great times! Enjoy delicious BBQ while competing in our putting contest. Prizes for closest to the pin! Open to all skill levels. Beer and soft drinks available. Bring your putter and appetite!",
    event_date: 1.month.from_now.change(hour: 16, min: 0),
    location: "Lake Limerick Golf Course Clubhouse"
  },
  {
    title: "Lakeside Harvest Festival",
    description: "Our annual Harvest Festival returns! Live music overlooking beautiful Lake Limerick, pumpkin carving, apple bobbing, and special seasonal treats. Family-friendly fun with local artisans and a pie-eating contest. Don't miss our famous caramel apples and hot cider!",
    event_date: 5.weeks.from_now.change(hour: 11, min: 0),
    location: "Lake Limerick Pavilion"
  },
  {
    title: "Breakfast with Santa - Golf Course Edition",
    description: "Bring the kids for Breakfast with Santa at the golf course! Enjoy pancakes, eggs, and hot cocoa while meeting Santa. Free photo with Santa, holiday crafts, and candy canes for all children. Golf cart parade through the course at 10am!",
    event_date: 7.weeks.from_now.change(hour: 9, min: 0),
    location: "Lake Limerick Country Golf Course Clubhouse"
  }
]

events_data.each do |event_data|
  event = Event.find_or_create_by!(title: event_data[:title]) do |e|
    e.description = event_data[:description]
    e.event_date = event_data[:event_date]
    e.location = event_data[:location]
  end
  puts "🎪 Created event: #{event.title}"
end

# Create Promos
promos_data = [
  {
    title: "Golfer's Appreciation Week",
    description: "Thank you golfers and anglers for 3 generations of support! Show your Lake Limerick Golf Course scorecard for 15% off your meal. Free coffee with any breakfast purchase. Plus, enter our daily drawing for a free round of golf!",
    start_date: 1.week.from_now,
    end_date: 2.weeks.from_now,
    discount_percentage: 15
  },
  {
    title: "Fish Fry Friday Special",
    description: "Every Friday is Fish Fry Friday at Lake Limerick! Get 20% off our Lakeside Fish & Chips all day long. Fresh-battered cod, crispy fries, and coleslaw. Perfect after a day on the lake or course!",
    start_date: Date.current,
    end_date: 3.months.from_now,
    discount_percentage: 20
  },
  {
    title: "Holiday Pie Pre-Orders",
    description: "Order your holiday pies now! Choose from apple, pumpkin, pecan, cherry, and our special bourbon sweet potato pie. Order by December 15th for Christmas pickup. 10% discount on orders of 3+ pies.",
    start_date: 3.weeks.from_now,
    end_date: 2.months.from_now,
    discount_percentage: 10
  },
  {
    title: "New Customer Welcome",
    description: "First time at 3rd Generation Limerick Market? Welcome to the family! Show this coupon at checkout for 10% off your first purchase and a free market tote bag. We're excited to serve you!",
    start_date: Date.current,
    end_date: 6.months.from_now,
    discount_percentage: 10
  }
]

promos_data.each do |promo_data|
  promo = Promo.find_or_create_by!(title: promo_data[:title]) do |p|
    p.description = promo_data[:description]
    p.start_date = promo_data[:start_date]
    p.end_date = promo_data[:end_date]
    p.discount_percentage = promo_data[:discount_percentage] if promo_data.key?(:discount_percentage)
  end
  puts "🎯 Created promo: #{promo.title}"
end

# Ensure discount_percentage is set for existing promos (in case seeds were run earlier)
promos_data.each do |promo_data|
  next unless promo_data.key?(:discount_percentage)
  promo = Promo.find_by(title: promo_data[:title])
  if promo && promo.discount_percentage != promo_data[:discount_percentage]
    promo.update!(discount_percentage: promo_data[:discount_percentage])
    puts "🔧 Updated promo discount: #{promo.title} => #{promo.discount_percentage}%"
  end
end

# Create Sample Subscribers
subscribers_data = [
  { first_name: "Sarah", last_name: "Johnson", email: "sarah.johnson@email.com" },
  { first_name: "Mike", last_name: "Thompson", email: "mike.thompson@email.com" },
  { first_name: "Lisa", last_name: "Chen", email: "lisa.chen@email.com" },
  { first_name: "Robert", last_name: "Williams", email: "robert.williams@email.com" },
  { first_name: "Emily", last_name: "Davis", email: "emily.davis@email.com" },
  { first_name: "David", last_name: "Miller", email: "david.miller@email.com" },
  { first_name: "Jennifer", last_name: "Brown", email: "jennifer.brown@email.com" },
  { first_name: "Christopher", last_name: "Lee", email: "christopher.lee@email.com" }
]

subscribers_data.each do |subscriber_data|
  subscriber = Subscriber.find_or_create_by!(email: subscriber_data[:email]) do |s|
    s.first_name = subscriber_data[:first_name]
    s.last_name = subscriber_data[:last_name]
    s.subscribed_at = rand(30.days).seconds.ago
    s.weekly_deals = [true, false].sample
    s.event_notifications = [true, false].sample
  end
  puts "📧 Created subscriber: #{subscriber.full_name}"
end

puts ""
puts "🎉 Seeding complete!"
puts ""
puts "📊 Database now contains:"
puts "   👤 #{Admin.count} admin account"
puts "   🍽️  #{MenuItem.count} menu items"
puts "   🎪 #{Event.count} events"
puts "   🎯 #{Promo.count} promotions"
puts "   📧 #{Subscriber.count} newsletter subscribers"
puts ""
puts "🔐 Admin Login:"
puts "   Email: admin@limerickmarket.com"
puts "   Password: password123"
puts "   URL: http://localhost:3000/admin"
puts ""
puts "✨ Your 3rd Generation Limerick Market is ready to go!"
