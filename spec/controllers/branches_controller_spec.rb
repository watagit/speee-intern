RSpec.describe 'Branches', type: :request do
  let(:branch) { Branch.first }

  describe 'GET /branches/:id' do
    let(:branch) { FactoryBot.create(:branch) }

    it 'branchがある場合200が返る' do
      get branch_path branch
      expect(response).to have_http_status(:success)
    end

    it 'branchがない場合500が返る' do
      # TODO: controller側で404を返すようになってから実装する
    end
  end
end
