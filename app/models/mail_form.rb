class MailForm
  include ActiveModel::Model

  attr_accessor :name, :title, :body, :from_mail
end
