require 'Unirest'
while true
  puts "select from the follow:
        [1] Sign Up
        [2] Log In
        [3] View Projects
        [4] Create a Project"

# ******************************************************
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

# Start User  Request



  user_input = gets.chomp.to_i
  if user_input == 1
    puts "Enter your full name"
    user_name = gets.chomp
    puts "Enter your email"
    user_email = gets.chomp
    puts "Enter your password"
    user_password = gets.chomp
    puts "Confirm your password"
    user_password_confirmation = gets.chomp
    response = Unirest.post("http://localhost:3000/users",
    parameters: {
      name: "#{user_name}",
      email: "#{user_email}",
      password: "#{user_password}",
      password_confirmation: "#{user_password_confirmation}"
    }
  )
    user = response.body
  end

  if user_input == 2
    puts "Enter your email"
    user_email = gets.chomp
    puts "Enter your password"
    user_password = gets.chomp
    response = Unirest.post("http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "#{user_email}",
      password: "#{user_password}"
    }
  }
)

  # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # p jwt 
  # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  end

  if user_input == 3
    response = Unirest.get("http://Localhost:3000/projects")

    p response.body
  end

# response = Unirest.patch("http://Localhost:3000/users/#{id}", parameters: {
#     first_name: "Mohammad",
#     last_name: "Ali",
#     email: "Mohammad.Ali@projectplace.io"
#   }
#   )

# p response.body



# End User Requests
# ****************************************************

# Start Skills Requests

end
