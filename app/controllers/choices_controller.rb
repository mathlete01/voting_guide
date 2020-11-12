class ChoicesController < ApplicationController

    def index
        @choices = Choice.all
        @decisions = Decision.all
        @categories = Category.all
    end

    def show
        @decision = Decision.find(params[:id])
        @category = Category.find(params[:id])
        @choice = Choice.find(params[:id])
    end
end
