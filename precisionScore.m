function precision = precisionScore(trueLabelsOrConfMat, predictedLabels, opts)
    arguments
        trueLabelsOrConfMat {mustBeSquareMatrixOrVector, mustBeNumericOrLogical, mustBeInteger}
        predictedLabels {mustBeNumericOrLogical, mustBeInteger, mustBeVector} = 0
        % TODO: add option to specify and exclude labels from the calculation
        opts.Labels {mustBeVectorOrEmpty} = []
        opts.PositiveLabel = 1;
        opts.Average (1,:) char {mustBeMember(opts.Average,{'micro', 'macro', 'samples', 'weighted', 'binary'})} = 'binary'
    end

    if nargin == 1
        confusionMatrix = trueLabelsOrConfMat;

        if isempty(opts.Labels)
            opts.Labels = 0:(size(confusionMatrix,1) - 1);
        end
    else
        trueLabels = trueLabelsOrConfMat;
        mustBeEqualSize(trueLabels, predictedLabels);
        confusionMatrix = confusionmat(trueLabels, predictedLabels);

        % TODO: error handling or sane behavior for labels that aren't in the data
        if isempty(opts.Labels)
            opts.Labels = union(trueLabels, predictedLabels);
        end
    end

    % TODO: check validity when labels aren't all positive or sorted

    nClasses = numel(opts.Labels);

    if nClasses > 2 && opts.Average == 'binary'
        error("'binary' averaging is only valid for binary labels.")
    end

    oneVsAllPrecision = zeros(nClasses,1);

    for classNum = 1:nClasses
        otherClassNums = setdiff(1:nClasses,classNum);

        tp = confusionMatrix(classNum, classNum);
        fn = sum(confusionMatrix(classNum, otherClassNums));
        fp = sum(confusionMatrix(otherClassNums));
        tn = sum(confusionMatrix(otherClassNums, otherClassNums));

        oneVsAllPrecision(classNum) = tp / (tp + fp);
    end

    switch opts.Average
    case 'binary'
        precision = oneVsAllPrecision(find(opts.Labels == opts.PositiveLabel));
    end

end