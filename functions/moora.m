function ranked_features = moora(decision_matrix, weights)
    % Apply MOORA method for feature ranking
    % Inputs:
    %   decision_matrix: m × k matrix (m features, k criteria)
    %   weights: 1 × k vector of normalized weights
    % Output:
    %   ranked_features: indices of features sorted by score (descending)

    weighted_matrix = decision_matrix .* weights';
    scores = sum(weighted_matrix, 2);
    [~, ranked_features] = sort(scores, 'descend');
end
