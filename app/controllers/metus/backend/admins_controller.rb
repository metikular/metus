module Metus
  module Backend
    class AdminsController < BackendController
      def index
        @admins = Admin.all
      end

      def new
        @admin = Admin.new
      end

      def create
        password = SecureRandom.hex

        if Admin.create(admin_params.merge(password: password))
          redirect_to backend_admins_path
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        @admin = Admin.find(params[:id])
      end

      def update
        @admin = Admin.find(params[:id])

        if @admin.update(admin_params)
          redirect_to backend_admins_path
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @admin = Admin.find(params[:id])
        @admin.destroy!

        redirect_to backend_admins_path
      end

      private

      def admin_params
        params.require(:admin).permit(:email)
      end
    end
  end
end
