require 'rails_helper'

RSpec.describe Column, type: :model do
    before do
      @column = FactoryBot.build(:column)
    end
    
    describe 'コラム登録' do
      context 'コラムを新規登録できるとき' do
        it 'title,newsが存在すれば登録できる' do
          expect(@column).to be_valid
        end

        it 'column_imageが空でも登録できる' do
          @column.column_image = ''
          expect(@column).to be_valid
        end
      end
  
      context 'コラムを新規登録ができないとき' do
        it 'titleが空だと登録できない' do
          @column.title = ''
          @column.valid?
          expect(@column.errors.full_messages).to include("Title can't be blank")
        end

        it 'newsが空だと登録できない' do
          @column.news = ''
          @column.valid?
          expect(@column.errors.full_messages).to include("News can't be blank")
        end
      end
    end
end