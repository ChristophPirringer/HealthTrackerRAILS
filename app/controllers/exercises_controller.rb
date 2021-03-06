class ExercisesController < ApplicationController
  def index
    @exercises = Food.all
    
  end

  def new
    @user = User.find(params[:user_id])
    @exercise = Exercise.new
  end

  def create
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new(exercise_params)
    if @exercise.save
      respond_to do |format|
        format.html { redirect_to foods_path }
        format.js
      end
    else
      render :new
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :calories, :user_id)
  end
end
