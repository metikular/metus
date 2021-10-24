module Metus
  class PublicController < ::ApplicationController
    skip_authorization_check
  end
end
