# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

path = Rails.root.join("joinme-seed/")

User.destroy_all
Venue.destroy_all
Friendship.destroy_all
Invitation.destroy_all
UserInvite.destroy_all
NotifAction.destroy_all

puts "Old data deleted"

# Lucas
User.create(email: "lucashudson.contact@gmail.com", first_name: "Lucas", last_name: "Hudson", is_owner?: true, is_admin?: true, password: "mlucas", password_confirmation: "mlucas")
User.last.avatar.attach(io: File.open("#{path}0.1-avatar-lucas.jpg"), filename: "0.1-avatar-lucas.jpg", content_type: "image/jpg")
# Ali
User.create(email: "ali@ali.fr", first_name: "Ali", last_name: "Youssef", password: "aliali", is_owner?: true, is_admin?: true, password_confirmation: "aliali")
User.last.avatar.attach(io: File.open("#{path}0.2-avatar-ali.jpg"), filename: "0.2-avatar-ali.jpg", content_type: "image/jpg")
# Gregoire
User.create(email: "gregoire@gmail.com", first_name: "Grégoire", last_name: "Kelesoglu", is_owner?: true, is_admin?: true, password: "123456", password_confirmation: "123456")
# Lu
User.create(email: "lu@gmail.com", first_name: "Lu", last_name: "Jiaying", is_owner?: true, is_admin?: true, password: "123456", password_confirmation: "123456")
User.last.avatar.attach(io: File.open("#{path}0.4-avatar-lu.jpg"), filename: "0.4-avatar-lu.jpg", content_type: "image/jpg")

puts "Created 4 Team Accounts with owner and admin priviledges."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "La Felicità"
v1.description = "La Felicità, c’est un immense food-market en direct producteurs où tout est 100% fait maison. C’est aussi un lieu de teuf, où on balance du bon son avec des DJ-set tous les vendredi et samedi soirs et toute une prog’ de funky events. Un spot pour venir chiller entre potes ou avec votre dernier date. Sweeet."
v1.min_drink_price = 5
v1.address = "5 Parvis Alan Turing"
v1.city = "Paris"
v1.zip_code = "75013"
v1.video.attach(io: File.open("#{path}1.1-felicita-video.mp4"), filename: "1.1-felicita-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}1.2-felicita-thumbnail.png"), filename: "1.2-felicita-thumbnail.png", content_type: "image/png")
v1.avatar.attach(io: File.open("#{path}1.3-felicita-avatar.png"), filename: "1.3-felicita-avatar.png", content_type: "image/png")
v1.images.attach(io: File.open("#{path}1.4-felicita-image1.jpg"), filename: "1.4-felicita-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}1.5-felicita-image2.jpg"), filename: "1.5-felicita-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}1.6-felicita-image3.jpg"), filename: "1.6-felicita-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}1.7-felicita-image4.jpg"), filename: "1.7-felicita-image4.jpg", content_type: "image/jpg")
v1.save

puts "Created La Felicita venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "SinaLoa Paris"
v1.description = "Quand le chic parisien rencontre les saveurs latines. Vous trouverez en un seul lieu du live, de la cuisine latino revisitée et du clubbing jusqu’à l’aube avec les meilleurs dj’s de la capitale. Notre ambition est avant tout de partager et vous faire découvrir de nouveaux cocktails, boissons et saveurs culinaires avec une carte éphémère très accessible. Plongez en plein coeur du Sinaloa  pour un vrai moment de convivialité !"
v1.min_drink_price = 4
v1.address = "17-19 Rue de Lappe"
v1.city = "Paris"
v1.zip_code = "75011"
v1.video.attach(io: File.open("#{path}2.1-sinaloa-video.mp4"), filename: "2.1-sinaloa-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}2.2-sinaloa-thumbnail.jpg"), filename: "2.2-sinaloa-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}2.3-sinaloa-avatar.png"), filename: "2.3-sinaloa-avatar.png", content_type: "image/png")
v1.images.attach(io: File.open("#{path}2.4-sinaloa-image1.jpg"), filename: "2.4-sinaloa-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}2.5-sinaloa-image2.jpg"), filename: "2.5-sinaloa-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}2.6-sinaloa-image3.jpg"), filename: "2.6-sinaloa-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}2.7-sinaloa-image4.jpg"), filename: "2.7-sinaloa-image4.jpg", content_type: "image/jpg")
v1.save

puts "Created SinaLoa venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Le Jardin Suspendu"
v1.description = "Oasis végétale inattendue et perchée, accessible mais bien cachée, Le Jardin Suspendu offre le plus grand rooftop de Paris : 3500 m² sur les toits (d’un parking !) pour une respiration bienvenue. Un food court, 3 bars géants, des DJ sets affutés, des coins et des recoins pour s’installer en toute tranquillité. Le tout à l’air libre et à la lumière naturelle."
v1.min_drink_price = 4
v1.address = "En face du 40 rue d'Oradour-sur-Glane"
v1.city = "Paris"
v1.zip_code = "75015"
v1.video.attach(io: File.open("#{path}3.1-jardin-video.mp4"), filename: "3.1-jardin-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}3.2-jardin-thumbnail.jpg"), filename: "3.2-jardin-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}3.3-jardin-avatar.jpg"), filename: "3.3-jardin-avatar.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}3.4-jardin-image1.jpg"), filename: "3.4-jardin-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}3.5-jardin-image2.jpg"), filename: "3.5-jardin-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}3.6-jardin-image3.jpg"), filename: "3.6-jardin-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}3.7-jardin-image4.jpg"), filename: "3.7-jardin-image4.jpg", content_type: "image/jpg")
v1.save

puts "Created Le Jardin Suspendu venue."

10.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123456", password_confirmation: "123456")
end

puts "Created 10 fake users."

30.times do
  Friendship.create(user: User.all.sample, friend: User.all.sample)
end

puts "Created 30 fake pending friendships."

10.times do
  Invitation.create(admin: User.all.sample, venue: Venue.all.sample, start_date: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now))
end

puts "Created 10 fake invitations."

30.times do
  UserInvite.create(invitation: Invitation.all.sample, guest: User.all.sample)
end

puts "Created 30 fake guests."


NotifAction.create(content: " ")
NotifAction.create(content: "souhaite devenir votre ami")
NotifAction.create(content: "a accepté votre demande d'ami")
NotifAction.create(content: "vous a invité à ")
NotifAction.create(content: "participe à")
NotifAction.create(content: "ne participe pas à")

puts "Created Notification Actions."
