class Option

  attr_accessor :name, :position

  def initialize(params)
    @name = params['name'] if params['name']
    @position = params['position'] if params['position']
  end

end