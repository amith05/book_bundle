require 'spec_helper'

describe BundlesController do
  context "Listing titles on home page" do
    it "response should be ok on call of home action" do
      get :home
      response.should be_success
    end
    it "lists the titles" do
      title1 = Factory(:title)
      title2 = Factory(:title)
      get :home
      assigns[:titles].count.should == 2
    end
  end

  context "Book Search- Sql query" do
    before(:each) do
      Title.delete_all
    end
    it "should return nil if titles are not found" do
      get :book_search, {:search_text => 'foo', :format => 'js'}
      assigns(:titles).should eq([])
    end

    it "should return title result set if searched text matches with the respective title" do
      title1 = Factory(:title,:title => 'foo')
      title2 = Factory(:title,:title => 'foo2')
      get :book_search, {:search_text => 'foo2', :format => 'js'}
      assigns(:titles).should eq([title2])
    end

    it "should return title result set should contain my search_text" do
      title1 = Factory(:title,:title => 'foo')
      title2 = Factory(:title,:title => 'foo2')
      title3 = Factory(:title,:title => '23foo2213')
      get :book_search, {:search_text => '2foo2', :format => 'js'}
      assigns(:titles).count.should == 0
    end

    it "should return title result set should contain my search_text" do
      reg = /foo22/
      title1 = Factory(:title,:title => 'foo')
      title2 = Factory(:title,:title => 'foo2')
      title3 = Factory(:title,:title => '23foo2213')
      get :book_search, {:search_text => 'foo22', :format => 'js'}
      assigns(:titles).count.should > 0
      assigns(:titles).each do |t|
        reg.match(t.title)[0].should == 'foo22'
      end
    end
  end

   context "Add titles to bundles" do
    it "adds title to session variable" do
      title = Factory(:title)
      session[:bundle_titles] = []
      get :add_title, {:title_id => title.id, :format => 'js'}
      assigns[:message].should == "Book Added Successfully."
      assigns[:titles_cnt].should == 1
      assigns[:bundle_titles].should == [title.id]
      assigns[:css_class].should == 'success'
    end

    it "adds title to session variable and updates the bundle price" do
      session[:bundle_titles] = []
      session[:bundle_price] = []
      title1 = Factory(:title,:mrp => 500)
      title2 = Factory(:title,:mrp => 400)
      title3 = Factory(:title,:mrp => 100)
      title4 = Factory(:title,:mrp => 500)
      title5 = Factory(:title,:mrp => 200)
      get :add_title, {:title_id => title1.id, :format => 'js'}
      get :add_title, {:title_id => title2.id, :format => 'js'}
      get :add_title, {:title_id => title3.id, :format => 'js'}
      get :add_title, {:title_id => title4.id, :format => 'js'}
      get :add_title, {:title_id => title5.id, :format => 'js'}
      assigns[:titles_cnt].should == 5
      assigns[:bundle_titles].should == [title1.id,title2.id,title3.id,title4.id,title5.id]
      bundle_price = assigns(:bundle_price)
      (bundle_price % 10).should == 9
      session[:bundle_price].should == bundle_price
    end

    it "should not allow the same book to be added twice" do
      title = Factory(:title)
      session[:bundle_titles] = []
      get :add_title, {:title_id => title.id, :format => 'js'}
      assigns[:message].should == "Book Added Successfully."
      get :add_title, {:title_id => title.id, :format => 'js'}
      assigns[:message].should == "This book has already been selected"
      assigns[:titles_cnt].should == 1
      assigns[:css_class].should == 'error'
    end

    it "should not allow addition of more than 6 books" do
      session[:bundle_titles] = []
      title1 = Factory(:title)
      title2= Factory(:title)
      title3 = Factory(:title)
      title4 = Factory(:title)
      title5 = Factory(:title)
      title6 = Factory(:title)
      title7 = Factory(:title)
      get :add_title, {:title_id => title1.id, :format => 'js'}
      get :add_title, {:title_id => title2.id, :format => 'js'}
      get :add_title, {:title_id => title3.id, :format => 'js'}
      get :add_title, {:title_id => title4.id, :format => 'js'}
      get :add_title, {:title_id => title5.id, :format => 'js'}
      get :add_title, {:title_id => title6.id, :format => 'js'}
      assigns[:titles_cnt].should == 6
      get :add_title, {:title_id => title7.id, :format => 'js'}
      assigns[:message].should == "The bundle cannot have more than 6 books"
      assigns[:titles_cnt].should == 6
      assigns[:bundle_titles].should == [title1.id,title2.id,title3.id,title4.id,title5.id,title6.id]
      assigns[:css_class].should == 'error'
    end
  end

  context "Remove titles from bundles" do
    it "removes title to session variable" do
      title1 = Factory(:title)
      title2= Factory(:title)
      title3 = Factory(:title)
      title4 = Factory(:title)
      title5 = Factory(:title)
      title6 = Factory(:title)
      title7 = Factory(:title)
      session[:bundle_titles] = [title1.id,title2.id,title3.id,title4.id,title5.id,title6.id]
      get :remove_book, {:title_id => title1.id, :format => 'js'}
      assigns[:message].should == "Book removed successfully"
      assigns[:titles_cnt].should == 5
      assigns[:bundle_titles].should == [title2.id,title3.id,title4.id,title5.id,title6.id]
      assigns[:css_class].should == 'success'

      #does not allow the same book to be removed twice
      get :remove_book, {:title_id => title1.id, :format => 'js'}
      assigns[:message].should == "This book does not exist in the bundle"
      assigns[:titles_cnt].should == 5
      assigns[:css_class].should == 'error'
    end

    it "changes the bundle price while removing titles from session variables" do
      session[:bundle_price] = []
      title1 = Factory(:title,:mrp => 500)
      title2 = Factory(:title,:mrp => 400)
      title3 = Factory(:title,:mrp => 100)
      title4 = Factory(:title,:mrp => 500)
      title5 = Factory(:title,:mrp => 200)
      session[:bundle_titles] = [title1.id,title2.id,title3.id,title4.id,title5.id]
      get :remove_book, {:title_id => title1.id, :format => 'js'}
      p bundle_price = assigns(:bundle_price)
      p (bundle_price % 10).should == 9
    end
  end
end