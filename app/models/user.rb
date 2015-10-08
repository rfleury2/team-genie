class User < ActiveRecord::Base
	# Tasks
	before_create { generate_token(:auth_token) }
  after_create { assign_role }

  # Associations
  has_many :captainships, foreign_key: :captain_id, class_name: "Team"
  has_many :memberships, foreign_key: :player_id

  # Validations
  has_secure_password
  validates :email, {
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }
  validates_length_of :password, minimum: 6, too_short: "Please enter a password that is a minimum of 6 characters"
	validates_confirmation_of :password

	validates_presence_of :name

  def is_admin?
    role == 'admin'
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.update_attributes(
      password_reset_sent_at: Time.zone.now
    )
    self.save!(validate: false)
    UserMailer.password_reset(self).deliver_later
  end

  def self.from_facebook(auth)
    where(email: auth['info']['email']).first
  end

  def self.create_from_facebook(auth)
    user = self.create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def join_teams
    invites = Invite.where({email: self.email})
    return if invites.empty?
    invites.each do |invite|
      membership = Membership.new(team: invite.team, player: self)
      invite.destroy if membership.save
    end
  end
  
  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def assign_role(role_string = "player")
    self.role = role_string
    self.save(validate: false)
  end

end
