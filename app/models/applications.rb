class Applications < ApplicationRecord
    self.primary_key = "token"
    has_many :chats, dependent: :destroy , foreign_key: 'token'
end
