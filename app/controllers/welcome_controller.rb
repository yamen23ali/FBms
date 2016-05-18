class WelcomeController < ApplicationController
  def index
  	#puts params
  	#render :json => params["hub.challenge"]
  end

  def test

    sender = 0

    params["entry"].each {|entry| 
      entry["messaging"].each{|messaging|
      	  sender = messaging["sender"]["id"]
      }
    }

    puts sender

  	response = HTTParty.post('https://graph.facebook.com/v2.6/me/messages?access_token=CAANwgOLMeogBANkoaDJTz8V2kBJGcwiUWaDLxEH6PYnojIIjgimDtXYdizm25qgz1UME51uYeytZBJD1j3nP9KQxm5CUDtzfNb6ZAMLJGH71iTLKKsVrmWcBj9welZBMuFaM6kyG5znAmI1iC8PRsLffUuzVlDAwZBytJyMeJep5BBZCMMH4TjuWchSBcDgn1DrqBw9PPOgZDZD',
    :query => { recipient: { id: sender}, message: { text: "Safoo2aaa <3 <3 <3" }})

    puts response

  	render :json => '"Hellllo"'
  end
end
