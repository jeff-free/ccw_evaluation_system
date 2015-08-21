class Admin::TermsController < Admin::BaseController
  before_action :set_term, only: [:show]
  respond_to :html
  def index
    @terms = Term.includes(:evaluations).all
  end

  def show
    @evaluations = @term.evaluations
    # @congressman = @term.congrassman
  end

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      respond_with(:admin, @term)
    else
      render :new
    end
  end

  private

    def set_term
      @term = Term.find_by(term_number: params[:id])
    end

    def term_params
      params[:term].permit(:term_number)
    end
end
