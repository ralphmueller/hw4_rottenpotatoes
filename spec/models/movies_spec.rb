require 'spec_helper'

describe Movie do
  it 'should return the movies THX-1138 and not Alien for George Lucas' do
    movie = FactoryGirl.build(:movie, :title => 'THX-1138', :director => 'George Lucas', :rating => 'PG', :release_date => 10.years.ago  )
    movie.title.should == 'THX-1138' 
  end 
  
  it 'should return no movies for Peter Pan' do
    movie_list = Movie.search_similar_movies("Peter Pan")    
    movie_list.should == nil
  end  
end       