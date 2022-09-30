# frozen_string_literal: true

Hall.create!(
  [
    {
      name: 'A1',
      capacity: 20
    },
    {
      name: 'B1',
      capacity: 50
    },
    {
      name: 'B2',
      capacity: 50
    },
    {
      name: 'B3',
      capacity: 50
    },
    {
      name: 'B4',
      capacity: 50
    },
    {
      name: 'C1',
      capacity: 100
    },
    {
      name: 'C2',
      capacity: 100
    },
    {
      name: 'C3',
      capacity: 100
    },
    {
      name: 'C4',
      capacity: 100
    },
    {
      name: 'D1',
      capacity: 200
    }
  ]
)

Rails.logger.info { "Successfully created #{Hall.count} Halls" }
