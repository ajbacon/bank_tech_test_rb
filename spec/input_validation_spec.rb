require 'input_validation'
include InputValidation

describe InputValidation do
  describe "#check" do
    it "should raise an error if a string is input" do
      expect { check_input("123.45") }.to raise_error(StandardError, "please enter positive value to maximum of 2 decimal places")
    end

    it "should raise an error if a negative number is input" do
      expect { check_input(-123.45) }.to raise_error(StandardError, "please enter positive value to maximum of 2 decimal places")
    end

    it "should raise an error if a number with more than 2 decimal places is input" do
      expect { check_input(123.456) }.to raise_error(StandardError, "please enter positive value to maximum of 2 decimal places")
    end

    it "should return true for a correct input" do
      expect(check_input(123.45)).to eq true
    end
  end
end
