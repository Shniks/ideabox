require 'rails_helper'

describe Idea do
  describe 'Validations' do
    context 'Invalid attributes' do
      it 'Is invalid without a title' do
        idea = Idea.new
        expect(idea).to be_invalid
      end

      it 'Is invalid with only a title' do
        idea = Idea.new(title: 'Invalid Idea')
        expect(idea).to be_invalid
      end

      it 'Is invalid with only a description' do
        idea = Idea.new(description: 'Invalid Idea')
        expect(idea).to be_invalid
      end

      it 'Has a unique title' do
        Idea.create(title: 'Title1', description: 'Great Idea')
        idea = Idea.create(title: 'Title1', description: 'Great Idea')
        expect(idea).to be_invalid
      end

      it 'Has a unique description' do
        Idea.create(title: 'Title1', description: 'Great Idea')
        idea = Idea.create(title: 'Title2', description: 'Great Idea')
        expect(idea).to be_invalid
      end

      it 'Has a unique title and description' do
        category_1 = Category.create!(name: 'Photography')
        Idea.create(title: 'Title1', description: 'Great Idea', category: category_1)
        idea = Idea.create(title: 'Title2', description: 'Great Idea 2', category: category_1)
        expect(idea).to be_valid
      end
    end

    context 'Valid attributes' do
      it 'Is valid with a title and a description' do
        category_1 = Category.create!(name: 'Photography')
        idea = Idea.new(title: 'Idea 1 Idea', description: 'Idea 1 Description',  category: category_1)
        expect(idea).to be_valid
      end
    end
  end

  describe 'Relationships' do
    scenario { should belong_to(:category) }
    scenario { should have_many(:images) }
    scenario { should have_many(:images).through(:imaging) }
  end
end
