# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Friendship.destroy_all
# Invitation.destroy_all
# UserInvite.destroy_all
NotifAction.destroy_all

puts "Old data deleted"

User.create(email: "lucashudson.contact@gmail.com", first_name: "Lucas", last_name: "Hudson", is_owner?: true, is_admin?: true, password: "mlucas", password_confirmation: "mlucas")
User.create(email: "ali@ali.fr", first_name: "Ali", last_name: "Youssef", password: "123456", is_owner?: true, is_admin?: true, password_confirmation: "123456")
User.create(email: "gregoire@gmail.com", first_name: "Grégoire", last_name: "Kelesoglu", is_owner?: true, is_admin?: true, password: "123456", password_confirmation: "123456")
User.create(email: "	lujiaying7@gmail.com", first_name: "Lu", last_name: "Jiaying", is_owner?: true, is_admin?: true, password: "123456", password_confirmation: "123456")

puts "Created 4 Team Accounts with owner and admin priviledges."

5.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123456", password_confirmation: "123456")
end

puts "Created 5 fake users."

10.times do
  Friendship.create(user: User.all.sample, friend: User.all.sample, status: 0)
end

puts "Created 10 fake pending friendships."

# 10.times do
#   Invitation.create(admin: User.all.sample, venue: Venue.all.sample, start_date: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now), duration: 60)
# end
#
# puts "Created 10 fake invitations."
#
# 10.times do
#   UserInvite.create(invitation: Invitation.all.sample, user_invite: User.all.sample)
# end
#
# puts "Created 10 fake guests."


NotifAction.create(content: " ")
NotifAction.create(content: "souhaite devenir votre ami")
NotifAction.create(content: "a accepté votre demande d'ami")
NotifAction.create(content: "vous a invité à ")
NotifAction.create(content: "participe à")
NotifAction.create(content: "ne participe pas à")

puts "Created Notification Actions."
