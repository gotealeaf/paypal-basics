class Registration < ActiveRecord::Base
  belongs_to :course

  validates :full_name, :company, :email, :telephone, presence: true

  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "merchant@gotealeaf.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: course.price,
        item_name: course.name,
        item_number: course.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end


end
