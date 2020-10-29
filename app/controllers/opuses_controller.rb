class OpusesController < ApplicationController
  def index
  end
  def new
    @opus = Opus.new
  end
end
