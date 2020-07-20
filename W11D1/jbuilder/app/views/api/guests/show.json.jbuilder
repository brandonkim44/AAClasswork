# json.extract! @guest, :name, :age, :favorite_color

json.partial! 'api/guests/guest', guest: @guest

#incorrect
# json.gifts do
#     @guest.gifts do |gift|
#         json.extract! gift, :title, :description
#     end
# end

# json.gifts do
#     json.extract! @guest.gifts, :title, :description
# end

#correct
json.gifts do
    json.array! @guest.gifts, :title, :description
end
# ask ta about this later, why we can't use extract?

