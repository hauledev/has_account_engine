class PeopleController < AuthorizedController
  def index
    set_collection_ivar resource_class.search(
      params[:by_text],
      :star => true,
      :page => params[:page]
    )
  end

  def show
    # Invoice scoping by state
    @invoices = resource.invoices.where("type != 'Salary'").invoice_state(params[:invoice_state])

    show!
  end

  # has_many :phone_numbers
  def new_phone_number
    if resource_id = params[:id]
      @person = Person.find(resource_id)
    else
      @person = resource_class.new
    end

    @vcard = @person.vcard
    @item = @vcard.contacts.build

    respond_with @item
  end
end
