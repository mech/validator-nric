require 'validator/nric/version'
require 'validator/nric/nric_validator' if defined?(ActiveModel)

module Validator
  module Nric
    module_function

    # The multiplier for each individual digit
    WEIGHT = [2, 7, 6, 5, 4, 3, 2]

    # Century prefix
    #
    # S - Born before 2000. S is the 19th alphabet denoting (1900 - 1999)
    # T - Born in 2000 and beyong. (2000 - 2099??)
    # F - Foreigners with pass issued before 2000
    # G - Foreigners with pass issued after 2000
    VALID_CENTURY = %w(S T F G)

    # Notice the it is backward of ABCDEFGHIZJ
    # For T and G, there is a shift of 4 places
    S_TABLE = %w(J Z I H G F E D C B A)
    T_TABLE = %w(G F E D C B A J Z I H)
    F_TABLE = %w(X W U T R Q P N M L K)
    G_TABLE = %w(R Q P N M L K X W U T)

    def check(nric)
      nric.upcase!
      fail ArgumentError, 'Must be 9 characters' unless nric.size == 9

      century_prefix = nric[0, 1]
      ic_number = nric[1, 7]
      check_character = nric[8, 1]

      ic_array = ic_number.each_char.map(&:to_i)
      comparator = ic_array.zip(WEIGHT).map { |a, b| a * b }.inject(:+) % 11

      case century_prefix
      when 'S' then S_TABLE[comparator] == check_character
      when 'T' then T_TABLE[comparator] == check_character
      when 'F' then F_TABLE[comparator] == check_character
      when 'G' then G_TABLE[comparator] == check_character
      else
        false
      end
    end
  end
end
