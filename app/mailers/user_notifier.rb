class UserNotifier < ApplicationMailer
  def send_confirmation(user)
    if user.email
      mail(to: user.email,
           subject: order_confirmation_string(user) + thank_you(user))
    end
  end

  def order_confirmation_string(user)
    "Order ##{user.orders.last.id} confirmation."
  end

  def thank_you(user)
    " Thank you, #{user.fullname}, for purchasing lucky charms!"
  end
end
