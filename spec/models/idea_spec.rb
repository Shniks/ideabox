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
        Idea.create(title: 'Title1', description: 'Great Idea')
        idea = Idea.create(title: 'Title2', description: 'Great Idea 2')
        expect(idea).to be_valid
      end
    end

    context 'Valid attributes' do
      it 'Is valid with a title and a description' do
        idea = Idea.new(title: 'Idea 1 Idea', description: 'Idea 1 Description')
        expect(idea).to be_valid
      end
    end
  end
end
