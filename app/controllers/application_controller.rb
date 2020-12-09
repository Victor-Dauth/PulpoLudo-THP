class ApplicationController < ActionController::Base
  include CartsHelper
  include OrdersHelper
  include GameSheetsHelper
  include CheckUser
end
