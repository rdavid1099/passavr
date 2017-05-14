require 'rails_helper'

describe 'user clicks sign up' do
  context 'fills out all proper information' do
    it 'sends out confirmation email' do
      visit root_path
      click_on 'Login/ Sign Up'
      click_on 'Create New Account'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: 't3stP@ssword'
      fill_in 'user_password_confirmation', with: 't3stP@ssword'
      click_on 'Create Account'
      byebug

      expect(ActionMailer::Base.deliveries).to eq(1)
      expect(current_path).to eq(root_path)
    end
  end
end
