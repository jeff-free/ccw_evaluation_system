class Volunteer::InquiriesController < Volunteer::BaseController
  def show
    @inquiry = Inquiry.find(params[:id])
    @survey = current_user.surveys.build
    @questions = @evaluation.questions.all
    @survey.answers.build
  end
end
