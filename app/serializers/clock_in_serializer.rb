class ClockInSerializer < ActiveModel::Serializer
  attributes :id, :clock_type, :clock_time

  def clock_time
    object.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
