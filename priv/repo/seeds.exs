# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Squareshop.Repo.insert!(%Squareshop.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

userset1 = %{fname: "Ken", lname: "Madsen", email: "ken.r.e.madsen@gmail.com", encrypted_password: "admin123", wishlist: %{}, address: "sognanvegen 95", city: "steinkjer", country: "Norway", zip_code: 7710}

userset2 = %{fname: "Cato", lname: "Steivang", email: "steivang@gmail.com", phone: "97892044", encrypted_password: "password123", wishlist: %{}, address: "M\u00E5ss\u00E5bergvegen 15D", city: "Sparbu", country: "Norway", zip_code: 7710}

userset3 = %{fname: "P\u00E5l Kristian", lname: "\u00D8yen", email: "pk.oyen@gmail.com", phone: "99 66 77 55", password: "psw987654321", address: "Elvegaten 5", city: "Big Apple", country: "Brunei", zip_code: 6666, wishlist: %{}}

userset4 = %{fname: "Eva", lname: "Gjermstad", email: "Evita@gmail.com", phone: "96680660", encrypted_password: "Postenskalfrem", address: "Sognanvegen 95", city: "Sparbu", country: "Norway", zip_code: 7710, wishlist: %{}}

userset5 = %{fname: "Julie", lname: "Gjermstad", email: "Jewel@gmail.com", phone: "96677888", encrypted_password: "5.3 i snitt", address: "Sognanvegen 95", city: "Sparbu", country: "Norway", zip_code: 7710, wishlist: %{}}

Squareshop.Identity.create_user(userset1)
Squareshop.Identity.create_user(userset2)
Squareshop.Identity.create_user(userset3)
Squareshop.Identity.create_user(userset4)
Squareshop.Identity.create_user(userset5)



productset1 = %{alternative_products: 1, base_price: 999,
image: %{}, stock: 10, name: "Coffee Mug", pnr: "CM-01", summary: "A simple solid coffee mug. \n This mug can hold up to 2 cups worth of coffee, perfect for the average coffe drinker. The solidly built handle ensures that you always have a strong grip, no matter how tired you are.", supplier: 1}

productset2 = %{alternative_products: 1, base_price: 9998,
image: %{}, stock: 10, name: "Beer Mug", pnr: "BM-01", summary: "A pint sized Mug. \n This mug can hold up to a single pint of golden brew. \n Get the pub feel right at home when watching that football match on TV.", supplier: 1}

productset3 = %{alternative_products: 1, base_price: 999,
image: %{}, stock: 10, name: "Tankard", pnr: "BM-XL-01", summary: "This is our flagship product of the XL series. \n This Tankard can hold a whole 1.5 Litres of your favourite Beer. It even comes with our unique Tankard\u2122 lid, that helps prevent spillage even under most extreme drinking conditions.", supplier: 1}

Squareshop.Products.create_product(productset1)
Squareshop.Products.create_product(productset2)
Squareshop.Products.create_product(productset3)
