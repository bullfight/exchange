module Exchange
  class Invoice < InvoiceItem

    def amount
      line_items.map(&:amount).inject(0, :+)
    end

    def description
      list = ""
      if line_items.any?
        list = line_items.map(&:description).join("], [")
        list = ": [#{list}]"
      end
      @description + list
    end

    def line_items
      @line_items ||= []
    end

    def add_line_item(line_item)
      line_items << line_item
    end
  end
end
