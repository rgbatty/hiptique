User.create(username: "jcasimir", password: "test")

Category.create(name: "storage")
Category.find_by(name: "storage").items.create(name: "Floppy Disc", description: "So great", price: "5.99", image: "http://cws.gtc.edu/departments/Library/Library%20Technology%20Tips%20webpage/floppy.jpg")
Category.find_by(name: "storage").items.create(name: "CD", description: "Pretty great too", price: "2.99", image: "https://upload.wikimedia.org/wikipedia/commons/d/d5/CD_autolev_crop.jpg")

Category.create(name: "electronics")
Category.find_by(name: "storage").items.create(name: "Gameboy", description: "Hard as a rock", price: "99.99")
Category.find_by(name: "storage").items.create(name: "Walkman", description: "Pretty great too", price: "22.99")
Category.find_by(name: "electronics").items.create(name: "VCR", description: "YA great too", price: "100.99")

User.find_by(username: "jcasimir").orders.create
User.find_by(username: "jcasimir").orders.create
