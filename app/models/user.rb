class User < ApplicationRecord
  has_secure_password
  belongs_to :company
  validates_presence_of :f_name, :l_name, :password_digest
  validates :email,
            uniqueness: true,
            format: {
              with: /\A\S+@.+\.\S+\z/, message: 'Must be email address.'
            },
            length: { in: 8..250 }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_send_at = Time.zone.now
    save!
    ResetMailer.password_reset(self).deliver
  end
end
