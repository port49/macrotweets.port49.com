require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/macro_tweets/show.html.erb" do
  include MacroTweetsHelper
  before(:each) do
    assigns[:macro_tweet] = @macro_tweet = stub_model(MacroTweet,
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ body/)
  end
end

