# frozen_string_literal: true

Movie.create!(
  [
    {
      title: 'Avatar',
      length_in_minutes: 162
    },
    {
      title: 'Gladiator',
      length_in_minutes: 155
    },
    {
      title: 'Iron Man',
      length_in_minutes: 126
    },
    {
      title: 'Titanic',
      length_in_minutes: 194
    },
    {
      title: 'Zombieland',
      length_in_minutes: 88
    }
  ]
)

Rails.logger.info { "Successfully created #{Movie.count} Movies" }
