class City < ActiveRecord::Base
  geocoded_by :name_with_country
  after_validation :geocode
  validates :name, presence: true, uniqueness: { scope: :country }

  def name_with_country
    if country
      "#{name}, #{country}"
    else
      name
    end
  end
end
