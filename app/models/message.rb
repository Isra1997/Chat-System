class Message < ApplicationRecord
    belongs_to :chat, counter_cache: true
    searchkick
    validates :message, presence: true
    # excluding id from json response
    def as_json(options={})
        options[:except] ||= [:id]
        super(options)
    end
end
