class Reservation < ActiveRecord::Base
  belongs_to :table
  has_one :restaurant, :through => :table

  validates :table_id, :start_time, :end_time, presence: true
  validates_with TimeValidator, fields: [:table_id, :start_time,
  :end_time, :date]

  def self.reservations_for_period(id,s_time,e_time)
    @reservations = Reservation.joins(:table)
      .where("reservations.start_time BETWEEN '#{s_time}' AND '#{e_time}' OR
              reservations.end_time BETWEEN '#{s_time}' AND '#{e_time}' OR
              reservations.start_time <= '#{s_time}' AND 
              reservations.end_time >= '#{e_time}' OR
              reservations.start_time >= '#{s_time}' AND 
              reservations.end_time <= '#{e_time}'"
      )
      .where("reservations.table_id": id)
  end
end