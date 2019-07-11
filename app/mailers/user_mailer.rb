class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_reciept(params)
        @user = params[:user]
        @order = params[:order]
        mail(to: @user.email, subject: 'Jungle Order Reciept')
    end

end
