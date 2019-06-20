require 'json'

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
    @sent_at = attributes[:sent_at]
  end
end
