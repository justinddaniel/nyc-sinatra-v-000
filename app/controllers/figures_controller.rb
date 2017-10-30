require 'pry'
class FiguresController < ApplicationController

  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    binding.pry
    titles_array = params["figure"]["title_ids"]
    titles_array.collect! {|a| a.to_i}
    figure_title = Title.find_by_id(titles_array[0])
    landmark_array = params["figure"]["landmark_ids"]
    landmark = Landmark.find_by(name: landmark_array)
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.titles << figure_title
    @figure.landmarks << landmark
    @figure.save
  end

end
