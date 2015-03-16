module Enumerable

	def my_each
		if block_given?
			for i in 0...self.length
				yield(self[i])
			end
			self
		else
			self
		end
	end

	def my_each_with_index
		if block_given?
			for i in 0...self.length
				yield(self[i], i)
			end
			self
		else
			self
		end
	end

	def my_select
		if block_given?
			ans = []
			self.my_each { |elt| ans << elt if yield(elt) }
			ans
		else
			self
		end
	end

	def my_all?
		if block_given?
			self.my_each { |elt| return false unless yield(elt) }
			true
		else
			self.my_all? {|obj| obj}
		end
	end

	def my_any?
		if block_given?
			self.my_each { |elt| return true if yield(elt) }
			false
		else
			self.my_any? {|obj| obj}
		end
	end

	def my_none?
		if block_given?
			self.my_each { |elt| return false if yield(elt) }
			true
		else
			!(self.my_any?)
		end
	end

	def my_count(item = nil)
		count = 0
		if block_given?
			self.my_select { |x| yield(x) }.length			
		elsif item.nil?
			self.length
		else
			self.my_select {|x| x==item}.length
		end
	end

	def my_map(proc = Proc.new { |obj| obj })
		mapped = []
		for i in 0...self.length do
			mapped << (block_given? ? proc.call(yield(self[i])) : proc.call(self[i]))
		end
		mapped
	end

	def my_inject(init=nil, sym=nil)
		if init.nil? #no parameters
			init = self[0]
			flag = true #flags lack of parameter
		elsif init.class == Symbol #one parameter that is a symbol
			sym = init 
			init = self[0]
			flag = true
		end
		if sym
			case sym
			when :+
				self.my_each { |elt| init += elt }
				init-=self[0] if flag
			when :-
				self.my_each { |elt| init -= elt }
				init+=self[0] if flag
			when :*
				self.my_each { |elt| init *= elt }
				init/=self[0] if flag
			when :/
				self.my_each { |elt| init /= elt }
				init*=self[0] if flag
			when :%
				self.my_each { |elt| init %= elt }
				init*=self[0] if flag
			when :**
				self.my_each { |elt| init **= elt }
				init**=(self[0]**-1) if flag
			else
				return error
			end
		end
		if block_given? 
			self.my_each { |elt| init = yield(init, elt) } 
			init-=self[0] if flag
		end
		init 
	end

end

def multiply_els(array)
	array.my_inject(:*)
end
