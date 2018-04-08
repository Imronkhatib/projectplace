require 'Unirest'

# response = Unirest.get("http://Localhost:3000/projects/:id", parameters:{
#   id: 1
#   }
#   )

# p response.body


# p 'Which project do you want to see'

# the_id = gets.chomp.to_i

# # response = Unirest.get("http://Localhost:3000/projects/#{the_id}")

# p response.body



# p 'Type in the id'
# id = gets.chomp.to_i

# response = Unirest.patch("http://Localhost:3000/projects/#{id}", parameters: {
#     name: "Projectplace.io",
#     description: "Haha! It in fact is Projectplace.io, it's an amazing Web App"
#   }
#   )

# p response.body

# p "Type in the id of the project you'd like to delete"

# id = gets.chomp.to_i
# response = Unirest.delete("http://Localhost:3000/projects/#{id}")

# p response.body