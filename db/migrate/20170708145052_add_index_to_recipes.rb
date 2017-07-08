class AddIndexToRecipes < ActiveRecord::Migration[5.0]
  def change
	add_index :recipes,[:user_id, :created_at]#indice per ottimizzare la ricerca per utente e data(feed) contemporaneamente
  end
end
