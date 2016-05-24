class Location < ActiveRecord::Base
  belongs_to :city
  geocoded_by :title_with_city
  after_validation :geocode

  def title_with_city
    if city
      "#{title}, #{city.name_with_country}"
    else
      title
    end
  end
end
