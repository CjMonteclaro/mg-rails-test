class BasketCaseController < ApplicationController
  before_action :set_fruits
  before_action :set_items

  def index
    sort_by = params[:sort_by] || 'amount'
    order = params[:order] || 'asc'

    @list_items =
      case sort_by
      when 'name'
        @list_items.sort_by { |fruit, amount| fruit }
      else
        @list_items.sort_by { |fruit, amount| amount }
      end

    @list_items = @list_items.reverse if order == 'desc'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2,
        guavas: 4
      }
    end

    def set_items
      @list_items = @fruits
    end
end
