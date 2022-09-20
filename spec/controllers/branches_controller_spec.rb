RSpec.describe 'Branches', type: :request do
  let(:branch) { Branch.first }

  describe 'GET /branches/:id' do
    it 'branchがある場合200が返る' do; end
    it 'branchがない場合500が返る' do; end
  end
end
