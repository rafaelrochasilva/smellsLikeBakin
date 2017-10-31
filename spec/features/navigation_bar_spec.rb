feature 'Navigation bar' do
  scenario 'user visits the cupcakes and prices' do
    visit '/'

    click_link 'Cupcakes & Prices'

    expect(page).to have_current_path('/pricing')
  end

  scenario 'user visit the locations' do
    visit '/'

    click_link 'Locations'

    expect(page).to have_current_path('/locations')
  end

  scenario 'user visit contact page' do
    visit '/'

    click_link 'Contact Us'

    expect(page).to have_current_path('/contact')
  end

  scenario 'user visit about page' do
    visit '/locations'

    click_link 'About'

    expect(page).to have_current_path('/')
  end
end
