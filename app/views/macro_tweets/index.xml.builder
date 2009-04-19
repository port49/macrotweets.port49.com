xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "My MacroTweets"
    xml.description "My MacroTweets"
    xml.link macro_tweets_url

    @macro_tweets.each do |macro_tweet|
      xml.item do
        xml.title macro_tweet.body.length > 140 ? macro_tweet.body[ 0, 137 ] + '...' : macro_tweet.body
        xml.description macro_tweet.body
        xml.pubDate macro_tweet.created_at.to_s( :rfc822 )
        xml.link macro_tweet_url( macro_tweet )
      end
    end
  end
end

