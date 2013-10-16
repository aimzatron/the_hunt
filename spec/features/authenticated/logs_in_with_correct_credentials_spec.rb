require 'spec_helper'

describe 'logs in with correct credentials' do
  it 'logs in' do
    click_link_or_button "Sign in with Foursquare"
  end
end
