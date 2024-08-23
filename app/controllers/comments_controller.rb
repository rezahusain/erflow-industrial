# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_patient_request
  before_action :set_comment, only: %i[show edit update destroy]
  before_action { authorize @comment || Comment }

  # GET /patient_requests/:patient_request_id/comments
  def index
    @comments = @patient_request.comments
  end

  # GET /patient_requests/:patient_request_id/comments/:id
  def show; end
 
  # GET /patient_requests/:patient_request_id/comments/new
  def new
    @comment = @patient_request.comments.new
  end

  # GET /patient_requests/:patient_request_id/comments/:id/edit
  def edit; end

  # POST /patient_requests/:patient_request_id/comments
  def create
    @comment = @patient_request.comments.new(comment_params)
    @comment.form.user = current_user # Ensure the comment is associated with the current user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@patient_request, @comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@patient_request, @comment] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_requests/:patient_request_id/comments/:id
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@patient_request, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@patient_request, @comment] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_requests/:patient_request_id/comments/:id
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html do
        redirect_to patient_request_comments_url(@patient_request), notice: 'Comment was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = @patient_request.comments.find(params[:id])
  end

  def set_patient_request
    @patient_request = PatientRequest.find(params[:patient_request_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
