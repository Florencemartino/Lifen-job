require 'json'
require 'date'

class Practitioner
  attr_reader :id, :first_name, :last_name, :express_delivery

  def initialize(attributes)
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @express_delivery = attributes[:express_delivery]
  end
end

class Communication
  attr_reader :practitioner_id, :pages_number, :color, :sent_at

  def initialize(attributes)
    @id = attributes[:id]
    @practitioner_id = attributes[:practitioner_id]
    @pages_number = attributes[:pages_number]
    @color = attributes[:color]
    @sent_at = DateTime.parse(attributes[:sent_at])
  end

  def price
    @practitioner_id
    total_price = 0.1
    total_price += 0.18 if @color
    total_price += (@pages_number - 1) * 0.07 if @pages_number > 1
    total_price += 0.6 if @practitioner_id.express_delivery
    return total_price
  end
end
