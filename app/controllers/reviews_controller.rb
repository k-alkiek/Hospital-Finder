class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reviews/1/edit
  def edit
  end
  
  def create
    @hospital = Hospital.find(params[:hospital_id])
    @review = @hospital.reviews.create(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to hospital_path(@hospital)
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @hospital = Hospital.find(params[:hospital_id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to hospital_path(@hospital), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :rating, :content, :user_id, :hospital_id)
      #params.fetch(:review, {})
    end
end
