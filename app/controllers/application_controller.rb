class ApplicationController < ActionController::Base

  include CartsHelper
  include GameSheetsHelper
  include CheckUser
end
