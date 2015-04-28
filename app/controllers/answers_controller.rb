class AnswersController < ApplicationController

  def index
    @question = Question.where(id: params[:id]).first
    @answers = @question.answers
  end

  def new
    @question = Question.where(id: params[:question_id]).first
    @answer = Answer.new
  end

  def create
    @question = Question.where(id: params[:question_id]).first
    @answer = @question.answers.create(answer_params)
    if @answer.save
      redirect_to root_path
    else
      render new_question_answer_path
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end


end
