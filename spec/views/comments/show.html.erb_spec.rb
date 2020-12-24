require 'rails_helper'

RSpec.describe 'comments/show', type: :view do
  before do
    @comment = assign(:comment, Comment.create!(
                                  username: 'Username',
                                  body: 'MyText',
                                  post: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end