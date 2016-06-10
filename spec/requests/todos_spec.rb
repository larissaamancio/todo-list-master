require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "works! (now write some real specs)" do
      get todos_path
      expect(response).to have_http_status(302)
    end
  end
end
