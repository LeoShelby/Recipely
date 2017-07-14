class Recipe < ApplicationRecord
  VALID_CATEGORY_REGEX = /\A(primo|secondo|contorno|dessert)\z/i   #espressione regolare per gestire il giusto formate delle content(primo secondo contorno dessert) e rate(
  belongs_to :user #la ricetta ha un solo utente 
  default_scope -> { order(created_at: :desc) }#prendere le ricette in ordine decrescente temporalmente
   mount_uploader :picture, PictureUploader #per caricare una sola immagine
  validates :user_id,presence: true #prima di salvare una ricetta nel db ci deve essere l'utente che l ha scritta
  validates :content, presence: true
  
  validates :title, presence: true, length: { maximum: 100 }
  validates  :rate, presence: true, :inclusion => {:in => [1,2,3,4,5]}#rate solo 1 2 3 4 5
  validates :category, presence: true, format: { with: VALID_CATEGORY_REGEX }
  validate  :picture_size #definisco un validatore personale per le immagini ossia campmpo picture


  has_many :notifications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :doneits, dependent: :destroy
  
  has_many :ratings, dependent: :destroy
  
  after_create :badge_level_up
  after_destroy :badge_level_down
  
  
  
  #calcolo la media escludendo tutti i rating pari a 0, ossia tutti i rating generati non appena ogni utente apre una ricetta
  def average_rating
    if ratings.where("score > 0").size != 0
		ratings.where("score > 0").sum(:score) / ratings.where("score > 0").size
	else
		0
	end
  end
  
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
    
    
    def badge_level_up
		if !(user.badges.find_by(type_bad: "Recipe Creator").nil?)    #se ho già il badge devo solo vedere se va aggiornato al livello superiore
			badge=user.badges.find_by(type_bad: "Recipe Creator")
			if user.recipes.count >=3
				badge.update_attribute(:level , "3")
			elsif user.recipes.count >=2
				badge.update_attribute(:level , "2")
			elsif user.recipes.count >=1
				badge.update_attribute(:level , "1")
			end
		else 
			if user.recipes.count >= 1       #se non ho già un badge e ho messo più di 10 like ottengo il badge di livello 1
				Badge.create(
				  user:  user,
				  type_bad: "Recipe Creator",
				  level: 1,
				  picture: "creator.png"
				)
			end
		end
	end
	
	def badge_level_down
		if !(user.badges.find_by(type_bad: "Recipe Creator").nil?)    #se ho già il badge devo solo vedere se va aggiornato al livello inferiore
			badge=user.badges.find_by(type_bad: "Recipe Creator")
			if user.recipes.count==0
				badge.update_attribute(:level , "0")         #se togli tutti i like arrivi al livello zero
			elsif user.recipes.count < 2
				badge.update_attribute(:level , "1")
			elsif user.recipes.count < 3
				badge.update_attribute(:level , "2")
	        end
	    end
	end
  
end
