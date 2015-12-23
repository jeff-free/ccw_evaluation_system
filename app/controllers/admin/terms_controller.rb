class Admin::TermsController < Admin::BaseController
  before_action :set_term, only: :show

  def index
    @terms = Term.includes(:evaluations).all
  end

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to [:admin, @term]
    else
      render :new
    end
  end

  private

    def set_term
      @term = Term.find(params[:id])
    end

    def term_params
      params[:term].permit(:term_number)
    end
end
