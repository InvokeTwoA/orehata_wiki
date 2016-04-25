class MailFormsController < ApplicationController

  def new

  end

  # メール送信
  def create
    from_address = params[:mail_form][:from_mail].present? ? params[:mail_form][:from_mail] : 'gamewiki@kappa.com'
    to_address = ENV['TO_MAIL_ADDRESS']
    body = params[:mail_form][:body] << "\n game wiki 連絡フォームから送信されました。"
    ActionMailer::Base.mail(from: from_address, to: to_address, subject: params[:mail_form][:title], body: body).deliver_now!
    redirect_to new_mail_form_path(project_id: params[:project_id]),  notice: 'メールの送信が完了しました'
  rescue => e
    redirect_to :back, flash: { error: "メール送信に失敗しました。間をおいて試すか、@kappa_ikemen まで連絡をください。#{e}" }
  end

end
