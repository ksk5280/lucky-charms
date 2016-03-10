require "rails_helper"

RSpec.describe UserNotifier, type: :mailer do
  describe "send order confirmation email" do
    order = Order.new(id: 25, status: "ordered")
    user = User.new(username: "erinna",
                    first_name: "Erinna",
                    last_name: "Chen",
                    email: "erinna.chen@gmail.com",
                    orders: [order])
    mail = UserNotifier.send_confirmation(user)

    it "renders the subject" do
      expect(mail.subject).to eql("Order #25 confirmation. Thank you, Erinna Chen, for purchasing lucky charms!")
    end

    it "renders the receiver email" do
      expect(mail.to).to eql([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eql(["noreply@lucky-carms.com"])
    end
  end
end
