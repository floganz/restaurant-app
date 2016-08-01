class TimeValidator < ActiveModel::Validator
  # validates reservation time to check if there any intersections
  # with restraunt working day or existing reservation for the same table
  def validate(record)
    reservations = Reservation.reservations_for_period(record.table_id,
      record.start_time, record.end_time)
    if !reservation_valid?(record) || reservations.size != 0
      record.errors[:base] << "Reservation range invalid"
      return false
    end
    return true
  end

  def reservation_valid?(record)
    # Check is reservation times valid
    if (s_time = record.start_time) >= (e_time = record.end_time)
      return false
    end

    unless (rs_time = record.restaurant.open_time.strftime("%H:%M")) ==
           (re_time = record.restaurant.close_time.strftime("%H:%M"))
      if rs_time < re_time
        # Rest working during one day
        if s_time.strftime("%H:%M") >= rs_time && 
          e_time.strftime("%H:%M") <= re_time
          if s_time.strftime("%F") != e_time.strftime("%F")
            return false
          end
        else
          return false
        end
      else
        # Rest working during midnight
        if (d = e_time - s_time)/86400 <= 1
          case d
          when 0
            unless (s_time.strftime("%H:%M") >= rs_time &&
                    e_time.strftime("%H:%M") <= "00:00") ||
                   (s_time.strftime("%H:%M") >= "00:00" &&
                    e_time.strftime("%H:%M") <= re_time)
              return false
            end
          when 1
            if s_time.strftime("%H:%M") <= rs_time ||
                   e_time.strftime("%H:%M") >= re_time
              return false
            end
          else
          end
        else
          return false
        end 
      end
    end
    return true    
  end
end