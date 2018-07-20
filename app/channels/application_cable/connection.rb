module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags "ActionCable", "!User #{current_user.id}"
    end

    protected

    def find_verified_user
      # warden是一个devise依赖的框架。env["warden"]是一个环境对象，用于验证
      if current_user = env["warden"].user
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
