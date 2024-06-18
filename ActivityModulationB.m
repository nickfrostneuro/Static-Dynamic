function [Cells_A, Cells_B, dist_A, dist_B ] = ActivityModulationB(raster, Times_A, Times_B, iterations)

%Calculate modulation compared to surrogate derived distribution
%6/30/2023: updated ActivityModulation so that cells which are not active (no active epochs) will be marked as
%nan to avoid being given a value of 0)
%Inputs
%raster: n neuron x frames of detected events, binary
%Times_A & Times_B: binary vectors denoting frames corresponding to each
%behavior

%Outputs
%Cells_A - matrix containing sorted cell ID (column 1), mean activity for total expt(column2) and during times_A, and the percentile compared to shuffled data
%Cells_B - matrix containing sorted cell ID (column 1), mean activity for total expt(column2) and during times_A, and the percentile compared to  shuffled data






A = Times_A;
B = Times_B;


%Calculate average activity of each neuron during each behavior
A = repmat(A,size(raster,1),1);
B = repmat(B,size(raster,1),1);
sumA = (sum(raster' .* A')./sum(A'))';
sumB = (sum(raster' .* B')./sum(B'))';


for i = 1:size(raster,1)
    Cells_A(i,1) = i;
    Cells_B(i,1) = i;
end

Cells_A(:,2) = sum(raster')./size(raster,2);
Cells_B(:,2) = sum(raster')./size(raster,2);

Cells_A(:,3) = sumA;
Cells_B(:,3) = sumB;

dist_A = nan(size(raster,1), iterations); dist_B = nan(size(raster,1), iterations);
parfor i = 1:iterations
    shf = circ_shuf(raster, size(raster,2));
    dist_A(:,i) = (sum(shf' .* A')./sum(A'))';
    dist_B(:,i) = (sum(shf' .* B')./sum(B'))';
end

for i = 1:size(raster,1)
Cells_A(i,4) = sum((dist_A(i,:)<sumA(i))')/iterations;
Cells_B(i,4) = sum((dist_B(i,:)<sumB(i))')/iterations;

%mark cells with 0 active epochs as nan

end

%mark cells that were never active as nan
tmp = find(sum(raster') == 0);
Cells_A(tmp,4) = nan;
Cells_B(tmp,4) = nan;

end
