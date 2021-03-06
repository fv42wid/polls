class UserPollsController < ApplicationController
  before_action :set_user_poll, only: [:edit, :update, :destroy]

  # GET /user_polls
  # GET /user_polls.json
  def index
    @bill = Bill.find(params[:bill_id])
    @user_polls = UserPoll.where(:bill_id => @bill)
    @user_poll_yes = UserPoll.where(:bill_id => @bill, :user_vote => 'YES').count
    @user_poll_no = UserPoll.where(:bill_id => @bill, :user_vote => 'NO').count
    @user_poll_total = @user_poll_yes + @user_poll_no
    @user_yes_percent = @user_poll_yes.to_f / @user_poll_total
    @user_no_percent = @user_poll_no.to_f / @user_poll_total

    @districts = District.select('state, district_number').group('state, district_number').all

  end

  # GET /user_polls/1
  # GET /user_polls/1.json
  def show
    @state = params[:id][0,2]
    @district_number = params[:id][2..-1]

    @bill = Bill.find(params[:bill_id])
    @user_polls = UserPoll.where(:bill_id => @bill)
    @user_poll_yes = UserPoll.where(:bill_id => @bill, :user_vote => 'YES').count
    @user_poll_no = UserPoll.where(:bill_id => @bill, :user_vote => 'NO').count
    @user_poll_total = @user_poll_yes + @user_poll_no
    @user_yes_percent = @user_poll_yes.to_f / @user_poll_total
    @user_no_percent = @user_poll_no.to_f / @user_poll_total

    if user_signed_in?
      @view_district = District.find_by state: @state, district_number: @district_number.to_s
      #move this to the index view
      #@user_district = District.find_by_zip(current_user.zip.to_s)
      @all_zips_in_district = District.where(state: @view_district.state, district_number: @view_district.district_number)
      @zips = []
      @all_zips_in_district.each do |district|
        @zips << district.zip
      end

      @local_polls_yes = UserPoll.where(:bill_id => @bill, :user_zip => @zips, :user_vote => 'YES').count
      @local_polls_no = UserPoll.where(:bill_id => @bill, :user_zip => @zips, :user_vote => 'NO').count
      @local_poll_total = @local_polls_yes + @local_polls_no
      @local_yes_percent = @local_polls_yes.to_f / @local_poll_total
      @local_no_percent = @local_polls_no.to_f / @local_poll_total

      @user_state = @view_district.state

      @rep = Rep.find_by state: @view_district.state, district_number: @view_district.district_number
      @rep_vote = RepVote.find_by rep_id: @rep.id, bill_id: @bill.id

    end
  end

  # GET /user_polls/new
  def new
    @user_poll = UserPoll.new
  end

  # GET /user_polls/1/edit
  def edit
  end

  # POST /user_polls
  # POST /user_polls.json
  def create

    @bill = Bill.find(params[:bill_id])
    @user_poll = UserPoll.new(user_poll_params)
    @user_poll.user_id = current_user.id
    @user_poll.bill_id = params[:bill_id]
    @user_poll.user_zip = current_user.zip
    @user_poll.user_vote = params[:commit][5,10].upcase

    respond_to do |format|
      if @user_poll.save
        format.html { redirect_to @bill, notice: 'User poll was successfully created.' }
        format.json { render :show, status: :created, location: @user_poll }
      else
        format.html { render :new }
        format.json { render json: @user_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_polls/1
  # PATCH/PUT /user_polls/1.json
  def update
    respond_to do |format|
      if @user_poll.update(user_poll_params)
        format.html { redirect_to @user_poll, notice: 'User poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_poll }
      else
        format.html { render :edit }
        format.json { render json: @user_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_polls/1
  # DELETE /user_polls/1.json
  def destroy
    @user_poll.destroy
    respond_to do |format|
      format.html { redirect_to user_polls_url, notice: 'User poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_poll
      @user_poll = UserPoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_poll_params
      params[:user_poll]
    end
end
