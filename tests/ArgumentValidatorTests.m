classdef ArgumentValidatorTests < matlab.unittest.TestCase

    methods (TestClassSetup)
        function addToPath(testCase)
            p = path;
            testCase.addTeardown(@path, p);
            addpath('../');
        end
    end

    properties (TestParameter)
        vectorOrEmpty = struct('empty', [], 'rowVector', ones(1,4), ...
            'columnVector', rand(7,1), 'scalar', 1, 'stringScalar', "test", ...
            'charVector', 'test', 'scalarStruct', struct('test', [1 2 3]));
        notVectorOrEmpty = struct('matrix', magic(4));
        squareMatrixOrVector = struct('squareMatrix', magic(100), ...
            'rowVector', ones(1,10), 'columnVector', ones(5,1), 'scalar', 1);
        notSquareMatrixOrVector = struct('rand4x3', rand(4,3), 'empty', []);
        squareMatrix = struct('squareMatrix', magic(10), 'scalar', 5);
        notSquareMatrix = struct('rand40x3', rand(40,3), 'empty', [], ...
            'charVector', 'asdf', 'vector', ones(1,3));
        equalSizeArg1 = struct('matrix', rand(4,3), 'rowVector', ones(1,4), ...
            'columnVector', ones(5,1), 'scalar', 1);
        equalSizeArg2 = struct('matrix', rand(4,3), 'rowVector', zeros(1,4), ...
            'columnVector', rand(5,1), 'scalar', 10);
        notEqualSizeArg1 = struct('matrix', rand(4,3), ...
            'rowVector', ones(1,4), 'columnVector', ones(5,1), 'scalar', 1);
        notEqualSizeArg2 = struct('matrix', rand(2,30), ...
            'columnVector', rand(5,1), 'matrix2', zeros(5,4), ...
            'rowVector', ones(1,4));
    end

    methods (Test)
        function testMustBeVectorOrEmptyPass(testCase,vectorOrEmpty)
            testCase.verifyWarningFree(@() mustBeVectorOrEmpty(vectorOrEmpty))
        end

        function testMustBeVectorOrEmptyFail(testCase,notVectorOrEmpty)
            testCase.verifyError(@() mustBeVectorOrEmpty(notVectorOrEmpty), 'mustBeVectorOrEmpty:notVectorOrEmpty')            
        end

        function testMustBeSquareMatrixOrVectorPass(testCase,squareMatrixOrVector)
            testCase.verifyWarningFree(@() mustBeSquareMatrixOrVector(squareMatrixOrVector))
        end

        function testMustBeSquareMatrixOrVectorFail(testCase,notSquareMatrixOrVector)
            testCase.verifyError(@() mustBeSquareMatrixOrVector(notSquareMatrixOrVector), 'mustBeSquareMatrixOrVector:notSquareMatrixOrVector')            
        end

        function testMustBeSquareMatrixPass(testCase,squareMatrix)
            testCase.verifyWarningFree(@() mustBeSquareMatrix(squareMatrix))
        end

        function testMustBeSquareMatrixFail(testCase,notSquareMatrix)
            testCase.verifyError(@() mustBeSquareMatrix(notSquareMatrix), 'mustBeSquareMatrix:notSquareMatrix')            
        end

    end

    methods(Test,ParameterCombination="sequential")
        function testMustBeEqualSizePass(testCase,equalSizeArg1,equalSizeArg2)
            testCase.verifyWarningFree(@() mustBeEqualSize(equalSizeArg1,equalSizeArg2))
        end

        function testMustBeEqualSizeFail(testCase,notEqualSizeArg1,notEqualSizeArg2)
            testCase.verifyError(@() mustBeEqualSize(notEqualSizeArg1,notEqualSizeArg2), 'mustBeEqualSize:notEqualSize')
        end

    end
end