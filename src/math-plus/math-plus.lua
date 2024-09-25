local Math = {}

Math.random = math["random"]
Math.huge = math["huge"]
Math.abs = math["abs"]
Math.sqrt = math["sqrt"]
Math.min = math["min"]
Math.rad = math["rad"]
Math.sign = math["sign"]
Math.max = math["max"]
Math.sin = math["sin"]
Math.fmod = math["fmod"]
Math.round = math["round"]
Math.pi = math["pi"]
Math.cos = math["cos"]
Math.deg = math["deg"]
Math.exp = math["exp"]
Math.log = math["log"]
Math.pow = math["pow"]
Math.tan = math["tan"]
Math.acos = math["acos"]
Math.asin = math["asin"]
Math.atan = math["atan"]
Math.ceil = math["ceil"]
Math.cosh = math["cosh"]
Math.modf = math["modf"]
Math.sinh = math["sinh"]
Math.tanh = math["tanh"]
Math.atan2 = math["atan2"]
Math.clamp = math["clamp"]
Math.floor = math["floor"]
Math.frexp = math["frexp"]
Math.ldexp = math["ldexp"]
Math.log10 = math["log10"]
Math.noise = math["noise"]
Math.randomseed = math["randomseed"]

Math.tau = Math.pi*2
Math.e = Math.exp(1)
Math.goldr = (1+Math.sqrt(5))/2
Math.sgoldr = (1/3*(1+(((29+3*((93)^0.5))/2)^(1/3))+(((29-3*((93)^0.5))/2)^(1/3))))
Math.nan = 0/0
Math.nhuge = -Math.huge

function Math.cbrt(x:number)
	local result = (Math.abs(x)^(1/3)) * Math.sign(x)
	
	if Math.abs(result) % 1 ~= 0 and Math.abs(x) % 1 == 0 then -- check if result had a floating point error
		result = Math.round(result)
		return result
	else
		return result
	end
end

function Math.avg(...:number)
	local n = 0

	for _, i in {...} do
		n += i
	end

	n /= #{...}
	return n
end

function Math.tetr(x:number, y:number)
	local n = x
	
	if y == 0 then return 1 end
	if y == -1 then return 0 end
	
	for i=1, y-1 do
		n = x^n
	end
	return n
end

function Math.pent(x:number, y:number)
	local n = x
	
	for i=1, y-1 do
		n = Math.tetr(x, n)
	end
	return n
end

function Math.hexa(x:number, y:number)
	local n = x
	
	for i=1, y-1 do
		n = Math.pent(x, n)
	end
	return n
end

function Math.fact(x:number)
	assert(x <= 0 and x % 1 == 0, "Number must be positive and an integer.")
	if x == 0 then return 1 end
	
	local y = x
	for i=1, x-1 do
		y=y*i
	end
	return y
end

function Math.rec(x:number)
	return 1/x
end

function Math.iseven(x:number):boolean
	return x % 2 == 0
end

function Math.factorsof(x:number):{number}
	assert(x >= 0 and x % 1 == 0, "Number cannot be negative or not an integer")
	
	if x == 0 then return {0} end
	
	local factors = {}
	
	for i=1, x do
		if x % i == 0 then
			table.insert(factors, i)
		end
	end
	return factors
end

function Math.sum(min:number, max:number, formula:(number)->number?)
	local n = 0
	for i = min, max do
		if formula then
			n += formula(i)
		else
			n += i
		end
	end
	return n
end

function Math.pro(min:number, max:number, formula:(number)->number?)
	local n = 0
	for i = min, max do
		if formula then
			n *= formula(i)
		else
			n *= i
		end
	end
	return n
end

function Math.int(min:number, max:number, formula:(number)->number?)
	local c = 1e-5
	local a = 0
	for v = min,max,c do
		a += formula(v)*c
	end
	return a
end

function Math.cot(n:number)
	return 1/Math.tan(n)
end

function Math.sec(n:number)
	return 1/Math.cos(n)
end

function Math.csc(n:number)
	return 1/Math.sin(n)
end

function Math.acot(n:number)
	return (-Math.atan(n)) + Math.pi/2
end

function Math.asec(n:number)
	return Math.acos(1/n)
end

function Math.acsc(n:number)
	return Math.asin(1/n)
end

function Math.coth(n:number)
	return Math.cosh(n)/Math.sinh(n)
end

function Math.sech(n:number)
	return 1/Math.cosh(n)
end

function Math.csch(n:number)
	return 1/Math.sinh(n)
end

function Math.asinh(n:number)
	return Math.log(n+Math.sqrt(n^2+1))
end

function Math.acosh(n:number)
	return Math.log(n+Math.sqrt(n^2-1))
end

function Math.atanh(n:number)
	return Math.log((1+n)/(1-n))/2
end

function Math.acoth(n:number)
	return Math.log((n+1)/(n-1))/2
end

function Math.asech(n:number)
	return Math.log(Math.rec(n)+Math.sqrt(1/(n^2)-1))
end

function Math.acsch(n:number)
	return Math.log(Math.rec(n)+Math.sqrt(1/(n^2)+1))
end

return Math
