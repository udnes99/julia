#MergeSort for nx2 matrix with option to sort on first or second column.
function MergeArrays(x,y,coordinate)
	rows = size(x,1) + size(y, 1) #n
	Sorted = zeros(Int, rows, 2) #nx2 matrix
	sentinel = [Inf Inf]
	L = [x;sentinel]
	R = [y;sentinel]

	i = 1
	j = 1
	for k = 1: size(Sorted, 1)
		if L[i, coordinate] <= R[j, coordinate]
			Sorted[k, 1] = x[i, 1]
			Sorted[k, 2] = x[i, 2]
			i += 1
		else
			Sorted[k, 1] = y[j, 1]
			Sorted[k, 2] = y[j, 2]
			j += 1
		end
	end
	return Sorted
end

function MergeSort(x, coordinate)
	rows = size(x, 1)
	if rows > 1
		q = floor(Int, rows/2)
		LSorted = MergeSort(x[1:q, :], coordinate)
		RSorted = MergeSort(x[q+1: rows, :], coordinate)
		return MergeArrays(LSorted, RSorted, coordinate)
	end
	return x
end
