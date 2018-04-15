require 'Unirest'
while true
  puts "select from the follow:
        [1] Sign Up
        [2] Log In
        [3] View Projects
        [4] Create a Project
        [5] Update a Project"

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

  if user_input == 4
    puts "What is the project's name"
    project_name = gets.chomp
    puts "What is the project description"
    project_description = gets.chomp
    puts "What kind of project is it?"
    project_type = gets.chomp
    puts "When does it start"
    start_date = gets.chomp
    puts "when does it end"
    end_date = gets.chomp
    response = Unirest.post("http://Localhost:3000/projects", parameters: 
    {  
      name: "#{project_name}",
      description: "#{project_description}",
      project_type: "#{project_type}",
      start_date: "#{start_date}",
      end_date: "#{end_date}"
      }
    )

    project = response.body 

  end

  if user_input == 5
    p 'Which project would you like to edit'
    id = gets.chomp
    puts "What is the project's name"
    project_name = gets.chomp
    puts "What is the project description"
    project_description = gets.chomp
    puts "What kind of project is it?"
    project_type = gets.chomp
    puts "When does it start"
    start_date = gets.chomp
    puts "when does it end"
    end_date = gets.chomp

    response = Unirest.patch("http://Localhost:3000/projects/#{id}", parameters: {
        name: "#{project_name}",
        description: "#{project_description}",
        project_type: "#{project_type}",
        start_date: "#{start_date}",
        end_date: "#{end_date}"
      }
      )

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
