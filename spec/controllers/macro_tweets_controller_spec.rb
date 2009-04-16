require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MacroTweetsController do

  def mock_macro_tweet(stubs={})
    @mock_macro_tweet ||= mock_model(MacroTweet, stubs)
  end
  
  describe "GET index" do
    it "assigns all macro_tweets as @macro_tweets" do
      MacroTweet.should_receive(:find).with(:all).and_return([mock_macro_tweet])
      get :index
      assigns[:macro_tweets].should == [mock_macro_tweet]
    end
  end

  describe "GET show" do
    it "assigns the requested macro_tweet as @macro_tweet" do
      MacroTweet.should_receive(:find).with("37").and_return(mock_macro_tweet)
      get :show, :id => "37"
      assigns[:macro_tweet].should equal(mock_macro_tweet)
    end
  end

  describe "GET new" do
    it "assigns a new macro_tweet as @macro_tweet" do
      MacroTweet.should_receive(:new).and_return(mock_macro_tweet)
      get :new
      assigns[:macro_tweet].should equal(mock_macro_tweet)
    end
  end

  describe "GET edit" do
    it "assigns the requested macro_tweet as @macro_tweet" do
      MacroTweet.should_receive(:find).with("37").and_return(mock_macro_tweet)
      get :edit, :id => "37"
      assigns[:macro_tweet].should equal(mock_macro_tweet)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created macro_tweet as @macro_tweet" do
        MacroTweet.should_receive(:new).with({'these' => 'params'}).and_return(mock_macro_tweet(:save => true))
        post :create, :macro_tweet => {:these => 'params'}
        assigns[:macro_tweet].should equal(mock_macro_tweet)
      end

      it "redirects to the created macro_tweet" do
        MacroTweet.stub!(:new).and_return(mock_macro_tweet(:save => true))
        post :create, :macro_tweet => {}
        response.should redirect_to(macro_tweet_url(mock_macro_tweet))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved macro_tweet as @macro_tweet" do
        MacroTweet.stub!(:new).with({'these' => 'params'}).and_return(mock_macro_tweet(:save => false))
        post :create, :macro_tweet => {:these => 'params'}
        assigns[:macro_tweet].should equal(mock_macro_tweet)
      end

      it "re-renders the 'new' template" do
        MacroTweet.stub!(:new).and_return(mock_macro_tweet(:save => false))
        post :create, :macro_tweet => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested macro_tweet" do
        MacroTweet.should_receive(:find).with("37").and_return(mock_macro_tweet)
        mock_macro_tweet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :macro_tweet => {:these => 'params'}
      end

      it "assigns the requested macro_tweet as @macro_tweet" do
        MacroTweet.stub!(:find).and_return(mock_macro_tweet(:update_attributes => true))
        put :update, :id => "1"
        assigns[:macro_tweet].should equal(mock_macro_tweet)
      end

      it "redirects to the macro_tweet" do
        MacroTweet.stub!(:find).and_return(mock_macro_tweet(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(macro_tweet_url(mock_macro_tweet))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested macro_tweet" do
        MacroTweet.should_receive(:find).with("37").and_return(mock_macro_tweet)
        mock_macro_tweet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :macro_tweet => {:these => 'params'}
      end

      it "assigns the macro_tweet as @macro_tweet" do
        MacroTweet.stub!(:find).and_return(mock_macro_tweet(:update_attributes => false))
        put :update, :id => "1"
        assigns[:macro_tweet].should equal(mock_macro_tweet)
      end

      it "re-renders the 'edit' template" do
        MacroTweet.stub!(:find).and_return(mock_macro_tweet(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested macro_tweet" do
      MacroTweet.should_receive(:find).with("37").and_return(mock_macro_tweet)
      mock_macro_tweet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the macro_tweets list" do
      MacroTweet.stub!(:find).and_return(mock_macro_tweet(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(macro_tweets_url)
    end
  end

end
