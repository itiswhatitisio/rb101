require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def promtp(message)
  Kernel.puts("=> #{message}")
end

def valid_num?(num)
  num != 0
end

# start

promtp(MESSAGES['welcome'])

# the loan amount
loan_amount = ''
loop do
  promtp(MESSAGES['loan_am'])
  loan_amount = Kernel.gets().chomp().to_f()

  if valid_num?(loan_amount)
    break
  else
    promtp(MESSAGES['error'])
  end
end

# the annual percentage rate

apr = ''
loop do
  promtp MESSAGES['apr']
  apr = Kernel.gets().chomp().to_f()

  if valid_num?(apr)
    break
  else
    promtp(MESSAGES['error'])
  end
end

# the loan duration

duration_years = ''
duration_months = ''

loop do
  promtp(MESSAGES['duration_years'])
  duration_years = Kernel.gets().chomp().to_i()
  duration_months = duration_years * 12

  if valid_num?(duration_years)
    break
  else
    promtp(MESSAGES['error'])
  end
end

# output - monthly interest rate and loan duration in months
# monthly payment  m = p * (j / (1 - (1 + j)**(-n)))

monthly_interest_rate = (apr / 12 / 100).to_f()

monthly_payment = loan_amount *
                  (monthly_interest_rate /
                  1 - (1 + monthly_interest_rate)**(-duration_months))

# result

promtp("Monthly payment is #{monthly_payment.round(2)}") # round to 2 decimals
