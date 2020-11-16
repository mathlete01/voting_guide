class DecisionsController < ApplicationController

    before_action :get_decision, only: [:update, :destroy]
    before_action :get_user, only: [:update, :destroy]

    def index
        @categories = Category.all
    end

    def show
        @decision = get_decision
    end

    def new
    end

    def create
        if @decision.save
            redirect_to decision_path(@decision)
        else
            render :new
        end
    end

    def edit
        @decision = get_decision
    end

    def update
        if @decision.update(decision_params)
            redirect_to decisions_path
        else
            render :edit
        end
    end
    
    def destroy
        @user.destroy
        redirect_to decisions_path
    end

    private

    def get_decision
        @decision = Decision.find(params[:id])
    end

    def get_user
        @user = current_user
    end

    def decision_params
        params.require(:decision).permit(:decision, :choice_id, :user_id)
    end

end
