require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before do
    @ingredient = FactoryBot.build(:ingredient)
  end
      
  describe '食材登録' do
    context '食材を新規登録できるとき' do
      it 'name,nutrient_id,detail,imageが存在すれば登録できる' do
        expect(@ingredient).to be_valid
      end
    end
    
    context '食材を新規登録ができないとき' do
      it 'nameが空だと登録できない' do
        @ingredient.name = ''
        @ingredient.valid?
        expect(@ingredient.errors.full_messages).to include("Name can't be blank")
      end
  
      it 'nutrient_idが空だと登録できない' do
        @ingredient.nutrient_id= ''
        @ingredient.valid?
        expect(@ingredient.errors.full_messages).to include("Nutrient can't be blank")
      end

      it 'nutrient_idが1~5以外だと登録できない' do
        @ingredient.nutrient_id = 6
        @ingredient.valid?
        expect(@ingredient.errors.full_messages).to include("Nutrient must be in 1..5")
      end

      it 'detailが空だと登録できない' do
        @ingredient.detail= ''
        @ingredient.valid?
        expect(@ingredient.errors.full_messages).to include("Detail can't be blank")
      end

      it 'imageが空だと登録できない' do
        @ingredient.image= ''
        @ingredient.valid?
        expect(@ingredient.errors.full_messages).to include("Image can't be blank")

      end
    end
  end
end

