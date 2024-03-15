require 'rails_helper'

RSpec.describe DayTask, type: :model do
  before do
    @day_task = FactoryBot.build(:day_task)
  end

  describe 'DayTask新規登録機能' do
    context '新規登録できるとき' do
      it '必要な情報がすべて存在している場合は登録できる' do
        expect(@day_task).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'action_dayが空では登録できない' do
        @day_task.action_day = ''
        @day_task.valid?
        expect(@day_task.errors.full_messages).to include("Action day can't be blank")
      end
      it 'task_idが紐づいていなければ、登録できない' do
        @day_task.task = nil
        @day_task.valid?
        expect(@day_task.errors.full_messages).to include("Task must exist")
      end
      it 'user_idが紐づいていなければ、登録できない' do
        @day_task.user = nil
        @day_task.valid?
        expect(@day_task.errors.full_messages).to include("User must exist")
      end
      it 'family_idが紐づいていなければ、登録できない' do
        @day_task.family = nil
        @day_task.valid?
        expect(@day_task.errors.full_messages).to include("Family must exist")
      end
    end
  end
end
