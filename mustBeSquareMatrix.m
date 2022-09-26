function mustBeSquareMatrix(arg)
% mustBeSquareMatrix Validate that the input is a square matrix
%   mustBeSquareMatrix(A) throws an exception if A is not a square matrix

%   Copyright 2022 Trevor Vannoy, BMW Lab @ MSU
%   SPDX-License-Identifier: BSD-3-Clause
    dims = size(arg);
    if dims(1) ~= dims(2)
        eid = 'mustBeSquareMatrix:notSquareMatrix';
        msg = 'Input must be a square matrix.';
        throwAsCaller(MException(eid, msg));
    end
end