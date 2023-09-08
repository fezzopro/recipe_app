require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:user, [
             User.create!(
               name: 'User 1'
             )
           ])
    assign(:recipe, [
             Recipe.create!(
               name: 'Recipe 1',
               description: 'How to test Ruby on Rails applications.',
               preparation_time: nil,
               cooking_time: nil,
               public: false,
               user: User.create!(name: 'User 1')
             )
           ])
  end

  it 'renders a list of recipes' do
    render

    expect(rendered).to have_selector('tr>td', text: 'Rails Testing')
    expect(rendered).to have_selector('tr>td', text: 'Rails Patterns')

    expect(rendered).to have_selector('tr>td', text: 'How to test Ruby on Rails applications')
    expect(rendered).to have_selector('tr>td', text: 'A book about patterns and anti-patterns in Ruby on Rails.')

    expect(rendered).to have_selector('tr>td', text: 'rails-patterns.com/download')

    expect(rendered).to have_selector('tr>td', text: 'published')
  end
end
