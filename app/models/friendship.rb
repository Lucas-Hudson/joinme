class Friendship < ApplicationRecord
    belongs_to :friend, :class_name => "User", :foreign_key => :friend_id
    belongs_to :user, :foreign_key => :user_id
    #belongs_to :friend, :class_name => "User"
    after_create do |p| #p représente la friendship
        if !Friendship.find_by(friend: p.user, user: p.friend)
          Friendship.create!(user: p.friend, friend: p.user)
        end
      end
      after_destroy do |p|
        reciprocal = Friendship.find_by(friend_id: p.user_id )
        reciprocal.destroy unless reciprocal.nil?
      end
end
