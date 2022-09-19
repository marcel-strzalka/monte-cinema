# frozen_string_literal: true

Movie.destroy_all

Movie.create!([{
                title: 'Avatar',
                length_in_minutes: 162
              },
               {
                 title: 'Titanic',
                 length_in_minutes: 194
               },
               {
                 title: 'Gladiator',
                 length_in_minutes: 155
               }])

Rails.logger.debug { "Successfully created #{Movie.count} Movies" }
