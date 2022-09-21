# frozen_string_literal: true

Show.destroy_all

movies = Movie.all

Hall.all.each do |hall|
  (9..23).step(rand(3..6)).each do |n|
    Show.create({
                  hall:,
                  movie: movies.sample,
                  start_time: Time.zone.now.midnight + n.hour + (5 * rand(1..6)).minute
                })
  end
end

Rails.logger.debug { "Successfully created #{Show.count} Shows" }
