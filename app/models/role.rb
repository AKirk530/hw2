class Role < ApplicationRecord

    def person_id
        Person.where({name:read_attribute(:id)})
end

def movie_id
    Person.where({name:read_attribute(:id)})
end