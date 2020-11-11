class ChoicesController < ApplicationController

    def index
        @choices = Choice.all
    end

    def show
        @choice = Choice.find(params[:id])
    end
end
