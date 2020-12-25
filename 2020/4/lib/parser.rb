# frozen_string_literal: true

class Parser
  PASS_REGEX = /(?<low>\d+)\-(?<high>\d+) (?<letter>[a-z]): (?<password>[a-z]+)/.freeze

  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split(/^$/)
      .map { |l| parse_passport(l) }
  end

  def self.parse_passport(passport)
    Identity.new(passport.scan(/(\w{3}:[^\s]+)/))
  end
end

class Identity
  def initialize(key_values)
    @store = key_values
      .flatten
      .map { |v| v.split(":") }
      .each_with_object({}) do |(key, value), acc|
        acc[key] = value
      end
  end

  def valid?
    store
      .reject { |k, _v| k == "cid" }
      .keys
      .length == 7
  end

# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.

  def validated?
    birth_year_valid? &&
      issue_year_valid? &&
      expiration_year_valid? &&
      height_valid? &&
      hair_valid? &&
      eye_valid? &&
      passport_id_valid?
  end


  private

  attr_reader :store

  def birth_year_valid?
    store.fetch("byr") =~ /^\d{4}$/ && store.fetch("byr").to_i.between?(1920, 2002)
  end

  def issue_year_valid?
    store.fetch("iyr") =~ /^\d{4}$/ && store.fetch("iyr").to_i.between?(2010, 2020)
  end

  def expiration_year_valid?
    store.fetch("eyr") =~ /^\d{4}$/ && store.fetch("eyr").to_i.between?(2020, 2030)
  end

  def height_valid?
    height = store.fetch("hgt")
    data = height.match(/^(?<value>\d+)(?<unit>(cm|in))$/)
    return false unless data

    if data["unit"] == "cm"
      data["value"].to_i.between?(150, 193)
    else
      data["value"].to_i.between?(59, 76)
    end
  end

  def hair_valid?
    store.fetch("hcl") =~ /^#[0-9a-f]{6}$/
  end

  def eye_valid?
    store.fetch("ecl") =~ /^(amb|blu|brn|gry|grn|hzl|oth)$/
  end

  def passport_id_valid?
    store.fetch("pid") =~ /^[\d]{9}$/
  end
end
