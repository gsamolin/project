# frozen_string_literal: true

# asdadsa
class LibraryController < ApplicationController
  def showall
    @mysubs = Subscription.where(user_id: current_user.id)
    @mypubs = []
    @mysubs.each do |mysub|
      @mypubs.push(Membership.where(publisher_id: mysub.publisher_id))
    end
    @mybooks = []
    @mypubs.each do |mypub|
      mypub.each do |mp|
        @mybooks.push(Book.where(user_id: mp.user_id))
      end
    end
  end

  def mybooks
    @cur_id = current_user.id
    @mybooks = Book.where(user_id: current_user.id)
  end
end
