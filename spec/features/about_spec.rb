feature 'About' do
  scenario 'user visits cupcakes area' do
    visit '/'

    click_link 'Browse Our Cupcakes'

    expect(page).to have_current_path('/pricing')
  end

  scenario 'user visits the store location' do
    visit '/'

    click_link 'View Our Locations'

    expect(page).to have_current_path('/locations')
  end
end
