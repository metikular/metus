module Metus
  class BackendController < ApplicationController
    before_action :authenticate_admin!
  end
end
