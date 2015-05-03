require 'spec_helper'

describe 'Enumerable as copied by me' do

	before :all do
		@array = [ 1, 2, 3, 6, 5, 4 ]
		@empty = []
		@nilx = nil
	end
	
	#my_each tests
	describe '#my_each' do
		it 'fills a new array' do
			f = []
			@array.my_each { |x| f << x }
			expect(f).to eq( [ 1, 2, 3, 6, 5, 4 ] )
		end

		it 'takes an empty array' do
			f = []
			@empty.my_each { |x| f << x }
			expect(f).to eq([])
		end

		it 'works without block' do
			f = @array.my_each
			expect(f).to be(@array)
		end

		it 'errors on nil' do
			f = false
			begin	
				@nilx.my_each { |x| puts x.to_s + " " + i.to_s }
			rescue
				f = true
			end
			expect(f).to be(true)			
		end
	end

	#my_each_with_index tests
	describe '#my_each_with_index' do 
		it 'fills f with index points' do 
			f = []
			@array.my_each_with_index { |x, i| f << i }
			expect(f).to eq([0,1,2,3,4,5])
		end

		it 'takes an empty array' do
			f = []
			@empty.my_each_with_index { |x, i| f << i }
			expect(f).to eq([])
		end

		it 'works without block' do
			f = @array.my_each_with_index
			expect(f).to eq(@array)
		end

		it 'errors on nil' do 
			f = false
			begin 
				@nilx.my_each_with_index { |x, i| puts x.to_s + " " + i.to_s }
			rescue
				f = true
			end
			expect(f).to be(true)
		end
	end

	#my_select tests
	describe '#my_select' do
		it 'selects from p' do
			p = [ 1, 4, 6 ] 
			f = @array.my_select { |x| p.include?(x) }.sort
			expect(f).to eq(p)
		end

		it 'takes an empty array' do
			p = []
			f = @empty.my_select { |x| p.include?(x) }.sort
			expect(f).to eq(p)
		end

		it 'works without block' do
			f = @array.my_select
			expect(f).to eq(@array)
		end

		it 'errors on nil' do
			f = false
			begin
				p = @nilx.my_select { |x| x == 1 }
			rescue
				f = true
			end
			expect(f).to be(true)
		end		
	end

	describe '#my_all?' do
		it 'returns true' do
			f = @array.my_all? { |x| x > 0 }
			expect(f).to be(true)
		end

		it 'returns false' do
			f = @array.my_all? { |x| x < 0 }
			expect(f).to be(false)
		end

		it 'takes an empty array' do
			f = @empty.my_all? { |x| x < 0 }
			expect(f).to be(true)
		end

		it 'works without block' do
			f = @array.my_all?
			expect(f).to be(true)
		end

		it 'errors on nil' do
			f = false
			begin
				p = @nilx.my_all? { |x| x > 0 }
			rescue
				f = true
			end
			expect(f).to be(true)
		end
	end

	describe '#my_any?' do
		it 'returns true' do
			f = @array.my_any? { |x| x > 0 }
			expect(f).to be(true)
		end

		it 'returns false' do
			f = @array.my_any? { |x| x < 0 }
			expect(f).to be(false)
		end

		it 'takes an empty array' do
			f = @empty.my_any? { |x| x > 0 }
			expect(f).to be(false)
		end

		it 'works without block' do
			f = @array.my_any?
			expect(f).to be(true)
		end

		it 'errors on nil' do
			f = false
			begin
				p = @nilx.my_all? { |x| x > 0 }
			rescue
				f = true
			end
			expect(f).to be(true)
		end
	end	

	describe '#my_none?' do 
		it 'returns true' do
			f = @array.my_none? { |x| x > 0 }
			expect(f).to be(false)
		end

		it 'returns false' do
			f = @array.my_none? { |x| x < 0 }
			expect(f).to be(true)
		end

		it 'takes an empty array' do
			f = @empty.my_none? { |x| x > 0 }
			expect(f).to be(true)
		end

		it 'works without block' do
			f = @array.my_none?
			expect(f).to be(false)
		end

		it 'errors on nil' do
			f = false
			begin
				p = @nilx.my_none? { |x| x > 0 }
			rescue
				f = true
			end
			expect(f).to be(true)
		end
	end	

	describe '#my_count' do 
		it 'takes an empty array' do
			f = @empty.my_count
			expect(f).to be(0)
		end

		it 'takes an empty array and argument' do
			f = @empty.my_count(4)
			expect(f).to be(0)
		end

		it 'counts array elements' do
			f = @array.my_count
			expect(f).to be(6)
		end

		it 'counts array elements with parameter' do
			f = @array.my_count(4)
			expect(f).to be(1)
		end

		it 'works with block' do
			f = @array.my_count { |x| x > 0 }
			expect(f).to be(6)
		end		

	end

end










