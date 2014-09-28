class Registration < ActiveRecord::Base
  belongs_to :course

  validates :full_name, :company, :email, :telephone, presence: true

  def paypal_url(return_url)
    values = {
        business: "merchant@gotealeaf.com",
        cmd: "_xclick",
        upload: 1,
        return: return_url,
        invoice: id,
        amount: course.price,
        item_name: course.name,
        item_number: course.id,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end


end
