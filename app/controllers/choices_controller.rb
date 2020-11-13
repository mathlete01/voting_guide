class ChoicesController < ApplicationController

    def index
        @choices = Choice.all
        @decisions = Decision.all
        @categories = Category.all
    end

    def show
        @choice = Choice.find(params[:id])
    end
end
