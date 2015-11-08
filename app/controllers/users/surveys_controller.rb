class Users::SurveysController < Users::BaseController
  before_action :set_evaluation
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @questions = @evaluation.questions.all
    @answer = Answer.new
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = current_user.surveys.build(survey_params)

    respond_to do |format|
      if @survey.save
        @survey.update(evaluation: @evaluation)
        format.html { redirect_to root_path, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_evaluation
      @evaluation = Evaluation.active.includes(questions: :question_type).first
    end

    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params[:survey].permit(:user_id, :evaluation_id, answers_attributes: [:question_id, :point]) rescue nil
    end
end
