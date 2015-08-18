class Admin::QuestionTypesController < Admin::BaseController
  before_action :set_question_type, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @question_types = QuestionType.all
  end

  def show
    
  end

  def new
    @question_type = QuestionType.new
  end

  def create
    @question_type = QuestionType.new(question_type_params)
    if @question_type.save
      respond_with(@question_type, location: admin_question_types_path, notice: "成功新增主指標")
    else
      render :new, alert: "資料錯誤"
    end
  end

  def edit
    @question = @question_type.questions.build
  end

  def update
    if @question_type.update(question_type_params)
      respond_with(@question_type, location: admin_question_types_path)
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

    def set_question_type
      @question_type = QuestionType.find(params[:id])
    end
    def question_type_params
      params[:question_type].permit(:name, questions_attributes: [:id, :name, :evaluation_id])
    end
end
