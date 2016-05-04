class Admin::ApplicationController < ApplicationController
  layout 'admin_application'
  before_filter :require_admin

  

end
