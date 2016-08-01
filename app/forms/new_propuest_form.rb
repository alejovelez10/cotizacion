



class NewPropuestForm < Alejo

  def persisted?
    false
  end


    def d_item_rows
    @d_item_rows ||= [NewDItemRow.new] # uhhhh...
  end


  def persist!
    @propuest = Propuest.new(descripcion: descripcion, cliente_id: cliente_id)

    @d_item_rows.each do |d_item_row|
      d_item = d_item_row.persist!
      @propuest.d_items << d_item
    end

    @propuest.save!
  end

  def extract_params(params)
    super

    @d_item_rows = @d_item_params.map do |k, d_item_attrs|
      NewDItemRow.new(d_item_attrs)
    end
  end

end