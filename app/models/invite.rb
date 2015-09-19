class Invite < ActiveRecord::Base
	belongs_to :team
	belongs_to :inviter, class_name: "User"

	validates :email, {
    presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }

end
