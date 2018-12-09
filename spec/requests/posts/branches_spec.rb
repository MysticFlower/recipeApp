require 'rails_helper'
include Warden::Test::Helpers
RSpec.describe "branches", :type => :request do

  shared_examples 'render_templates' do
    it 'renders a vegetarian template' do
      get '/posts/vegetarian'
      expect(response).to render_template(:vegetarian)
    end

    it 'renders a non-vegetarian template' do
      get '/posts/non_vegetarian'
      expect(response).to render_template(:non_vegetarian)
    end

    it 'renders a vegan template' do
      get '/posts/vegan'
      expect(response).to render_template(:vegan)
    end
  end

  context 'non-signed in user' do
    it_behaves_like 'render_templates'
  end

  context 'signed in user' do
    let(:user) { create(:user) }
    before(:each) { login_as user }

    it_behaves_like 'render_templates'
  end

end