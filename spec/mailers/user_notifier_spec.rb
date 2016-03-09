require "rails_helper"

RSpec.describe UserNotifier, type: :mailer do
  describe 'send order confirmation email' do
    order = Order.new(id: 25, status: "ordered")
    user = User.new(username: "erinna", email: "erinna.chen@gmail.com", orders: [order])
    #mail = UserNotifier.send_confimation(order)

    it 'renders the subject' do
      expect(mail.subject).to eql("Order #25 confirmation. Thank you for purchasing lucky charms!")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@example.com'])
    end
  end
end


# class Notifier < ActionMailer::Base
#   default from: 'noreply@company.com'
#
#   def instructions(user)
#     @name = user.name
#     @confirmation_url = confirmation_url(user)
#     mail to: user.email, subject: 'Instructions'
#   end
# end

# describe 'instructions' do
#   let(:user) { mock_model User, name: 'Lucas', email: 'lucas@email.com' }
#   let(:mail) { Notifier.instructions(user) }
#
#   it 'renders the subject' do
#     expect(mail.subject).to eql('Instructions')
#   end
#
#   it 'renders the receiver email' do
#     expect(mail.to).to eql([user.email])
#   end
#
#   it 'renders the sender email' do
#     expect(mail.from).to eql(['noreply@company.com'])
#   end
#
#   it 'assigns @name' do
#     expect(mail.body.encoded).to match(user.name)
#   end
#
#   it 'assigns @confirmation_url' do
#     expect(mail.body.encoded)
#       .to match("http://aplication_url/#{user.id}/confirmation")
#   end
# end
# end
