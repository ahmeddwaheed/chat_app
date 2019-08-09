module TokenGenerator
  def self.token
    loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless App.exists?(token: random_token)
    end
  end
end