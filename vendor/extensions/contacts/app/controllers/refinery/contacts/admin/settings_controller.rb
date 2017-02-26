module Refinery
  module Contacts
    module Admin
      class SettingsController < Refinery::AdminController

        before_action :find_setting, :only => [:edit, :update]
        after_action :save_subject_for_confirmation, :save_message_for_confirmation, :save_notification_recipients, :only => :update

        def edit
        end

        def update
            flash[:notice] = t('refinery.crudify.updated', :what => @setting.name.gsub("contact_", "").titleize)

            if request.xhr? or from_dialog?
              render :text => "<script type='text/javascript'>parent.window.location = '#{refinery.contacts_admin_contacts_path}';</script>"
            else
              redirect_back_or_default(refinery.contacts_admin_contacts_path)
            end
        end

      protected
        def find_setting
          setting = params[:id].gsub("contact_", "")

          Refinery::Contacts::Setting.send(setting) if Refinery::Contacts::Setting.respond_to?(setting)

          @setting = Refinery::Setting.friendly.find(params[:id])
        end

        def save_notification_recipients
          Refinery::Contacts::Setting.notification_recipients = setting_params[:value] if setting_params.include?('value')
        end

        def save_subject_for_confirmation
          Refinery::Contacts::Setting.confirmation_subject = setting_params[:subject] if setting_params.include?('subject')
        end

        def save_message_for_confirmation
          Refinery::Contacts::Setting.confirmation_message = setting_params[:message] if setting_params.include?('message')
        end

        private

        def setting_params
          params.require(:setting).permit(:value,
            subject: Refinery::I18n.frontend_locales,
            message: Refinery::I18n.frontend_locales)
        end
      end
    end
  end
end
