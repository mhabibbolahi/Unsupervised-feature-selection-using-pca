% main.m
% Unsupervised Feature Selection using PCA + MOORA

clear; clc;
addpath('functions/');

% Load data
dataTrain = load('data/corel.csv');

% Preprocess data: Centering
mu = mean(dataTrain);
X = dataTrain - mu;

% PCA
[Evectors, S] = performPCA(X);
Evalues = diag(S);

% Initialization
decision_matrix = [];
X_reconstructed_prev = [];
max_diff = 0;
k = 1;

% Loop through eigenvectors to compute reconstruction differences
while true
    Evector_k = Evectors(:, k);
    X_reduced = X * Evector_k;
    X_reconstructed = X_reduced * Evector_k';

    differences = X - X_reconstructed;
    norm_diffs = vecnorm(differences, 2, 1);
    decision_matrix(:, k) = norm_diffs';

    if k == 1
        X_reconstructed_prev = X_reconstructed;
    else
        diff_val = norm(X_reconstructed - X_reconstructed_prev);

        if k == 2
            max_diff = diff_val;
        end

        if (diff_val / max_diff) < 0.2
            break;
        end

        X_reconstructed_prev = X_reconstructed;
    end

    k = k + 1;
end

% Normalize decision matrix columns
for i = 1:k
    decision_matrix(:, i) = decision_matrix(:, i) / norm(decision_matrix(:, i));
end

% Weight calculation from eigenvalues
weights = Evalues(1:k);
weights = weights / sum(weights);

% Feature ranking using MOORA
feature_ranking = moora(decision_matrix, weights);

% Output
disp('Top ranked features (by index):');
disp(feature_ranking');
