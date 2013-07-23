#require 'digest/sha1'

class User < ActiveRecord::Base

  attr_accessor :password

  before_save :create_hashed_password
  after_save :clear_password

  validates_presence_of :username
  validates_length_of :username, :within => 3..20
  validates_uniqueness_of :username
  validates_length_of :password, :within => 6..20, :on => :create

  def self.authenticate(username="", password="")

    user = User.find_by(username: "#{username}")

    if user && user.password_match?(password)
      return user
    else
      return false
    end

  end

  def password_match?(password_to_check="")

    self.hashed_password.eql?(User.hash_with_salt(password_to_check, self.salt))

  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt.")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}.")
  end
 
  private

  def create_hashed_password

    unless password.blank?
      
      self.salt = User.make_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)

    end

  end

  def clear_password

    self.password = nil

  end

end
