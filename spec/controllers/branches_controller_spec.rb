RSpec.describe 'Branches', type: :request do
  describe 'GET /branches/:id' do
    let(:branch) { FactoryBot.create(:branch) }

    it 'branchがある場合200が返る' do
      get branch_path branch
      expect(response).to have_http_status(:success)
    end
  end
end
