class Flashcard < ActiveRecord::Base
	def self.import_from_quizlet
	    require 'net/http'
	    # IF YOU HAVE AN API KEY
	    url = URI.parse("https://api.quizlet.com/2.0/sets/44831586?client_id=ENV['QUIZLET_CLIENT_ID']&whitespace=1")
	    # You can use the gist link in the notes above instead
	    res = Net::HTTP.get_response(url)
	    hash = JSON.parse(res.body)
	    terms = hash["terms"]
	    terms.each do |term|
	      FlashCard.find_or_create_by(card_id: term["id"]) do |card|
	        card.term = term["term"]
	        card.definition = term["definition"]
	    end
    end
    def definition_correct?(guess)
    	guess.eql?(term)
    end
end
