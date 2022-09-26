function mustBeEqualSize(a,b)
% mustBeEqualSize Validate that the inputs are the same size
%   mustBeEqualSize(a,b) throws an exception if a and b are not the same size

%   Copyright 2022 Trevor Vannoy, BMW Lab @ MSU
%   SPDX-License-Identifier: BSD-3-Clause
    if ~isequal(size(a),size(b))
        eid = 'mustBeEqualSize:notEqualSize';
        msg = 'Size of first input must equal size of second input.';
        throwAsCaller(MException(eid,msg))
    end
end