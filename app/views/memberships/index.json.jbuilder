json.array! @memberships do |membership|
	json.id membership.id
  json.amount_owed membership.amount_owed
  json.player do
    json.name membership.player.name
    json.email membership.player.email
  end
end