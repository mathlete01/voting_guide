class DecisionsController < ApplicationController

    before_action :get_decision, only: [:update, :destroy]

    def index
        @decisions = Decision.all
        @categories = Category.all
        @choices = Choice.all
        @users = User.all
    end

    def show
        @decision = Decision.find(params[:id])
        #@category = Category.find(params[:id])
        #@choice = Choice.find(params[:id])
    end

    def new
        @decision = Decision.new
        @user = User.find(params[:user_id])
        @choice = Choice.find(params[:choice_id])
    end

    def create
        @user = User.find(params[:user_id])
        @choice = Choice.find(params[:choice_id])
        @decision = Decision.create(user: @user, choice: @choice, decision: params[:decision][:decision])
        if @decision.save
            redirect_to decision_path(@decision)
        else
            render :new
        end
    end

    def edit
        @decision = Decision.find(params[:id])
    end

    def update
        if @decision.update(decision_params)
            redirect_to @decision
        else
            render :edit
        end
    end
    
    def destroy
        @decision.destroy
        redirect_to '/decisions'
    end

    private

    def get_decision
        @decision = Decision.find(params[:id])
    end

    def decision_params
        params.require(:decision).permit(:decision, :choice_id, :user_id)
    end

end
