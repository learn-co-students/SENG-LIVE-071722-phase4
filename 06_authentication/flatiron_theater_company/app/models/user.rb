class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets

    has_secure_password 

    # password= : is going to get invoked when we are persisting and setting a passowrd for a new user

    # so we also need to add a column called password_digest to our users table, bc password= is going to look specifically for that field
    # password_confirmation 
    # authenticate: responsible for comparing our users encrypted password to the password they eneterd on login
end
