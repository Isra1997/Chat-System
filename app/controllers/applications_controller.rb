class ApplicationsController < ApplicationController
    before_action :set_app, only: [:show, :update, :destroy]

    # GET /apps
    def index
        @applications = Applications.all
        render json: @applications
    end

    # GET /apps/1
    def show
        render json: @application
    end

    # POST /apps
    def create
        @application = Applications.new(params.require(:application).permit(:name).merge(token: SecureRandom.hex(16), chats_count: 0))
        if @application.save
          render json: @application, status: :created
        else
          render json: @application.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /apps/1
    def update
        if @application.update(params.require(:application).permit(:name))
          render json: @application
        else
          render json: @application.errors, status: :unprocessable_entity
        end
    end

    # DELETE /apps/1
    def destroy
        @application.destroy
    end


    private

    def set_app
        @application = Applications.find(params[:token])
        p @application
    end
    
end
