function accuracy = accuracyScore(trueLabelsOrConfusionMatrix, predictedLabels)
% accuracyScore Accuracy classification score
%   Computes the accuracy score for binary or multiclass labels.
%
%   accuracy = accuracyScore(confusionMatrix) returns the accuracy score
%   given a binary or multiclass confusion matrix.
%   
%   accuracy = accuracyScore(trueLabels, predictedLabels) returns the
%   accuracy score given the ground truth and predicted labels.
%   trueLabels and predictedLabels must be integer or logical values.   
%
%   Accuracy is defined as (# correct predictions) / (total # of predictions).
%   In the binary case: accuracy = (TP + TN) / (TP + TN + FP + FN)
%
%   See also: confusionmat

%   Copyright 2022 Trevor Vannoy, BMW Lab @ MSU
%   SPDX-License-Identifier: BSD-3-Clause
    arguments
        trueLabelsOrConfusionMatrix {mustBeSquareMatrixOrVector, mustBeNumericOrLogical, mustBeInteger}
        predictedLabels {mustBeNumericOrLogical, mustBeInteger} = 0
    end

    if nargin == 1
        confusionMatrix = trueLabelsOrConfusionMatrix;
    else
        trueLabels = trueLabelsOrConfusionMatrix;
        mustBeEqualSize(trueLabels, predictedLabels);
        confusionMatrix = confusionmat(trueLabels, predictedLabels);
    end

    correctClassifications = sum(diag(confusionMatrix));
    allClassifications = sum(confusionMatrix, 'all');

    accuracy = correctClassifications / allClassifications;
end