require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'Schedule新規登録機能' do
    context '新規登録できるとき' do
      it '必要な情報がすべて存在している場合は登録できる' do
        expect(@schedule).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'eventが空では登録できない' do
        @schedule.event = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Event can't be blank")
      end
      it 'start_timeが空では登録できない' do
        @schedule.start_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start time can't be blank")
      end
      it 'end_timeが空では登録できない' do
        @schedule.end_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("End time can't be blank")
      end
      it 'end_timeがstart_time以前では登録できない' do
        @schedule.end_time = Faker::Time.between(from: @schedule.start_time - 5, to: @schedule.start_time)
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("End time は開始時刻以降で設定してください")
      end
      it 'user_idが紐づいていなければ、登録できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('User must exist')
      end
      it 'family_idが紐づいていなければ、登録できない' do
        @schedule.family = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('Family must exist')
      end
    end
  end
end
