module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(4, false)
      break random_token unless token_exists?(random_token)
    end
  end

  def token_exists?(random_token)
    model_names = ["Event", "Course"]

    model_names.any? do |model_name|
      model_name.constantize.exists?(token: random_token)
    end
  end
end