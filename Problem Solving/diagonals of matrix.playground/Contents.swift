let matrix = [[1, 2, 3], [4, 5, 6], [9, 8, 9]]


var leftDiagonal  = 0
var rightDiagonal = 0

for (i, row) in matrix.enumerated() {
    
    leftDiagonal += row.dropFirst(i).first!
    rightDiagonal += row.dropLast(i).last!
}

let deff = abs(rightDiagonal - leftDiagonal)

