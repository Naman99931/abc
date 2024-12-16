=begin
  
rescue 
end

require 'json'
require 'bcrypt'

class User
  attr_accessor :u_name ,:u_id ,:email ,:address ,:password

  def initialize(u_name , u_id , email ,address ,password)
    @u_name = u_name
    @u_id = u_id
    @email = email
    @address = address
    @password = password
  end

  def self.load_users
    #return [] unless File.exist?('data/users.json')

    users_data = JSON.parse(File.read('users_data.json'))
    users_data.map do |u_data|
        new(u_data['u_name'],u_data['u_id'],u_data['email'],u_data['address'], u_data['password'])
    end
  end

  def self.save_users(users)
    File.write('users_data.json', JSON.pretty_generate(users.map { |user| { 'u_name' => user.u_name,'u_id' => user.u_id , 'email' => user.email , 'address' => user.address ,  'password' => user.password } }))
  end

  def self.register(u_name,u_id,email,address, password)
    users = load_users
    return false if users.any? { |user| user.u_name == u_name }

    hashed_password = BCrypt::Password.create(password)
    new_user = User.new(u_name, hashed_password)
    users << new_user
    save_users(users)
    true
  end

  def self.authenticate(u_name, password)
    users = load_users
    user = users.find { |u| u.u_name == u_name }

    if user && BCrypt::Password.new(user.password) == password
      true
    else
      false
    end
  end
end


=end

require 'json'
require 'bcrypt'

class User
  attr_reader :u_name, :u_id, :email, :address, :password

  def initialize(u_name, u_id, email, address, password)
    @u_name = u_name
    @u_id = u_id
    @email = email
    @address = address
    @password = password
  end

  # Load all users from JSON file
  def self.load_users
    return [] unless File.exist?('users_data.json') # If the file does not exist, return an empty array

    users_data = JSON.parse(File.read('users_data.json'))
    users_data.map do |u_data|
      new(u_data['u_name'], u_data['u_id'], u_data['email'], u_data['address'], u_data['password'])
    end
  end

  # Save all users to JSON file
  def self.save_users(users)
    File.write('users_data.json', JSON.pretty_generate(users.map { |user| 
      { 'u_name' => user.u_name, 'u_id' => user.u_id, 'email' => user.email, 'address' => user.address, 'password' => user.password }
    }))
  end

  # Register a new user
  def self.register(u_name, u_id, email, address, password)
    users = load_users
    return false if users.any? { |user| user.u_name == u_name }

    hashed_password = BCrypt::Password.create(password)
    new_user = User.new(u_name, u_id, email, address, hashed_password)
    users << new_user
    save_users(users)
    true
  end

  # Authenticate a user by username and password
  def self.authenticate(u_name, password)
    users = load_users
    user = users.find { |u| u.u_name == u_name }

    if user && BCrypt::Password.new(user.password) == password
      true
    else
      false
    end
  end
end
