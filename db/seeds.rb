require 'open-uri'
require 'nokogiri'
require 'faker'

luck = [true, false]
profil_pic = "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg"

description = "Je m'appelle Maurice, et je mets ma cuisine à louer tout équipement compris. Ma femme peut faire la vaisselle."


url = "https://www.gettyimages.fr/photos/cuisine-moderne?mediatype=photography&phrase=cuisine%20moderne&sort=mostpopular"

images = []
puts "Scrapping amazing images on internet..."
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.gallery-asset__thumb.gallery-mosaic-asset__thumb').each do |element|
  images << element.attribute('src').value
end

puts "Creating 15 users and kitchens, each user being associated to a kitchen"
images.first(15).each do |img|
  puts "Lior J'adore"
  user = User.new(
    email: Faker::Internet.email,
    password: "DiormaisavecunLaudebut",
    username: Faker::Name.unique.name
    )
  user.remote_photo_url = profil_pic
  user.save
  kitchen = Kitchen.new(
    location: Faker::Address.street_address,
    description: description,
    price: (5..20).to_a.sample,
    name: Faker::Name.first_name + "'s kitchen",
    oven: luck.sample,
    microwave: luck.sample,
    thermomix: luck.sample,
    ricecooker: luck.sample,
    pastry_set: luck.sample
    )
  kitchen.remote_photo_url = img
  kitchen.user = user
  kitchen.save
end
