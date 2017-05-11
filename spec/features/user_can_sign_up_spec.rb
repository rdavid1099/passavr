require 'rails_helper'

describe 'user clicks sign up' do
  context 'fills out all proper information' do
    it 'should have confirmation email sent out' do
      visit root_path
      click_on 'Login/ Sign Up'
      click_on 'Create New Account'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 't3stP@ssword'
      fill_in 'user_password_confirmation', with: 't3stP@ssword'
      click_on
    end

    xit 'should confirm and have proper account' do

    end
  end
end
