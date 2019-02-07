require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'instructions' do
    let(:user) { create(:user, first_name: "Mary", email: "mary@example.com") }
    let(:mail) {UserMailer.activation_email(user)}

    it 'renders the subject' do
      expect(mail.subject).to eql('Activation Email')
    end
    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end
    it 'renders the sender email' do
      expect(mail.from).to eql(['marya.grace5@example.com'])
    end
    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.first_name)
    end
  end
end
