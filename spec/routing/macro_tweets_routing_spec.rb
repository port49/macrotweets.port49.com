require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MacroTweetsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "macro_tweets", :action => "index").should == "/macro_tweets"
    end
  
    it "maps #new" do
      route_for(:controller => "macro_tweets", :action => "new").should == "/macro_tweets/new"
    end
  
    it "maps #show" do
      route_for(:controller => "macro_tweets", :action => "show", :id => "1").should == "/macro_tweets/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "macro_tweets", :action => "edit", :id => "1").should == "/macro_tweets/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "macro_tweets", :action => "create").should == {:path => "/macro_tweets", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "macro_tweets", :action => "update", :id => "1").should == {:path =>"/macro_tweets/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "macro_tweets", :action => "destroy", :id => "1").should == {:path =>"/macro_tweets/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/macro_tweets").should == {:controller => "macro_tweets", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/macro_tweets/new").should == {:controller => "macro_tweets", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/macro_tweets").should == {:controller => "macro_tweets", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/macro_tweets/1").should == {:controller => "macro_tweets", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/macro_tweets/1/edit").should == {:controller => "macro_tweets", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/macro_tweets/1").should == {:controller => "macro_tweets", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/macro_tweets/1").should == {:controller => "macro_tweets", :action => "destroy", :id => "1"}
    end
  end
end
