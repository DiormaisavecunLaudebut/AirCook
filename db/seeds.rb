require 'open-uri'
require 'nokogiri'
require 'faker'

luck = [true, false]

description = "Je m'appelle Maurice, et je mets ma cuisine à louer tout équipement compris. Ma femme peut faire la vaisselle."
year = (2014..2020).to_a
month = (1..12).to_a
day = (1..30).to_a

profil_pic_url = "https://www.pexels.com/search/profile%20picture/"
img_url = "https://www.gettyimages.fr/photos/cuisine-moderne?mediatype=photography&phrase=cuisine%20moderne&sort=mostpopular"
review_url1 = "https://www.tripadvisor.fr/Restaurant_Review-g1078423-d948529-Reviews-Martin_Berasategui-Lasarte_Province_of_Guipuzcoa_Basque_Country.html"
review_url2 = "https://www.tripadvisor.fr/Restaurant_Review-g186338-d13321108-Reviews-Bistro_Mirey-London_England.html"
review_url3 = "https://www.tripadvisor.fr/Restaurant_Review-g186338-d17385148-Reviews-Grato-London_England.html"
review_url4 = "https://www.tripadvisor.fr/Restaurant_Review-g186338-d2654773-Reviews-Kennington_Lane_Cafe-London_England.html"
review_url5 = "https://www.tripadvisor.fr/Restaurant_Review-g60763-d425787-Reviews-Katz_s_Deli-New_York_City_New_York.html"
review_url6 = "https://www.tripadvisor.fr/Restaurant_Review-g60763-d423353-Reviews-Balthazar-New_York_City_New_York.html"
images = []
reviews = []
profils = []
reviews_url = [review_url1, review_url2, review_url3, review_url4, review_url5, review_url6]

addresses = ["46 Boulevard de Magenta, Paris", "63 Rue du Faubourg du Temple, Paris", "12 Rue de Richelieu, Paris", "18  rue de Turbigo, Paris", "140 rue du temple, Paris", "2 rue des Goncourt, Paris", "210 boulevard Saint-Germain, Paris", "39 rue de Varenne, Paris", "Place Saint-Sulpice, Paris", "11 rue Racine, Paris", "22 rue Monge, Paris", "29 rue Descartes, Paris", "10 rue Amyot, Paris", "210 boulevard Raspail, Paris", "80 rue du Cotentin, Paris"]

puts "Scrapping amazing profil pictures..."
html_file = open(profil_pic_url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.photo-item__img').each do |element|
  profils << element.attribute('src').value
end

puts "Scrapping amazing images on internet..."
html_file = open(img_url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.gallery-asset__thumb.gallery-mosaic-asset__thumb').each do |element|
  images << element.attribute('src').value
end

reviews_url.each_with_index do |url, index|
  puts "Scrapping the restaurant n°#{ index + 1 } on TripAdvisor"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.partial_entry').each do |element|
    reviews << element.text.strip
  end
end

reviews.map { |i| i = i[0..150]}
count = 0
review_count = 0
puts "Creating 15 users and kitchens, each user being associated to a kitchen"
images.first(15).each do |img|
  puts "user #{count + 1} \n "
  user_name = Faker::Name.female_first_name
  user = User.new(
    email: Faker::Internet.email,
    password: "DiormaisavecunLaudebut",
    username: user_name,
    )
  user.remote_photo_url = profils[count]
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
  kitchen.save
  booking = Booking.new(
    start_date: Time.new(year.sample, month.sample, day.sample),
    end_date: Time.new(year.sample, month.sample, day.sample),
    user: user,
    kitchen: kitchen
    )
  kitchen.remote_photo_url = img
  kitchen.user = user
  kitchen.save
  4.times do
    review = Review.new(
      content: reviews[review_count],
      user: User.all.sample,
      booking: booking,
      rating: (1..5).to_a.sample
      )
    review.save
    review_count += 1
  end
  count += 1
end

puts "Done ! "
