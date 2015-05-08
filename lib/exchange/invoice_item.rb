module Exchange
  class InvoiceItem
    attr_reader :amount, :description

    def initialize(params)
      @amount = params[:amount]
      @description = params[:description]
    end
  end
end
