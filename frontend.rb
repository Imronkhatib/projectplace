require 'Unirest'
# Start Project Requests

# response = Unirest.get("http://Localhost:3000/projects/:id", parameters:{
#   id: 1
#   }
#   )

# p response.body


# p 'Which project do you want to see'

# the_id = gets.chomp

# # response = Unirest.get("http://Localhost:3000/projects/#{the_id}")

# p response.body



# p 'Type in the id'
# id = gets.chomp

# response = Unirest.patch("http://Localhost:3000/projects/#{id}", parameters: {
#     name: "Projectplace.io",
#     description: "Haha! It in fact is Projectplace.io, it's an amazing Web App"
#   }
#   )

# p response.body

# p "Type in the id of the project you'd like to delete"

# id = gets.chomp
# response = Unirest.delete("http://Localhost:3000/projects/#{id}")

# p response.body


# End Project Requests

# ******************************************************

# Start User Unirest Request

# response = Unirest.get("http://Localhost:3000/users/:id", parameters:{
#   id: 1
#   }
#   )

# p response.body

# p 'Type in the id'
# id = gets.chomp

# response = Unirest.patch("http://Localhost:3000/users/#{id}", parameters: {
#     first_name: "Mohammad",
#     last_name: "Ali",
#     email: "Mohammad.Ali@projectplace.io"
#   }
#   )

# p response.body

# response = Unirest.post("http://Localhost:3000/users/", parameters:
#   {
#     first_name: "Yacob",
#     last_name: "Ishaaq",
#     email: "y.ishaaq@projectplace.io"
#   }
#   )

# p response.body