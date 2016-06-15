jcasimir = User.create(username: "jcasimir", password: "test", email: "jcasimir@example.com", name: "Jeff Casimir", address: "1510 Blake St", city: "Denver", state: "CO", zip: "80111")
admin = User.create(username: "admin", password: "admin", role: 1, email: "jcasimir@example.com", name: "Jeff Casimir", address: "1510 Blake St", city: "Denver", state: "CO", zip: "80111")

storage = Category.create(name: "storage")
item_1 = storage.items.create(name: "Laser Disc", description: "Make great plates.", price: "5.99", image: "https://visualhunt.com/photos/m/5/laser-and-video-discs-24.jpg")
item_2 = storage.items.create(name: "Floppy Disc", description: "Need to store a whopping 1.44 MB of data? This bad boy has got you covered.", price: "5.99", image: "https://visualhunt.com/photos/m/5/day-037-did-floppy-exist-once.jpg")
item_3 = storage.items.create(name: "CD", description: "Like ninja stars but better.", price: "2.99", image: "https://visualhunt.com/photos/m/4/cd-dvd-computer-data-shiny-digital-disk.jpg")


electronics = Category.create(name: "electronics")
item_4 = electronics.items.create(name: "Walkman", description: "Enjoy some tunes on your walkman.", price: "22.99", image: "https://visualhunt.com/photos/m/5/sony-sports-walkman-wm-f5-okinawa.jpg")
item_5 = electronics.items.create(name: "VCR", description: "Now go find some VCR tapes!", price: "100.99", image: "https://visualhunt.com/photos/m/5/vcr.jpg")
item_6 = electronics.items.create(name: "Discman", description: "Listen to all your favorite hits.", price: "10.99", image: "https://c4.staticflickr.com/3/2318/2051407819_794a95d465_b.jpg")

game_systems = Category.create(name: "gaming")
item_7 = game_systems.items.create(name: "Gameboy", description: "Remember discovering Tetris? Discover it again on this Gameboy.", price: "99.99", image: "https://c4.staticflickr.com/8/7481/16037341171_3db0f52a8d_k.jpg")
item_8 = game_systems.items.create(name: "Atari", description: "Take it back to the 80's and play some Atari on this mint condition system.", price: "800.99", image: "https://c5.staticflickr.com/8/7678/17513196036_a6b2e4889f_k.jpg")
item_9 = game_systems.items.create(name: "Nintendo", description: "Play some games on the original NES.", price: "1999.88", image: "https://visualhunt.com/photos/m/5/nintendo-nes.jpg")


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
