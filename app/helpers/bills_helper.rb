module BillsHelper

  def user_voted?
    if user_signed_in?
      if UserPoll.find_by_user_id_and_bill_id(current_user.id, @bill.id)
        return true
      else
        return false
      end
    else
      return true
    end
  end

end
