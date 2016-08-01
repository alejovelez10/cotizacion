class Alejo


  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :descripcion, :cliente_id

  with_options presence: true do |required|
    required.validates :descripcion
    required.validates :cliente_id
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Propuest")
  end

  def valid?
    validate_rows = @d_item_rows.all?(&:valid?)
    validate_form = super()
    validate_rows && validate_form
  end

  def submit(params)
    extract_params(params)
    if valid?
      persist!
      true
    else
      false
    end
  end
      
  def extract_params(params)
    @descripcion = params[:descripcion]
    @cliente_id = params[:cliente_id]
    @d_item_params = params[:d_item_rows]
  end

  class DItemRow

    attr_accessor :propuest_id, :item_id

    include ActiveModel::Validations

    with_options presence: true do |required|
      required.validates :propuest_id 
      required.validates :item_id
    end

    def initialize(params = {})
      @propuest_id = params[:propuest_id]
      @item_id = params[:item_id]
       end

    def persisted?
      false
    end
  end

  class NewDItemRow < DItemRow

    attr_accessor :propuest

    def initialize(params = {})
      @propuest = params[:propuest]
      super
    end

    def persisted?
      false
    end

    def persist! # find a better way to create the association
      DItem.create!(propuest_id: propuest_id, item_id: item_id)
    end
  end

end