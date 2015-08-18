class Admin::QuestionTypesController < Admin::BaseController
  respond_to :html

  def index
    @question_types = QuestionType.all
  end

  def new
    @question_type = QuestionType.new
  end

  def create
    @question_type = QuestionType.new(question_type_params)
    if @question_type.save
      respond_with @question_type, location: ->{ admin_question_types_path }, notice: "成功新增主指標"
    else
      render :new, alert: "資料錯誤"
    end
  end

  private
    def question_type_params
      params[:question_type].permit(:name)
    end
end
