require 'rails_helper'

describe 'user clicks sign up' do
  before { ActionMailer::Base.deliveries = [] }

  context 'fills out all proper information' do
    it 'sends out confirmation email' do
      visit root_path
      click_on 'Login/ Sign Up'
      click_on 'Create New Account'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 't3stP@ssword'
      fill_in 'user_password_confirmation', with: 't3stP@ssword'
      click_on 'Create Account'

      expect(ActionMailer::Base.deliveries.count).to eq(1)
      expect(current_path).to eq(root_path)
    end
  end

  context 'fills out improper information' do
    it 'displays error if password is too short' do
      visit root_path
      click_on 'Login/ Sign Up'
      click_on 'Create New Account'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 'test'
      fill_in 'user_password_confirmation', with: 'tst'
      click_on 'Create Account'

      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(page).to have_content('Password is too short (minimum is 12 characters)')
      expect(page).to have_content('Password must include at least one lowercase letter, one uppercase letter, and one digit')
    end
  end
end
