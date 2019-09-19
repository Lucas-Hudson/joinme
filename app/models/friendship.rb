class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User", :foreign_key => :friend_id

    enum status: [:pending, :accepted, :denied]

    #belongs_to :friend, :class_name => "User"
    after_update do |p| #p représente la friendship
        if !Friendship.find_by(friend: p.user, user: p.friend)
          Friendship.create!(user: p.friend, friend: p.user, status: 1)
        end
      end
end
