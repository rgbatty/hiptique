jcasimir = User.create(username: "jcasimir", password: "test", email: "jcasimir@example.com", name: "Jeff Casimir", address: "1510 Blake St", city: "Denver", state: "CO", zip: "80111")
admin = User.create(username: "admin", password: "admin", role: 1, email: "jcasimir@example.com", name: "Jeff Casimir", address: "1510 Blake St", city: "Denver", state: "CO", zip: "80111")

storage = Category.create(name: "storage")
item_1 = storage.items.create(name: "Floppy Disc", description: "Need to store a whopping 1.44 MB of data? This bad boy has got you covered.", price: "5.99", image: "http://cws.gtc.edu/departments/Library/Library%20Technology%20Tips%20webpage/floppy.jpg")
item_2 = storage.items.create(name: "CD", description: "Pretty great too", price: "2.99", image: "https://upload.wikimedia.org/wikipedia/commons/d/d5/CD_autolev_crop.jpg")

electronics = Category.create(name: "electronics")
item_3 = electronics.items.create(name: "Gameboy", description: "Hard as a rock", price: "99.99", image: "http://www.nxpresspodcast.com/wp-content/uploads/2015/12/l3U5HPIL-gameboy-s-.png")
item_4 = electronics.items.create(name: "Walkman", description: "Pretty great too", price: "22.99", image: "http://i.telegraph.co.uk/multimedia/archive/01436/walkman1_1436143i.jpg")
item_5 = electronics.items.create(name: "VCR", description: "YA great too", price: "100.99", image: "http://www.youbioit.com/files/newimages/2/15/generationy30.jpg")

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
order_2.cancel
