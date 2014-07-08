require 'spec_helper'

describe WelcomePageController do
  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it 'it routes to the home page' do
      expect(:get => '/').to route_to(
        :controller => 'welcome_page',
        :action => 'index')
    end

    it "has a title" do
      visit '/'
      # save_and_open_page
      expect(page).to have_content('Chaturanga Che6s')
      # response.should be_success
      # page.should have_css('h1', :text => 'Chaturanga Chess')
      # response.should have_selector("title:contains('Chaturanga Chess')")

    end


  end

end
