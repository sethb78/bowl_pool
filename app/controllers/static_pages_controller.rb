class StaticPagesController < ApplicationController
  def home
    @user = current_user
  end

  def rules
  end

  def contact
  end
end
