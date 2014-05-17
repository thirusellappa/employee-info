class User < ActiveRecord::Base
  
  validates_presence_of :name, message: "Name is required"
  validates_presence_of :age, message: "Age is required"
  validates_numericality_of :age, message: "Age  must be an integer"
  validates_presence_of :gender, message: "Gender is required"
  validates_presence_of :basic_pay, message: "Basic Pay is required"
  validates_numericality_of :basic_pay, message: "Basic Pay  must be an integer"
  validates_presence_of :pf_deduction, message: "PF Deduction is required"
  validates_numericality_of :pf_deduction, message: "PF Deduction must be an integer"
  
  def calculate_pay
    hra = (basic_pay < 5000 ? 2500 : (basic_pay*10)/100)
    update(:hra => hra, :net_pay => basic_pay + hra - pf_deduction)
  end
  
end
