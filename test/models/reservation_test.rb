require 'test_helper'
 
class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save" do
    reservation = Reservation.new(
      id: 3,
      table_id: 1, 
      start_time: '2016-07-29 11:00:00',
      end_time: '2016-07-29 12:00:00')
    #p reservation
    assert reservation.save, "Test done"
  end

  test "should NOT save" do
    reservation = Reservation.new(
      id: 3,
      table_id: 1, 
      start_time: '2016-07-29 9:00:00',
      end_time: '2016-07-29 12:00:00')
    #p reservation
    assert_not reservation.save, "Test done"
  end
end