function mustBeSquareMatrixOrVector(arg)
% mustBeSquareMatrixOrVector Validate that the input is a square matrix or a vector
%   mustBeSquareMatrixOrVector(A) throws an exception if A is not a
%   square matrix or a vector

%   Copyright 2022 Trevor Vannoy, BMW Lab @ MSU
%   SPDX-License-Identifier: BSD-3-Clause
    dims = size(arg);
    notSquare = dims(1) ~= dims(2);
    if notSquare && ~isvector(arg)
        eid = 'mustBeSquareMatrixOrVector:notSquareMatrixOrVector';
        msg = 'Input must be a square matrix or a vector.';
        throwAsCaller(MException(eid, msg));
    end
end