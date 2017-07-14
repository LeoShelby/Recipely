class Recipe < ApplicationRecord
  VALID_CATEGORY_REGEX = /\A(primo|secondo|contorno|dessert)\z/i   #espressione regolare per gestire il giusto formate delle content(primo secondo contorno dessert) e rate(
  has_many  :ingredients
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
    
    
    
    #chiamo il metodo comune a tutti i badges nel model application_record  SUPERDRY
    
    def badge_level_up
		badge_level_up_aux("Creator","creator","recipes")
	end
    def badge_level_down
		badge_level_down_aux("Creator","creator","recipes")
	end
    
    
    
  
end
