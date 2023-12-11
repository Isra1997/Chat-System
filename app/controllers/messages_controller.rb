class MessagesController < ApplicationController
        before_action :set_message, only: [:show, :update, :destroy]
    
        # GET /application/:application_token/chats/:chat_number/message
        def index
            @chat = Chat.where(token: params[:application_token], number: params[:chat_number])[0]
            if @chat.present?
                @messages = Message.where(
                    chat_id: @chat.id)
            else
                render json: "No chats for application token: "+ params[:application_token] + " and chat number: " + params[:chat_number] , status: not_found
            end
            if @messages.present?
                render json: @messages
            else
                render json: "No messages for application token: "+ params[:application_token] + " and chat number: " + params[:chat_number], status:  :not_found
            end
        end
    
        # GET /application/:application_token/chats/:chat_number/messages/:message_number 
        def show
            if @message.present?
                render json: @message
            else
               render json: "No messages for application token: "+ params[:application_token] +
                " and chat number: " + params[:chat_number] + " and message number: " + params[:message_number] , status:  :not_found
            end
        end
    
        # DELETE /application/:application_token/chats/:chat_number/messages/:message_number
        def destroy
            if @message.present?
                Message.destroy(@message[0].id)
            else
                render json: "No messages for application token: "+ params[:application_token] +
                " and chat number: " + params[:chat_number] + " and message number: " + params[:message_number] , status:  :not_found
            end
        end
    
        # POST /application/:application_token/chats/:chat_number/messages
        def create
            chat = Chat.where(token: params[:application_token], number: params[:chat_number])[0]
            if  chat != nil
                @message = Message.new(message: params[:message], chat_id: chat.id, message_number: chat.messages_count+1)
                if @message.save
                    render json: @message, status: :created
                else
                    render json: @message.errors, status: :unprocessable_entity
                end
            else
                render json: "No chats for application token: " + params[:application_token] + " and chat number: " + params[:chat_number] , status: not_found
            end
        end

        # POST /application/:application_token/chats/:chat_number/messages
        def search
            Message.reindex
            query = params[:query]
            @messages = Message.search(params[:query])
            if @messages.present?
                render json: @messages
            else
                render json: "No results found" , status: :not_found
            end
        end
    
        # PATCH/PUT /application/:application_token/chats/:chat_number/messages/:message_number
        def update
            if  @message.update(params.permit(:message))
                render json: @message
            else
                render json: @message.errors, status: :unprocessable_entity
            end
        end

        
        private
    
        # here we set the message according to: application_token, chat_number
        def set_message
            @chat = Chat.where(token: params[:application_token], number: params[:chat_number])[0]
            if @chat.present?
                @message = Message.where(
                    chat_id: @chat.id, 
                    message_number: params[:message_number])[0]
            end
        end
    
end
