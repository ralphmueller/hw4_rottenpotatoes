require 'spec_helper'

describe MoviesController do
  describe 'Search Similar Movies' do
    before :each do
      @fake_results = [mock('Test1'), mock('Test2')]
    end
    it 'should call the model method that performs search_similar_movies with "Ridley Scott"' do
      Movie.stub(:find).and_return ("1")
      Movie.should_receive(:search_similar_movies).with("1").and_return(@fake_results)
      post :search_similar_movies, {:id => "1"}
    end
    describe'after valid search' do
      before :each do
        Movie.stub(:search_similar_movies).and_return(@fake_results)
        post :search_similar_movies, {:id => 1}        
      end
      it 'should select the Similar Movies template for rendering' do
        response.should render_template('search_similar_movies')
      end
      it 'should display the TMDb search results for similar movies to that template' do 
        assigns(:movies).should == @fake_results
      end
    end
  end
end 
 