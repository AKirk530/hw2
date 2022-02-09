class Movie < ApplicationRecord

    def person_id
        Person.where({name:read_attribute(:id)})
end

