module Validator
  module Nric
    class NricValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors[attribute] << (options[:message] || 'is not an NRIC') \
          unless Validator::Nric.check(value)
      end
    end
  end
end
