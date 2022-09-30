# frozen_string_literal: true

movies = Movie.all

Hall.all.each do |hall|
  (9..23).step(rand(3..6)).each do |n|
    Show.create(
      hall:,
      movie: movies.sample,
      start_time: Time.zone.now.midnight + n.hours + (5 * rand(1..6)).minutes
    )
  end
end

Rails.logger.info { "Successfully created #{Show.count} Shows" }
