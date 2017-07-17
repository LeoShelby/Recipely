class AllergensController < ApplicationController
  def new
  
	@allergen = Allergen.new
	
	@cmp_list=['Molluscs','Lupin','Mustard','Crustaceans', 'Eggs ', 'Fish','Peanuts','Soybeans','Milk','Nuts','Celery']

	@full_list=['Molluscs','Lupin','Mustard','Crustaceans', 'Eggs ', 'Fish','Peanuts','Soybeans','Milk','Nuts','Celery']
	@id=params[:format]
	@recipe=Recipe.find(@id)
	
	@cmp_list.each do |t|
	
		if  ( @recipe.allergens.find_by(type_allergen: t) )
			@full_list.delete(t)
		end
	
	end	
	
	 if @full_list.empty?
		@full_list=['Empty']
		flash[:warning]="No more allergens available click to finish"
		
		
	 end

	
 end


	def new_foruser
	@allergen = Allergen.new
	
	@cmp_list=['Molluscs','Lupin','Mustard','Crustaceans', 'Eggs ', 'Fish','Peanuts','Soybeans','Milk','Nuts','Celery']

	@full_list=['Molluscs','Lupin','Mustard','Crustaceans', 'Eggs ', 'Fish','Peanuts','Soybeans','Milk','Nuts','Celery']
	@id=params[:id]
	@user=User.find(@id)
	
	@cmp_list.each do |t|
	
		if  ( @user.allergens.find_by(type_allergen: t) )
			@full_list.delete(t)
		end
	
	end	
	
	 if @full_list.empty?
		@full_list=['Empty']
		flash[:warning]="No more allergens available click to finish"
		
	 end
	 
	 render 'new_foruser'		
	
	end


	def create
		@name=params[:allergen][:type_allergen]
		 
		@recipe=Recipe.find(params[:recipe_id])
		if @name=='Empty'
			redirect_to allergens_new_path(@recipe.id) 
		else
			@recipe.allergens.create!(type_allergen: @name)
			flash[:success]="Allergen added : "+ @name
			redirect_to allergens_new_path(@recipe.id)
		end
	
	end
	
	def create_foruser
		@name=params[:allergen][:type_allergen]
		 
		@user=User.find(params[:user_id])
		if @name=='Empty'
			redirect_to request.referrer
		else
			@user.allergens.create!(type_allergen: @name)
			flash[:success]="Allergen added : "+ @name
			redirect_to request.referrer
		end	
	end
	
	def show_all
		@l=[]
		@user.allergens.each do |a|
			@l.push(a.type_allergen)
		end
	end
	
end
