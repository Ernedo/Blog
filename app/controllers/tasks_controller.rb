class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
   @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
     @ruby = Task.where(id: params[:id])
     @yearss = @ruby.first.created_at.year.to_s
     @monthss = @ruby.first.created_at.month.to_s
     @number_id = @ruby.first.id.to_s
     @iddd = @ruby.first.idd
     @both_odd = (@yearss.split(//) + @monthss.split(//) + @number_id.split(//)).map(&:to_i).select(&:odd?).sum
     @both_even = (@yearss.split(//) + @monthss.split(//) + @number_id.split(//)).map(&:to_i).select(&:even?).sum
     @iddd = (@both_even - @both_odd).abs
     if @iddd  > 9
       (@iddd %= 10).to_s
     else
       @iddd.to_s
     end
     @pardon = (@yearss + @monthss + @number_id + @iddd.to_s)
     @rails = @ruby.first.lname.to_s.slice(0,2) + @ruby.first.name.to_s.slice(0,2) + @pardon
  end
  def edit
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
      
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :lname, :idd)
    end
end
