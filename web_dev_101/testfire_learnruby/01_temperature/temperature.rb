#far to cel
def ftoc(x)
	x = x.to_i * 1.0
	x = (x-32)/1.8
	x = x.round / 1
end
#cel to far
def ctof(x)
	x = x.to_i * 1.0
	x = ((x*9.0)/5.0)+32.0
	x = (x*100).round / 100.0
end