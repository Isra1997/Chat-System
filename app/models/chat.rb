class Chat < ApplicationRecord
    has_many :messages , dependent: :destroy
    belongs_to :applications, counter_cache: true , foreign_key: 'token'

    # excluding id from json response
    def as_json(options={})
        options[:except] ||= [:id]
        super(options)
    end
end
