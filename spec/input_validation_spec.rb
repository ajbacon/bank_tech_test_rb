require 'input_validation'

describe InputValidation do
  describe "#check" do
    it "should raise an error if a string is input" do
      validation = InputValidation.new("123")
      expect { validation.check }.to raise_error(StandardError, "please enter positive value to maximum of 2 decimal places")
    end

    it "should raise an error if a negative number is input" do
      validation = InputValidation.new(-123.45)
      expect { validation.check }.to raise_error "please enter positive value to maximum of 2 decimal places"
    end

    it "should raise an error if a number with more than 2 decimal places is input" do
      validation = InputValidation.new(123.456)
      expect { validation.check }.to raise_error "please enter positive value to maximum of 2 decimal places"
    end

    it "should return true for a correct input" do
      validation = InputValidation.new(123.45)
      expect(validation.check).to eq true
    end
  end
end
