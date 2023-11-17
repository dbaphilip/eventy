module EventsHelper

  def day_and_time(event)
    # event.starts_at.strftime("%b %d")
    event.starts_at.strftime("%b %d, %I:%M %P")
  end

  def price(event)
    if event.free?
      "Free"
    else
      number_to_currency(event.price, precision: 0)
    end
  end
end
