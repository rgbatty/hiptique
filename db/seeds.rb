jcasimir = User.create(username: "jcasimir", password: "test")

storage = Category.create(name: "storage")
item_1 = storage.items.create(name: "Floppy Disc", description: "So great", price: "5.99", image: "http://cws.gtc.edu/departments/Library/Library%20Technology%20Tips%20webpage/floppy.jpg")
item_2 = storage.items.create(name: "CD", description: "Pretty great too", price: "2.99", image: "https://upload.wikimedia.org/wikipedia/commons/d/d5/CD_autolev_crop.jpg")

electronics = Category.create(name: "electronics")
item_3 = electronics.items.create(name: "Gameboy", description: "Hard as a rock", price: "99.99")
item_4 = electronics.items.create(name: "Walkman", description: "Pretty great too", price: "22.99")
item_5 = electronics.items.create(name: "VCR", description: "YA great too", price: "100.99")

order_1 = jcasimir.orders.create(status: "paid")
order_2 = jcasimir.orders.create(status: "paid")
order_3 = jcasimir.orders.create(status: "paid")
order_4 = jcasimir.orders.create(status: "ordered")

cart_1 = Cart.new({item_1.id => 2, item_3.id => 1})
cart_2 = Cart.new({item_2.id => 2, item_4.id => 1, item_5.id => 3})

order_1.create_order_items(cart_1)
order_2.create_order_items(cart_2)
order_3.create_order_items(cart_1)
order_4.create_order_items(cart_2)

order_1.complete
order_1.cancel
