module KOSapiClient
  module Entity
    class Coursin < BaseEntity

      # XXX: This is really ugly hack! The problem is that "semester" is both
      # element and attribute, and they are mapped into single Ruby attribute.
      map_data :semester, Link, element: 1, path: :semester
      map_data :capacity_overfill, Enum
      map_data :occupied, Integer
      map_data :examiners, [Link], element: :teacher, path: :examiners
      map_data :guarantors, [Link], element: :teacher, path: :guarantors
      map_data :instructors, [Link], element: :teacher, path: :instructors
      map_data :lecturers, [Link], element: :teacher, path: :lecturers

      map_data :instance_capacity, Integer, reader: ->(source_hash, _key) do
        retrieve_capacity('instance', source_hash)
      end
      map_data :tutorial_capacity, Integer, reader: ->(source_hash, _key) do
        retrieve_capacity('tutorial', source_hash)
      end

      alias_method :capacity, :instance_capacity

      class << self
        private

        def retrieve_capacity(type, source_hash)
          capacity = source_hash[:capacity]
          return unless capacity

          capacity = [capacity] unless capacity.is_a? Array
          element = capacity.find { |el| el[:of] == type }
          element[:__content__] if element
        end
      end
    end
  end
end
