class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]

    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
        @ingredients = Ingredient.all
        @recipe = Recipe.new
    end

    def create
        @ingredients = Ingredient.all
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            @ingredients = Ingredient.all
            render :new
        end
    end

    def edit
        @ingredients = Ingredient.all
    end
    
    def update
        @ingredients = Ingredient.all
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end
