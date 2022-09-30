# frozen_string_literal: true

return unless Rails.env.development?

User.create!(
  [
    {
      email: 'customer@montecinema.com',
      password: 'rubycamp2022',
      role: 'customer'
    },
    {
      email: 'manager@montecinema.com',
      password: 'rubycamp2022',
      role: 'manager'
    }
  ]
)

Rails.logger.info { "Successfully created #{User.count} Users" }
