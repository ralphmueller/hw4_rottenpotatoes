class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.search_similar_movies(id)
    @movies = Movie.find_all_by_director(Movie.find(id).director)
  end
end
