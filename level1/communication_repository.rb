class CommunicationRepository

  def initialize(in_path, out_path)
    @communications = []
    @practitioners = []
    @in_path = in_path
    @out_path = out_path
    parse_json
  end

  def parse_json
    data = JSON.parse(File.read(@in_path))
    p data['practitioners']
    data['practitioners'].each do |practitioner_data|
      @practitioners << Practitioner.new(
        id: practitioner_data['id'],
        first_name: practitioner_data['first_name'],
        last_name: practitioner_data['last_name'],
        express_delivery: practitioner_data['express_delivery']
        )
    end

    data['communications'].each do |communication|
      practitioner_id = @practitioners.find { |practitioner| practitioner.id == communication['practitioner_id']}
      @communications << Communication.new(
        id: communication['id'],
        practitioner_id: practitioner_id,
        pages_number: communication['pages_number'],
        color: communication['color'],
        sent_at: communication['sent_at'])
    end
  end

  def group_by_date
      @communications.group_by do |communication|
        communication.sent_at.strftime('%Y-%m-%d')
      end
  end

  def store_json
    File.open(@out_path, 'wb') do |file|
    file.write(JSON.generate(@final_json))
    end
  end

  def run
    @final_json = { 'totals' => [] }
    group_by_date.each do |date, communication_by_date|
    price_per_day = 0.0
      communication_by_date.each do |communication|
        price_per_day += communication.price
      end
      @final_json['totals'] << {  'sent_on' => date,
                                  'total' => price_per_day.round(2)
                                }
    end
    store_json
  end
end
