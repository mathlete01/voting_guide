class DecisionsController < ApplicationController

    def index
        @decisions = Decision.all
        @categories = Category.all
    end

    def show
        @decision = Decision.find(params[:id])
    end
end
