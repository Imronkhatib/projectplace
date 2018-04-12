require 'Unirest'

while true
  puts "select from the follow:
        [1] Sign Up
        [2] Log In
        [3] View User's Skills
        [4] View User's Projects"

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
  # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  end
end