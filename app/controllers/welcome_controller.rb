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

  	response = HTTParty.post('https://graph.facebook.com/v2.6/me/messages?access_token=',
    :query => { recipient: { id: sender}, message: { text: "Safoo" }})

    puts response

  	render :json => '"Hellllo"'
  end
end
