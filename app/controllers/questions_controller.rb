class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render new_question_path
    end
  end

  def show
    @question = Question.where(id: params[:id]).first
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

end
