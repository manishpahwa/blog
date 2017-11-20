class Bank

	def initialize name,equity,reserve=0.1,pool
		@name = name
		@equity = equity
		@reserve = reserve
		@pool = pool
	end
	
	def roll(roi, intrest,expenses)
		intrest_paid = @pool * intrest
		intrest_earned = (@pool*(1-@reserve))*roi
		@equity = @equity + intrest_earned - intrest_paid - expenses
	end

	def to_s
		"#{@name} bank has an equity of #{@equity}, reserve of #{@reserve} and a savings pool of #{@pool}"
	end
	
	def deposit(credit)
		@pool += credit*(1-@reserve)
	end

	def withdrawl(debit)
		@pool -= debit*(1-@reserve)
	end		

	
end

if __FILE__ == $0
	cba = Bank.new("CBA",1,0.1,10)
	puts cba.to_s
	cba.roll(0.1,0.05,0.005)
	puts cba.to_s
	cba.deposit(4)
	cba.roll(0.1,0.05,0.005)
	puts cba.to_s
	cba.withdrawl(5)
	cba.roll(0.1,0.05,0.005)
	puts cba.to_s

end
