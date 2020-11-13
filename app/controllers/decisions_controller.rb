class DecisionsController < ApplicationController

    before_action :get_decision, only: [:update, :destroy]
    before_action :get_user, only: [:update, :destroy]

    def index
        @decisions = Decision.all
        @categories = Category.all
        @choices = Choice.all
        @users = User.all
    end

    def show
        @decision = Decision.find(params[:id])
    end

    def new
        @decision = Decision.new
        @user = User.find(params[:user_id])
        @choice = Choice.find(params[:choice_id])
    end

    def create
        #@user = User.find(params[:user_id])
        @user = current_user
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
            #redirect_to @decision
            redirect_to decisions_path
        else
            render :edit
        end
    end
    
    def destroy
        # puts "*****************   decisions_controller/destroy called"
        # puts "@user = #{@user}"
        # puts "@decision = #{@decision}"
        # puts "@self = #{@self}"
        @user.destroy
        redirect_to decisions_path
    end

    # def destroy
    #     @decision.destroy
    #     redirect_to decisions_path
    # end

    private

    def get_decision
        @decision = Decision.find(params[:id])
    end

    def get_user
        puts "params = #{params}"
        puts "@user = #{@user}"
        puts "@decision = #{@decision}"
        @user = current_user
    end

    def decision_params
        params.require(:decision).permit(:decision, :choice_id, :user_id)
    end

end
