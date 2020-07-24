class User < ApplicationRecord

  before_create :set_access_token

  private

  def set_access_token
    binding.pry
    self.token_id = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(token_id: token).exists?
    end
  end
end
