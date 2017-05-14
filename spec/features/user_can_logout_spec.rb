require 'rails_helper'

describe 'existing user signs in' do
  context 'clicks login/ sign up' do
    it 'fills in proper information and logs in' do
      create_user email: 'test@test.com', password: 'T3stP@ssword'

      visit root_path
      click_on 'Login/ Sign Up'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 'T3stP@ssword'
      click_on 'Log In'

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('test@test.com')
      expect(page).to have_content('Log Out')
    end

    it 'fills out incorrect password and gets error' do
      create_user email: 'test@test.com', password: 'T3stP@ssword'
      visit root_path
      click_on 'Login/ Sign Up'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 't3stpasssword'
      click_on 'Log In'

      expect(page).to have_content('Invalid Email or password.')

      fill_in 'user_email', with: 'test@tast.com'
      fill_in 'user_password', with: 'T3stP@sssword'
      click_on 'Log In'

      expect(page).to have_content('Invalid Email or password.')
    end
  end

  context 'clicks logout' do
    it 'is successfully logged out' do
      create_user email: 'test@test.com', password: 'T3stP@ssword'

      visit root_path
      click_on 'Login/ Sign Up'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 'T3stP@ssword'
      click_on 'Log In'
      click_on 'Log Out'

      expect(page).to have_content('Login/ Sign Up')
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
