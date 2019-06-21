class Communication < ApplicationRecord
  belongs_to :practitioner

  def as_json(options = nil)
    {
      sent_at: sent_at
    }
  end

end
