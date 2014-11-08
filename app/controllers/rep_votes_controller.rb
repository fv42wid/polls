class RepVotesController < ApplicationController
  before_action :set_rep_vote, only: [:show, :edit, :update, :destroy]

  # GET /rep_votes
  # GET /rep_votes.json
  def index
    @rep_votes = RepVote.all
  end

  # GET /rep_votes/1
  # GET /rep_votes/1.json
  def show
  end

  # GET /rep_votes/new
  def new
    @rep_vote = RepVote.new
    @bill = Bill.find(params[:bill_id])
  end

  # GET /rep_votes/1/edit
  def edit
  end

  # POST /rep_votes
  # POST /rep_votes.json
  def create
    @rep_vote = RepVote.new(rep_vote_params)
    @bill = Bill.find(params[:bill_id])

    respond_to do |format|
      if @rep_vote.save
        format.html { redirect_to @bill, notice: 'Rep vote was successfully created.' }
        format.json { render :show, status: :created, location: @rep_vote }
      else
        format.html { render :new }
        format.json { render json: @rep_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rep_votes/1
  # PATCH/PUT /rep_votes/1.json
  def update
    respond_to do |format|
      if @rep_vote.update(rep_vote_params)
        format.html { redirect_to @rep_vote, notice: 'Rep vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @rep_vote }
      else
        format.html { render :edit }
        format.json { render json: @rep_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rep_votes/1
  # DELETE /rep_votes/1.json
  def destroy
    @rep_vote.destroy
    respond_to do |format|
      format.html { redirect_to rep_votes_url, notice: 'Rep vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rep_vote
      @rep_vote = RepVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rep_vote_params
      params.require(:rep_vote).permit(:rep_id, :bill_id, :vote)
    end
end
