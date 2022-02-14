require 'validator/nric/version'

if defined?(ActiveModel)
  require 'validator/nric/nric_validator'

  # Play nice with ActiveModel custom validator expectation
  NricValidator = Validator::Nric::NricValidator
end

module Validator
  module Nric
    module_function

    # The multiplier for each individual digit
    WEIGHT = [2, 7, 6, 5, 4, 3, 2].freeze

    # Century prefix lookup tables
    #
    # S - Born before 2000. S is the 19th alphabet denoting (1900 - 1999)
    # T - Born in 2000 and beyong. (2000 - 2099??)
    # F - Foreigners with pass issued before 2000
    # G - Foreigners with pass issued between 2000 and 2022
    # M - Foreigners with pass issued after 2022
    #
    # Notice the it is backward of ABCDEFGHIZJ
    # For T and G, there is a shift of 4 places
    S_TABLE = %w(J Z I H G F E D C B A).freeze
    T_TABLE = %w(G F E D C B A J Z I H).freeze
    F_TABLE = %w(X W U T R Q P N M L K).freeze
    G_TABLE = %w(R Q P N M L K X W U T).freeze
    M_TABLE = %w(T R Q P N J L K X W U).freeze

    def mod(value)
      ic_array = value.each_char.map(&:to_i)
      ic_array.zip(Validator::Nric::WEIGHT).map { |a, b| a * b }.inject(:+) % 11
    end

    def lookup(century_prefix, position)
      module_eval("#{century_prefix}_TABLE")[position]
    end

    def check(nric)
      return false if nric.nil? || nric.size != 9
      nric = nric.upcase
      return false unless %w(S T F G M).include?(nric[0])

      century_prefix = nric[0, 1]
      ic_number = nric[1, 7]
      check_character = nric[8, 1]

      lookup(century_prefix, mod(ic_number)) == check_character
    end
  end
end
