
class UserMailerPreview < ActionMailer::Preview
    def order_reciept
      UserMailer.order_reciept(user: User.first, order: Order.find(4))
    end
  end