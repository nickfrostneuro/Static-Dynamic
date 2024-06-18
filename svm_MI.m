function [MI,performance, Beta] = svm_MI(AB, ab, iterations, holdout)
%1. Take a raster consisting of individual neurons
%2. calculate decoding accuracy for A. single units, population

%updated 4/17/2023 by NAF to balance input data by class
%will also output an averaged Beta corresponding to the mean 

%requires subfunctions for calculating Mutul Information

%input 
%AB = raster of activity; should be in forma n cells x T frames, and frames
%not corresponding to expected behavioral states (1 v 2) should be removed.
%ab = behavior scoring (1 = behavior 1, 2 = behavior 2) which correspond to
%frames of AB
%iterations = number of times to train and test classifier
%hold out - fraction of frames to hold out, will train on remaining frames

%Output
%I - Mutual information (in bits)


%will train and test on frames with activity >= threshold
threshold = 1; 
th = sum(AB)>threshold;
AB = AB(:,th);
ab = ab(th);

 

%calculate mutual information - note works on binary data 
MI = nan(1,min(10, size(AB,1)));
for i = 1:size(AB,1)
MI(i) = MutualInformation(AB(i,:)'>0, ab'); %calculate mutual information (in bits) for each neuron
end


%now train classifier on first pair and test on other 2, using linear decoders

linear_error = [];
for it = 1:iterations 
        %balance the input data between behavioral states
        balanced = 1;
        if balanced == 1
            
            Behavior.A = find(ab== 1);
            Behavior.B = find (ab==2);

            %find which behaivor has fewer frames and randomly sample equal
            %number of frames from other behavior
            frame_balance = min(numel(Behavior.A), numel(Behavior.B));
            threshA = frame_balance/numel(Behavior.A);
            threshB = frame_balance/numel(Behavior.B);
            
            %remove extra frames
            tmpA = rand(1, numel(Behavior.A));
            tmpB = rand(1, numel(Behavior.B));
            
            tmp = tmpA > threshA;
            Behavior.A(tmp) = [];
            tmp = tmpB > threshB;
            Behavior.B (tmp) = [];
            
                
            Frames_balanced = numel(Behavior.A)+ numel(Behavior.B);
            balanced_AB = [AB(:,Behavior.A) AB(:,Behavior.B)];
            balanced_ab = [ab(:,Behavior.A) ab(:,Behavior.B)];
        end
    
   
        %now divide into training and testing epochs with buffers
        %between training and testing blocks to limit temporal
        %correlations.
        [Neurons, Frames] = size(AB);
        

        blocksize = 100;
        buffer = 20;
        if balanced == 1; blocks = floor(Frames_balanced/(blocksize+buffer));
        else; blocks = floor(Frames/(blocksize+buffer));
        end
        
        tst = floor(holdout*blocks); 
        train = ceil((1-holdout)*blocks); %use this number of blocks as training data
        
        t = 1;
        blockframes(1,[1 2]) = [t t+blocksize];
        for i = 2:blocks
            blockframes(i,[1 2]) = blockframes(i-1,[1 2])+buffer+blocksize;
        end
        
        %randomly asign  blocks to train (1) or test (0)

        trtest = zeros (1, blocks); trtest(1:train) = 1; trtest = trtest(randperm(length(trtest))); 
        intrain = [];        intest = [];
        
        for i = 1:numel(trtest)
            if trtest(i) == 1
                intrain = [intrain blockframes(i,1):blockframes(i,2)];
            elseif trtest(i) == 0
                intest = [intest blockframes(i,1):blockframes(i,2)];
            end
        end
        
        %now performa classification
        if balanced == 0
                    % perform classification with logistic regression
                    obj = fitclinear(double(AB(:,intrain))', ab(intrain), 'learner', 'logistic');
                    labelspre = predict(obj,double(AB(:,intest)), 'ObservationsIn','columns');
                    
                    % perform classification with a linear SVM
                    obj2 = fitclinear(double(AB(:,intrain))', ab(intrain), 'learner', 'svm');
                    labelspre2 = predict(obj2,double(AB(:,intest)), 'ObservationsIn','columns');
                    
                    linear_performance(it, 1) = mean(labelspre==ab(intest)');
                    linear_performance(it, 2) = mean(labelspre2==ab(intest)'); 
                    
        elseif balanced == 1
                    % perform classification with logistic regression
                    obj = fitclinear(double(balanced_AB(:,intrain))', balanced_ab(intrain), 'learner', 'logistic');
                    labelspre = predict(obj,double(balanced_AB(:,intest)), 'ObservationsIn','columns');
                    
                    % perform classification with a linear SVM
                    obj2 = fitclinear(double(balanced_AB(:,intrain))', balanced_ab(intrain), 'learner', 'svm');
                    labelspre2 = predict(obj2,double(balanced_AB(:,intest)), 'ObservationsIn','columns');
                    
                    linear_performance(it, 1) = mean(labelspre==balanced_ab(intest)');
                    linear_performance(it, 2) = mean(labelspre2==balanced_ab(intest)'); 
                    Beta_tmp(1,it,:) = obj.Beta;
                    Beta_tmp(2,it,:) = obj2.Beta;
        end
            
end
       
%now average performance for Logistic regression and SVM
performance(1) = mean(linear_performance(:,1),'omitnan'); %mean performance LR
performance(2) = mean(linear_performance(:,2),'omitnan'); %mean performance SVM

Beta(1,:) = squeeze(mean(Beta_tmp(1,:,:),2)); %mean linear coefficients LR
Beta(2,:) = squeeze(mean(Beta_tmp(2,:,:),2)); %mean linear coefficients SVM
end
