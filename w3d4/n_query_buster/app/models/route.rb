class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    bus_drivers = self.buses.includes(:drivers)

    all_drivers = Hash.new{|h, k| h[k] = []}
    bus_drivers.each do |bus|
      bus.drivers.each do |driver|
        all_drivers[bus.id] << driver
      end
    end

    all_drivers
  end
end
