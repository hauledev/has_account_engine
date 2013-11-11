class BookingTemplatesController < HasAccountsController
  # Actions
  def create
    create! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end

  def new_booking
    booking_params = params[:booking] || {}
    booking_params[:value_date] ||= Date.today
    booking_params[:code]       ||= (Booking.maximum(:code) || 0) + 1
    booking_parameters = @booking_template.booking_parameters(booking_params)

    redirect_to simple_edit_bookings_path(:booking => booking_parameters)
  end
end
