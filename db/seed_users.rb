# frozen_string_literal: true

return unless Rails.env.development?

User.destroy_all

User.create!([{
               email: 'customer@monte-cinema.com',
               password: 'rubycamp2022',
               role: 'customer'
             }, {
               email: 'manager@monte-cinema.com',
               password: 'rubycamp2022',
               role: 'manager'
             }])

Rails.logger.debug { "Successfully created #{User.count} Users" }
