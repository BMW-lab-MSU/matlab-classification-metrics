suite = testsuite;
runner = testrunner('textoutput');

tic
% runInParallel(runner, suite)
run(runner, suite)
toc

% delete(gcp('nocreate'));