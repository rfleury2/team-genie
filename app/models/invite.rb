class Invite < ActiveRecord::Base
	belongs_to :team
	belongs_to :inviter, class_name: "User"

	validates :email, {
    presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }

  def self.create_from_team(team, email, inviter)
  	invite = Invite.new(team: team, email: email, inviter: inviter)
  	if invite.save
  		InvitationMailer.send_invitation(invite).deliver_later
  	else
  		redirect_to team_path(team)
  	end
  end

end
