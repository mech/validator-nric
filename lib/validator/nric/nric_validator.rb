module Validator
  module Nric
    class NricValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless Validator::Nric.check(value)
          record.errors[attribute] << (options[:message] || 'is not an NRIC')
        end
      end
    end
  end
end