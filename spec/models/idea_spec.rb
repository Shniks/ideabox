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
        user = User.create!(username: 'Nikhil', password: 'password')
        category_1 = Category.create!(name: 'Photography')
        user.ideas.create(title: 'Title1', description: 'Great Idea', category: category_1)
        idea = user.ideas.create(title: 'Title2', description: 'Great Idea 2', category: category_1)
        expect(idea).to be_valid
      end
    end

    context 'Valid attributes' do
      it 'Is valid with a title and a description' do
        user = User.create!(username: 'Nikhil', password: 'password')
        category_1 = Category.create!(name: 'Photography')
        idea = user.ideas.new(title: 'Idea 1 Idea', description: 'Idea 1 Description', category: category_1)
        expect(idea).to be_valid
      end
    end
  end

  describe 'Relationships' do
    scenario { should belong_to(:category) }
    scenario { should have_many(:hyperlinks) }
    scenario { should have_many(:images).through(:hyperlinks) }
  end

  describe 'Instance Methods' do
    describe 'Image' do
      scenario 'It captures an image for an idea' do
        user = User.create!(username: 'Nikhil', password: 'password')
        category_1 = Category.create!(name: 'Photography')
        idea_1 = user.ideas.create!(title: 'Idea 1 Idea', description: 'Idea 1 Description', category: category_1)
        idea_2 = user.ideas.create!(title: 'Idea 2 Idea', description: 'Idea 2 Description', category: category_1)
        idea_1.images.create!(url: "https://2.img-dpreview.com/files/p/articles/1519251701/DPReview_Nikhil_Shahi_10.jpeg")

        expect(idea_1.images.first.url).to eq("https://2.img-dpreview.com/files/p/articles/1519251701/DPReview_Nikhil_Shahi_10.jpeg")
      end
    end
  end
end
