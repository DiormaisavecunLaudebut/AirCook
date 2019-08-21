require 'open-uri'
require 'nokogiri'
require 'faker'

luck = [true, false]
profil_pic = "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg"

description = "Je m'appelle Maurice, et je mets ma cuisine à louer tout équipement compris. Ma femme peut faire la vaisselle."


url = "https://www.gettyimages.fr/photos/cuisine-moderne?mediatype=photography&phrase=cuisine%20moderne&sort=mostpopular"

addresses = ["46 Boulevard de Magenta, Paris", "63 Rue du Faubourg du Temple, Paris", "12 Rue de Richelieu, Paris", "18  rue de Turbigo, Paris", "140 rue du temple, Paris", "2 rue des Goncourt, Paris", "210 boulevard Saint-Germain, Paris", "39 rue de Varenne, Paris", "Place Saint-Suplice, Paris", "11 rue Racine, Paris", "22 rue Monge, Paris", "29 rue Descartes, Paris", "10 rue Amyot, Paris", "210 boulebard Raspail, Paris", "80 rue du Cotentin, Paris"]
images = []
puts "Scrapping amazing images on internet..."
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.gallery-asset__thumb.gallery-mosaic-asset__thumb').each do |element|
  images << element.attribute('src').value
end
count = 0
puts "Creating 15 users and kitchens, each user being associated to a kitchen"
images.first(15).each do |img|
  puts "Lior J'adore"
  user_name = Faker::Name.female_first_name
  user = User.new(
    email: Faker::Internet.email,
    password: "DiormaisavecunLaudebut",
    username: user_name
    )
  user.remote_photo_url = profil_pic
  user.save
  kitchen = Kitchen.new(
    address: addresses[count],
    description: description,
    price: (5..20).to_a.sample,
    name: user_name + "'s kitchen",
    oven: luck.sample,
    microwave: luck.sample,
    thermomix: luck.sample,
    ricecooker: luck.sample,
    pastry_set: luck.sample
    )
  kitchen.remote_photo_url = img
  kitchen.user = user
  kitchen.save
  count += 1
end
