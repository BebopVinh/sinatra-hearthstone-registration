class Player < ActiveRecord::Base
   #bcrypt requirement
   has_secure_password

   #associations
   belongs_to :country
   has_many :player_decks
   has_many :decks, through: :player_decks

   #validation for uniqueness
   validates :email, confirmation: { case_sensitive: false }, uniqueness: true
   validates :email_confirmation, presence: true
   validates :password, confirmation: true
   validates :password_confirmation, presence: true
   validates :username, uniqueness: true

   def slug
      username.downcase.gsub(/[^0-9a-z\- ]/, "").gsub(' ', '-')
   end

   def self.find_by_slug(slug)
      self.all.find {|user| user.slug == slug}
   end
end