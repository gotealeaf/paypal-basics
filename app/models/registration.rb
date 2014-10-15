class Registration < ActiveRecord::Base
  belongs_to :course
  has_one :card
  accepts_nested_attributes_for :card

  validates :full_name, :company, :email, :telephone, presence: true

  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "merchant@gotealeaf.com",
        upload: 1,
        no_shipping: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        notify_url: "#{Rails.application.secrets.app_host}/hook",
        invoice: id,
        item_name: course.name
    }
    values = if course.recurring
               values.merge(
                   cmd: "_xclick-subscriptions",
                   a3: course.price,
                   p3: 1,
                   srt: course.cycles,
                   t3: course.period.first
               )
             else
               values.merge(
                   cmd: "_xclick",
                   amount: course.price,
                   item_number: course.id,
                   quantity: '1'
               )
             end

    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  def payment_method
    if card.first_name.empty? then "paypal"; else "card"; end
  end
end
