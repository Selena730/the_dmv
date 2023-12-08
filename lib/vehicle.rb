require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = vehicle_details[:plate_type]
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def  register_vehicle(vehicle)
    @services.include?('Vehicle Registration')

  end


  def registration_fee(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric_vehicle?
      200
    else
      100
    end
  end

end
