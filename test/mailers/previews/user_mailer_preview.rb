
class UserMailerPreview < ActionMailer::Preview
    def order_reciept
      UserMailer.order_reciept(user: User.first, order: Order.first)
    end
  end