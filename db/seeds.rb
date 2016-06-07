Category.create(name: "storage")
Category.find_by(name: "storage").items.create(name: "Floppy Disc", description: "So great", price: "5.99")
Category.find_by(name: "storage").items.create(name: "CD", description: "Pretty great too", price: "2.99")
