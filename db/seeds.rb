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

Tag.create(tag_content: "Détendu")
Tag.create(tag_content: "Rock")
Tag.create(tag_content: "Jazz")
Tag.create(tag_content: "Club")
Tag.create(tag_content: "Extérieur")
Tag.create(tag_content: "Terrasse")
Tag.create(tag_content: "Jardin")
Tag.create(tag_content: "Boîte de nuit")
Tag.create(tag_content: "Concert")
Tag.create(tag_content: "Gratuit")
Tag.create(tag_content: "Bar")
Tag.create(tag_content: "Cocktail")
Tag.create(tag_content: "Dj")
Tag.create(tag_content: "Performance")
Tag.create(tag_content: "Danse")
Tag.create(tag_content: "Ephémère")
Tag.create(tag_content: "Latino")
Tag.create(tag_content: "Rooftop")



puts "created 5 first tags"

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

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Détendu"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Terrasse"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Dj"), venue: Venue.last)

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

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Latino"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Performance"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Dj"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Cocktail"), venue: Venue.last)

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


JoinTagVenue.create(tag: Tag.find_by(tag_content:"Rooftop"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Jardin"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Détendu"), venue: Venue.last)

puts "Created Le Jardin Suspendu venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Pavillon Puebla"
v1.description = "Dans le parc des Buttes-Chaumont, un pavillon datant du 19ème siècle : le Pavillon Puebla. Vous y trouverez un restaurant, deux terrasses, deux bars, des constructions de bois, des fauteuils marocains, la paix sous l’ombre des marronniers, la fête sur le dance-floor quand la nuit tombe."
v1.min_drink_price = 5
v1.address = "Avenue Darcel (Located in: Parc des Buttes-Chaumont)"
v1.city = "Paris"
v1.zip_code = "75019"
v1.video.attach(io: File.open("#{path}4.1-puebla-video.mp4"), filename: "4.1-puebla-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}4.2-puebla-thumbnail.jpg"), filename: "4.2-puebla-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}4.3-puebla-avatar.jpg"), filename: "4.3-puebla-avatar.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}4.4-puebla-image1.jpg"), filename: "4.4-puebla-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}4.5-puebla-image2.jpg"), filename: "4.5-puebla-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}4.6-puebla-image3.jpg"), filename: "4.6-puebla-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}4.7-puebla-image4.jpg"), filename: "4.7-puebla-image4.jpg", content_type: "image/jpg")
v1.save


JoinTagVenue.create(tag: Tag.find_by(tag_content:"Extérieur"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Jardin"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Performance"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Détendu"), venue: Venue.last)

puts "Created Pavillon Puebla venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Lulu White Drinking Club"
v1.description = "Located on Rue Frochot, neighbouring the winding streets of Montmartre, Lulu White is a haven for the late night wanderers of Paris whose thirst for excess has not yet been quenched. Lulu invites the curious to extend their evenings and explore the carefully crafted menu. The bar presents live music ranging from Jazz, Blues to Contemporary Folk, Lulu’s Live Evenings are inspired by the music culture of New Orleans.Cheers!"
v1.min_drink_price = 10
v1.address = "12 RUE FROCHOT 75009 PARIS"
v1.city = "Paris"
v1.zip_code = "75009"
v1.video.attach(io: File.open("#{path}5.1-lulu-video.mp4"), filename: "5.1-lulu-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}5.2-lulu-thumbnail.jpg"), filename: "5.2-lulu-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}5.3-lulu-avatar.jpg"), filename: "5.3-lulu-avatar.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}5.4-lulu-image1.jpg"), filename: "5.4-lulu-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}5.5-lulu-image2.jpg"), filename: "5.5-lulu-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}5.6-lulu-image3.jpg"), filename: "5.6-lulu-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}5.7-lulu-image4.jpg"), filename: "5.7-lulu-image4.jpg", content_type: "image/jpg")
v1.save

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Cocktail"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Jazz"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Détendu"), venue: Venue.last)

puts "Created Lulu White Drinking Club venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Le Perchoir"
v1.description = "Au 6ème et 7ème étage d’un immeuble industriel, vous trouverez un toit-terrasse, un grand bar, un restaurant, des cours de sport, une cabane à snack . Vous verrez des oiseaux, le Sacré-Cœur, des cheminées, des plants de tomates, des vignes, une pergola, des coussins moelleux."
v1.min_drink_price = 5
v1.address = "14 Rue Crespin du Gast"
v1.city = "Paris"
v1.zip_code = "75011"
v1.video.attach(io: File.open("#{path}6.1-perchoir-video.mp4"), filename: "6.1-perchoir-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}6.2-perchoir-thumbnail.jpg"), filename: "6.2-perchoir-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}6.3-perchoir-avatar.jpg"), filename: "6.3-perchoir-avatar.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}6.4-perchoir-image1.jpg"), filename: "6.4-perchoir-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}6.5-perchoir-image2.jpg"), filename: "6.5-perchoir-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}6.6-perchoir-image3.jpg"), filename: "6.6-perchoir-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}6.7-perchoir-image4.jpg"), filename: "6.7-perchoir-image4.jpg", content_type: "image/jpg")
v1.save

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Rooftop"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Dj"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Détendu"), venue: Venue.last)

puts "Created Le Perchoir venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Djoon"
v1.description = "Le Djoon est un resto-club qui semble débarqué de la Grosse Pomme : immense loft sur deux étages, baie vitrée donnant sur le quai de la Gare près de la BnF, décor sophistiqué, bar à cocktails trendy et canapés lounge : ici la place ne manque pas. Les spécialités de la maison ? Les beats groovy (funk, hip-hop, soul), house et deep house, et un mélange des deux : funky-house, nu soul. Les soirées Motown Party, My Grooves sont particulièrement populaires."
v1.min_drink_price = 5
v1.address = "22 Boulevard Vincent Auriol"
v1.city = "Paris"
v1.zip_code = "75013"
v1.video.attach(io: File.open("#{path}7.1-djoon-video.mp4"), filename: "7.1-djoon-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}7.2-djoon-thumbnail.jpg"), filename: "7.2-djoon-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}7.3-djoon-avatar.png"), filename: "7.3-djoon-avatar.png", content_type: "image/png")
v1.images.attach(io: File.open("#{path}7.4-djoon-image1.jpg"), filename: "7.4-djoon-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}7.5-djoon-image2.jpg"), filename: "7.5-djoon-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}7.6-djoon-image3.jpg"), filename: "7.6-djoon-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}7.7-djoon-image4.jpg"), filename: "7.7-djoon-image4.jpg", content_type: "image/jpg")
v1.save

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Performance"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Dj"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Rock"), venue: Venue.last)

puts "Created Djoon venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Les Bains"
v1.description = "Our music programming team is on constant lookout for new sounds from DJs, artists, rock and pop groups. A creative elixir to nourish the legendary Club des Bains. The décor pays vibrant tribute to the club's legendary past: the mythical pool, Philippe Starck's black and white checkerboard floor, the lava stone bar, a stage for memorable shows, concerts and events. The doorman at the Club's entrance ensures it stays eclectic."
v1.min_drink_price = 10
v1.address = " 7 Rue du Bourg l'Abbé"
v1.city = "Paris"
v1.zip_code = "75003"
v1.video.attach(io: File.open("#{path}8.1-bains-video.mp4"), filename: "8.1-bains-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}8.2-bains-thumbnail.jpg"), filename: "8.2-bains-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}8.3-bains-avatar.jpg"), filename: "8.3-bains-avatar.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}8.4-bains-image1.jpg"), filename: "8.4-bains-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}8.5-bains-image2.jpg"), filename: "8.5-bains-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}8.6-bains-image3.jpg"), filename: "8.6-bains-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}8.7-bains-image4.jpg"), filename: "8.7-bains-image4.jpg", content_type: "image/jpg")
v1.save

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Club"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Danse"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Dj"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Cocktail"), venue: Venue.last)

puts "Created Le Bains venue."

v1 = Venue.new
v1.owner = User.all.sample
v1.name = "Supersonic"
v1.description = "Niché à Bastille dans une ancienne fabrique réaménagée en loft, ce bar-concert-club offre un cadre original pour découvrir les talents de la scène indie pop, rock, éléctro, à l'occasion de concerts gratuits. Ses points forts: sa scène visible du rez-de-chaussée et de la mezzanine, un « fake food truck » où vous pourrez déguster hot-dos, bruschettas et planches du terroir à toute heure. Le Supersonic est un lieu chaleureux, accessible et résolument festif !"
v1.min_drink_price = 5
v1.address = "9 rue Biscornets"
v1.city = "Paris"
v1.zip_code = "75012"
v1.video.attach(io: File.open("#{path}9.1-supersonic-video.mp4"), filename: "9.1-supersonic-video", content_type: "video/mp4")
v1.thumbnail.attach(io: File.open("#{path}9.2-supersonic-thumbnail.jpg"), filename: "9.2-supersonic-thumbnail.jpg", content_type: "image/jpg")
v1.avatar.attach(io: File.open("#{path}9.3-supersonic-avatar.jpg"), filename: "9.3-supersonic-avatar.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}9.4-supersonic-image1.jpg"), filename: "9.4-supersonic-image1.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}9.5-supersonic-image2.jpg"), filename: "9.5-supersonic-image2.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}9.6-supersonic-image3.jpg"), filename: "9.6-supersonic-image3.jpg", content_type: "image/jpg")
v1.images.attach(io: File.open("#{path}9.7-supersonic-image4.jpg"), filename: "9.7-supersonic-image4.jpg", content_type: "image/jpg")
v1.save

JoinTagVenue.create(tag: Tag.find_by(tag_content:"Performance"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Danse"), venue: Venue.last)
JoinTagVenue.create(tag: Tag.find_by(tag_content:"Dj"), venue: Venue.last)

puts "Created Supersonic venue."


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