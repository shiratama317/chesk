require 'rails_helper'

RSpec.describe Family, type: :model do
  before do
    @family = FactoryBot.build(:family)
  end

  describe 'family新規登録機能' do
    context '新規登録できるとき' do
      it 'nameが存在すれば登録できる' do
        expect(@family).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @family.name = ''
        @family.valid?
        expect(@family.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが16文字以上では登録できない' do
        @family.name = 'aaaaaaaaaaaaaaaa'
        @family.valid?
        expect(@family.errors.full_messages).to include('Name is too long (maximum is 15 characters)')
      end
    end
  end
end
