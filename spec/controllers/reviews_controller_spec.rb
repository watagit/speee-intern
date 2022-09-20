RSpec.describe 'Reviews', type: :request do
  describe 'GET /reviews/:id' do
    let(:review) { FactoryBot.create(:review) }

    it 'reviewがある場合は200が返る' do
      get review_path review
      expect(response).to have_http_status(:success)
    end
  end
end
