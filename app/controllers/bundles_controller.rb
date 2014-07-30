class BundlesController < ApplicationController
  # skip_before_filter :authenticate_user!
  def home
    if session[:bundle_titles].present?
      @bundle_price = session[:bundle_price]
      @bundle_titles = session[:bundle_titles]
      @titles = (Title.first(8).map(&:id) - @bundle_titles).shuffle
    else
      session[:bundle_titles] = []
      @bundle_titles = []
      @bundle_price = 0
      @titles = Title.first(8).map(&:id).shuffle
    end
  end

  def book_search
    search_text = "%"+params[:search_text]+"%"
    @titles = Title.where("title like (?)",search_text)
  end

  def add_title
    title_id = params[:title_id].to_i
    if !session[:bundle_titles].include?(title_id)
      if session[:bundle_titles].count == 6
        @message = "The bundle cannot have more than 6 books"
        @css_class = 'error'
      else
        session[:bundle_titles] << title_id
        @bundle_price = Bundle.bundle_price_calculation(session[:bundle_titles])
        session[:bundle_price] = @bundle_price
        @message = "Book Added Successfully."
        @css_class = 'success'
      end
    else
      @message = "This book has already been selected"
      @css_class = 'error'
    end
    @titles_cnt = session[:bundle_titles].count
    @bundle_titles = session[:bundle_titles]
    @added_title = title_id
  end

  def remove_book
    @title_id = params[:title_id].to_i
    if session[:bundle_titles].include?(@title_id)
      session[:bundle_titles].delete(@title_id)
      @bundle_price = Bundle.bundle_price_calculation(session[:bundle_titles])
      session[:bundle_price] = @bundle_price
      @message = "Book removed successfully"
      @css_class = 'success'
      @bundle_titles = session[:bundle_titles]
    else
      @message = "This book does not exist in the bundle"
      @css_class = 'error'
      @bundle_titles = session[:bundle_titles]
    end
    @titles_cnt = session[:bundle_titles].count
  end

  def create_bundle
    @bundle_titles = session[:bundle_titles]
    @bundle_price = session[:bundle_price]
  end

end
