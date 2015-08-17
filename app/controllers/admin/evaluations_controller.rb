class Admin::EvaluationsController < Admin::BaseController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  def index
    @evaluations = Evaluation.all
  end

  def show
    
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to admin_evaluations_path, notice: "成功新增會期評鑑" }
      else
        format.html { render :new, alert: "資料錯誤" }
      end
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params[:evaluation].permit!
    end
end
