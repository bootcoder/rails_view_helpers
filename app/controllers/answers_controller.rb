class AnswersController < ApplicationController

  def new
    @question = Question.where(id: params[:question_id]).first
    @answer = Answer.new
  end

end
