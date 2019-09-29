#In: A - Array containing integers {0, 1, ..., k}, k - Range | Out: Copy of A sorted in ascending order
function CountingSort(A, k)
	C = Array{Int64}(undef, k + 1)
	B = Array{Int64}(undef, length(A))

	for i = 1:length(A)
		C[A[i] + 1] += 1
	end

	for i = 2:length(C)
		C[i] = C[i] + C[i - 1]
	end
	
	for i = length(A):-1:1
		B[C[A[i] + 1]] = A[i]
		C[A[i] + 1] -= 1
	end	
	return B
end
