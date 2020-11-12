class CategoriesController < ApplicationController

    def index
        @categories = Category.all
        @decisions = Decision.all
        @choices = Choice.all
    end

    def show
        @category = Category.find(params[:id])
        @decision = Decision.find(params[:id])
        @choice = Choice.find(params[:id])
    end
end
