class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :destroy]

    # GET /applications/:application_token/chats
    def index
        @chats = Chat.where(token: params[:application_token])
        if @chats.present?
            render json: @chats
        else
            render json: "No chats for application token: "+ params[:application_token], status:  :not_found
        end
    end

    # GET  /applications/:application_token/chats/:chat_number
    def show
        if @chat.present?
            render json: @chat
        else
            render json: "No chats for application token: "+ params[:application_token] + " and chat number: " + params[:number], status:  :not_found
        end
    end

    # DELETE /applications/:application_token/chats/:chat_number
    def destroy
        if @chat.present?
            Chat.destroy(@chat[0].id)
        else
            render json: "No chats for application token: "+ params[:application_token] + " and chat number: " + params[:number], status:  :not_found
        end
    end

    # POST /applications/:application_token/chats
    def create
        app = Applications.where(token: params[:application_token])[0]
        if  app != nil
            @chat = Chat.new(token: params[:application_token], messages_count:0, number: app.chats_count+1)
            if @chat.save
                render json: @chat, status: :created
            else
                render json: @chat.errors, status: :unprocessable_entity
            end
        else
            render json: "App not found", status:  :not_found
        end
    end
    
    private

    # here we set the message according to: application_token, chat_number
    def set_chat
        @chat = Chat.where(token: params[:application_token],
             number: params[:number])
    end

end
