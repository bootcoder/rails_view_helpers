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
    @answers = @question.answers
  end

  def edit
    @question = Question.where(id: params[:id]).first
  end

  def update
    @question = Question.where(id: params[:id]).first
    @question.update_attributes(question_params)
    redirect_to root_path
  end

  def destroy
    @question = Question.where(id: params[:id]).first
    @question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

end
