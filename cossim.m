function [cosine_similarity,theta] = cossim(A,B, pw)
%Inputs A and B are 1xN vectors
%pw determines if will perform pairwise comparison (removes NaNs from input
%datasets)
%OPutput sim is cosine similarity of A and B

if nargin < 3; pw = 1; end

if pw == 1
%remove isnans for pairwise comparison
tmp = find(isnan(A) == 0 & isnan(B) == 0);
A = A(tmp);
B = B(tmp);
tmp
end

% Normalize the matrices
A = A ./ norm(A,2);
B = B ./ norm(B,2);
  
% Calculate dot product 
% between each row of the matrices
dot_product = A * B';
  
% Calculate cosine similarity
% between each row
cosine_similarity = dot_product ./ (norm(A,2) .* norm(B,2)');
theta = acosd(cosine_similarity);
  
