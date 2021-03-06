class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true

  attr_reader :password

  after_initialize :ensure_session_token
  has_many(
    :recipes,
    class_name: :Recipe,
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :annotations,
    class_name: :Annotation,
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :comments,
    class_name: :Comment,
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy
  )
  has_many :votes, dependent: :destroy

  def self.find_by_credentials(email, password)
    user = self.find_by(email: email)
    return nil unless user && user.valid_password?(password)

    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
