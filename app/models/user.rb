class User < ActiveRecord::Base
  has_one :social_session
  has_many :transactions
  has_many :projects

  # Custom validations
  validate :encrypt_password

  # Attrs validations
  validates :name, presence: true, length: { in: 3..55 }, on: [:create, :update]
  validates :email, presence: true, length: { in: 3..55 }, on: [:create, :update]
  validates :password, presence: true, length: { in: 3..60 }, on: [:create, :update]

  # Associations validations

  # Confirmation validation
  validates_confirmation_of :password
  validates_confirmation_of :email

  # Attrs
  @password_confirmation
  @email_confirmation

  # Encrypt the pasword using BCrypt
  def encrypt_password
    if password.present? && !pass_salt.present? && password_confirmation.present?
      self.pass_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, pass_salt)
      self.password_confirmation = BCrypt::Engine.hash_secret(password_confirmation, pass_salt)
    end
  end

  # Auth user
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.pass_salt) then user else nil end
  end

  def self.create_one user_hash
    return_user = User.new(user_hash)
    return_user.encrypt_password

    return_user
  end
end
