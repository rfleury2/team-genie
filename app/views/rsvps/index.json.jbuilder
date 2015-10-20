json.array! @rsvps do |rsvp|
	json.id rsvp.id
	json.response rsvp.response
	json.comment rsvp.comment
  json.player do
    json.name rsvp.membership.player.name
    json.email rsvp.membership.player.email
  end
end