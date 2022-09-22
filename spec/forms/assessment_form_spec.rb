require 'rails_helper'
RSpec.describe AssessmentForm, type: :model do # rubocop:disable Metrics/BlockLength
  describe 'バリデーションのチェック' do # rubocop:disable Metrics/BlockLength
    context '最大文字数を超える字数を入力した場合' do # rubocop:disable Metrics/BlockLength
      let(:assessment_form) do
        FactoryBot.build(:assessment_form,
                         user_email: "#{'a' * 100}@example.com",
                         last_name: ('苗' * 16).to_s,
                         first_name: ('名' * 16).to_s,
                         last_name_kana: ('み' * 32).to_s,
                         first_name_kana: ('な' * 32).to_s)
      end
      before do
        assessment_form.valid?
      end

      it 'メールアドレスの項目で最大字数超過によるバリデーションエラーが発生する' do
        expect(assessment_form.errors[:user_email]).to include('は100文字以内で入力してください')
      end

      it '苗字の項目で最大字数超過による最大字数超過によるバリデーションエラーが発生する' do
        expect(assessment_form.errors[:last_name]).to include('は15文字以内で入力してください')
      end

      it '名前の項目で最大字数超過によるバリデーションエラーが発生する' do
        expect(assessment_form.errors[:first_name]).to include('は15文字以内で入力してください')
      end

      it '苗字のふりがなの項目で最大字数超過によるバリデーションエラーが発生する' do
        expect(assessment_form.errors[:last_name_kana]).to include('は31文字以内で入力してください')
      end

      it '名前のふりがなの項目で最大字数超過によるバリデーションエラーが発生する' do
        expect(assessment_form.errors[:first_name_kana]).to include('は31文字以内で入力してください')
      end
    end

    context '必須入力項目に入力がない場合' do # rubocop:disable Metrics/BlockLength
      before do
        @assessment_form = AssessmentForm.new
        @assessment_form.valid?
      end

      it '市区町村の項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:property_city]).to include('を入力してください')
      end

      it '市区町村以降の住所の項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:property_address]).to include('を入力してください')
      end

      it '物件種別の項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:property_type]).to include('を入力してください')
      end

      # NOTE: 査定フォーム周り変更のため一旦コメントアウト
      # TODO: 後に削除
      # it '間取りの項目で未入力によるバリデーションエラーが発生する' do
      #   expect(@assessment_form.errors[:property_room_plan]).to include('を入力してください')
      # end

      # it '築年数の項目で未入力によるバリデーションエラーが発生する' do
      #   expect(@assessment_form.errors[:property_constructed_year]).to include('を入力してください')
      # end

      it 'メールアドレスの項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:user_email]).to include('は@や.を含む、有効なものを入力してください')
      end

      it '苗字の項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:last_name]).to include('を入力してください')
      end

      it '名前の項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:first_name]).to include('を入力してください')
      end

      it '苗字のふりがなの項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:last_name_kana]).to include('を入力してください')
      end

      it '名前のふりがなの項目で未入力によるバリデーションエラーが発生する' do
        expect(@assessment_form.errors[:first_name_kana]).to include('を入力してください')
      end
    end

    context '正規表現に反する入力が行われた場合' do # rubocop:disable Metrics/BlockLength
      context '電話番号に0から始まらない入力がされた場合' do
        let(:assessment_form) { FactoryBot.build(:assessment_form, user_tel: '19028481645') }
        it '電話番号の項目でバリデーションエラーが発生する' do
          assessment_form.valid?
          expect(assessment_form.errors[:user_tel]).to include('は0から始まる10-11文字で入力してください')
        end
      end

      context '電話番号の字数が10より短い場合' do
        let(:assessment_form) { FactoryBot.build(:assessment_form, user_tel: '19028481645') }
        it '電話番号の項目でバリデーションエラーが発生する' do
          assessment_form.valid?
          expect(assessment_form.errors[:user_tel]).to include('は0から始まる10-11文字で入力してください')
        end
      end

      context '電話番号の字数が11より長い場合' do
        let(:assessment_form) { FactoryBot.build(:assessment_form, user_tel: '19028481645') }
        it '電話番号の項目でバリデーションエラーが発生する' do
          assessment_form.valid?
          expect(assessment_form.errors[:user_tel]).to include('は0から始まる10-11文字で入力してください')
        end
      end

      context 'メールアドレスが@を含まない場合' do
        let(:assessment_form) { FactoryBot.build(:assessment_form, user_email: 'dase,example.com') }
        it 'メールアドレスの項目でバリデーションエラーが発生する' do
          assessment_form.valid?
          expect(assessment_form.errors[:user_email]).to include('は@や.を含む、有効なものを入力してください')
        end
      end

      context 'メールアドレスが.を含まない場合' do
        let(:assessment_form) { FactoryBot.build(:assessment_form, user_email: 'dase,example@com') }
        it 'メールアドレスの項目でバリデーションエラーが発生する' do
          assessment_form.valid?
          expect(assessment_form.errors[:user_email]).to include('は@や.を含む、有効なものを入力してください')
        end
      end
    end

    context '必要な項目が規定の形式で全て入力された場合' do
      let(:assessment_form) { FactoryBot.build(:assessment_form) }
      it 'バリデーションエラーが起きない' do
        assessment_form.valid?
        expect(assessment_form).to be_valid
      end
    end
  end
end
