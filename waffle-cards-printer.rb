require 'typhoeus' # a curl gem: https://github.com/typhoeus/typhoeus
require 'json'

user = "bvn-architecture"
repo = "styleguide"

card_URL  = "https://api.waffle.io/#{user}/#{repo}/cards"
request   =  Typhoeus.get(card_URL, followlocation: true)
card_JSON = JSON.parse(request.body)

document_html = "<html><head><link rel='stylesheet' href='card.css'></head><body>"

# puts JSON.pretty_generate(card_JSON[0])
for card in card_JSON do
    unless card["githubMetadata"]["state"] == "closed"

        size = card['size'] ? "<span class='points'>#{card['size']} points</span>" : ""

        person = card['githubMetadata']['assignee'] ? "<span class='person'>
                <img src='#{card['githubMetadata']['assignee']['avatar_url']}'>
                #{card['githubMetadata']['assignee']['login']}
            </span>" : ""

        card_template = "
          <div class='card'>
            <span class='issue-number'>##{card['githubMetadata']['number']}</span>
            #{size}
            <h1>#{card['githubMetadata']['title']}</h1>
            #{person}
            <span class='comments'>
              <img src='https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/128/comments.png'>
              #{card['githubMetadata']['comments']}
            </span>
          </div>"
        document_html << card_template  
    end
end

document_html << "</body></html>"

File.open("cards.html", 'w') { |file| file.write(document_html) }