require 'rails_helper'

RSpec.describe Reservation, type: :model do
  fixtures :restaurants, :tables, :reservations
  # Valid
  it "Test One" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 1,
      start_time: '2016-07-29 11:00:00',
      end_time: '2016-07-29 12:00:00')

    @reservation.should be_valid
  end
  # Restraunt not working at this time
  it "Test Two" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 1,
      start_time: '2016-07-29 06:00:00',
      end_time: '2016-07-29 07:00:00')

    @reservation.should_not be_valid
  end
  # Has intersections
  it "Test Three" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 1,
      start_time: '2016-07-29 15:30:00',
      end_time: '2016-07-29 17:00:00')

    @reservation.should_not be_valid
  end
  # Different dates but rest not working all day
  it "Test Four" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 1,
      start_time: '2016-07-29 17:00:00',
      end_time: '2016-07-30 17:00:00')

    @reservation.should_not be_valid
  end
  # All ok
  it "Test One_" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 2,
      start_time: '2016-07-29 11:00:00',
      end_time: '2016-07-29 12:00:00')

    @reservation.should be_valid
  end
  # All ok
  it "Test Two_" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 2,
      start_time: '2016-07-29 06:00:00',
      end_time: '2016-07-29 07:00:00')

    @reservation.should be_valid
  end
  #All ok
  it "Test Three_" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 2,
      start_time: '2016-07-29 17:00:00',
      end_time: '2016-07-30 17:00:00')

    @reservation.should be_valid
  end
  # All ok
  it "Test One_M" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 3,
      start_time: '2016-07-29 23:01:00',
      end_time: '2016-07-29 23:59:00')

    @reservation.should be_valid
  end
  # Rest not working this time
  it "Test Two_M" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 3,
      start_time: '2016-07-29 23:30:00',
      end_time: '2016-07-29 01:00:00')

    @reservation.should_not be_valid
  end
  #All ok
  it "Test Three_M" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 3,
      start_time: '2016-07-29 5:00:00',
      end_time: '2016-07-30 6:00:00')

    @reservation.should_not be_valid
  end
  # All ok
  it "Test Four_M" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 3,
      start_time: '2016-07-29 23:30:00',
      end_time: '2016-07-30 01:00:00')

    @reservation.should be_valid
  end
  # Intersections
  it "Test Fife_M" do
    @reservation = Reservation.new(
      id: 3,
      table_id: 3,
      start_time: '2016-07-30 01:00:00',
      end_time: '2016-07-30 03:00:00')

    @reservation.should_not be_valid
  end
end
