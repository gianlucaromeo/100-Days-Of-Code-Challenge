class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates :email, presence: true, uniqueness: true

    before_create :generate_confirmation_token

    def generate_confirmation_token
        # Generate a random URL-safe base64 string
        self.confirmation_token = SecureRandom.urlsafe_base64.to_s
    end

    def confirm!
        # Update the user's confirmed_at timestamp and remove the confirmation token
        # We don't need to specify the user table because we're already in the User model
        update!(confirmed_at: DateTime.now, confirmation_token: nil)
    end

    def confirmed?
        # Check if the user has a confirmed_at timestamp
        confirmed_at.present?
    end
end
