require 'digest/sha2'

class User < ActiveRecord::Base
	validates :userName, :uniqueness => true, :presence => true
  has_many :Farms
  has_many :Posts

  attr_accessor :password_confirmation
  attr_reader :password

  class << self
    def authenticate(name,password)
      puts password
      user = find_by_userName(name)
      if user && !password.blank?
        if user.hashed_password == encrypt_password(password,user.salt)
          user
        end
      end
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "extraStuffToMakePasswordsHarderToCrack" + salt)
    end
  end

  def password=(password)
      @password = password
      if password.present?
        generate_salt
        self.hashed_password = self.class.encrypt_password(password,salt)
      end
    end

  private
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
