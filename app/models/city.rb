class City < ActiveRecord::Base
  geocoded_by :name_with_country
  after_validation :geocode

  def name_with_country
    if country
      "#{name}, #{country}"
    else
      name
    end
  end
end
