module ModelCreation
  def create_user(**options)
    user = User.create(email: options[:email] || 'test@test.com',
                       password: options[:password] || 'T3stP@ssword')
    user.confirm
    user
  end
end
