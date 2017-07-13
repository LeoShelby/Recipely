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
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
