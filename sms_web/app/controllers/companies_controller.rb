class CompaniesController < ApplicationController

  def index
    scoped = Company.scoped
    scoped = case params[:category]
             when "component"
              scoped.component_part
             when "goods"
              scoped.goods_part
             when "has_models"
              company_ids = RacingModel.included_company.select("company_id").map(&:company_id).uniq
              scoped.where("id IN (?)", company_ids)
             else
              scoped.car_part
             end
    @companies = scoped.published.select("id, name, booth_code")

    respond_to do |format|
      format.json { render :json => @companies.to_json }
    end
  end

  def show
    raw_id = params[:id]
    @company = if raw_id.to_i > 0
                Company.find(params[:id])
               else
                Company.find_by_booth_code(params[:id])
               end

    unless @company.nil?
      respond_to do |format|
        format.json { render :json => @company.to_json }
      end
    else
      respond_to do |format|
        format.json { render :json => {}, :status => 404 }
      end
    end
  end

end
