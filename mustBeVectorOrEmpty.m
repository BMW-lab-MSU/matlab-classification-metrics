function mustBeVectorOrEmpty(arg)
% mustBeVectorOrEmpty Validate that the input is a vector or empty
%   mustBeVectorOrEmpty(A) throws an exception if A is not a vector or empty

%   Copyright 2022 Trevor Vannoy, BMW Lab @ MSU
%   SPDX-License-Identifier: BSD-3-Clause
    if ~isvector(arg) && ~isempty(arg)
        eid = 'mustBeVectorOrEmpty:notVectorOrEmpty';
        msg = 'Input must be a vector or empty.';
        throwAsCaller(MException(eid, msg));
    end
end