require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスクの新規登録機能' do
    context '新規登録ができる場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@task).to be_valid
      end
    end
    context '新規登録きない場合' do
      it 'contentが空では登録できない' do
        @task.content = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Content can't be blank")
      end
      it 'categoryが空では登録できない' do
        @task.category_id = 1
        @task.valid?
        expect(@task.errors.full_messages).to include('Category を選択してください')
      end
      it 'familyが紐づいていなければ登録できない' do
        @task.family = nil
        @task.valid?
        expect(@task.errors.full_messages).to include('Family must exist')
      end
    end
  end
end
