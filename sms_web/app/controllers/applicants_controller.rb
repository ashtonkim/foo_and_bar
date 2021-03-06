# encoding: utf-8
class ApplicantsController < ApplicationController

  before_filter :find_event

  def create
    #redirect_to root_path and return unless request.xhr?

    #@applicant = Applicant.new(params[:applicant])
    #@applicant.user_agent = request.env["HTTP_USER_AGENT"]
    #result = if @applicant.save
    #          { :status => "Success",
    #            :message => "응모완료 되었습니다." }
    #         else
    #          { :status => "Failed",
    #            :message => @applicant.errors.full_messages.first }
    #         end

    result = { :status => "이벤트 종료",
               :message => "이벤트가 23일자로 종료되었습니다." }

    render :json => result.to_json
  end


  protected

    def find_event
      @event = Event.find(params[:event_id])
    end

end
