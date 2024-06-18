
%%individual neuron ensembles

%Socialx4 analysis
HCRC = [2 3 4 5 6 8 14 16]
HCHC = [10 11 12 13 15 17 18 19]

mice = [HCRC HCHC]





activity = []
for i = [mice ]
    if i == 17; frms = frms_mouse17; else; frms = frms_allmice; end
    tmp = zeros(size(inscopix{i},2),1)';
    
    
    tmp(Social_Times{i}.a(1,1)-frms:Social_Times{i}.a(end,2)+frmsb) = 12;
    for n = 1:size(Social_Times{i}.a,1)
        tmp(Social_Times{i}.a(n,1):Social_Times{i}.a(n,2)) = 2;
    end
    
    tmp(Social_Times{i}.b(1,1)-frms:Social_Times{i}.b(end,2)+frmsb) = 13;
    for n = 1:size(Social_Times{i}.b,1)
        tmp(Social_Times{i}.b(n,1):Social_Times{i}.b(n,2)) = 3;
    end
    
    
    tmp(Social_Times{i}.c(1,1)-frms:Social_Times{i}.c(end,2)+frmsb) = 14;
    for n = 1:size(Social_Times{i}.c,1)
        tmp(Social_Times{i}.c(n,1):Social_Times{i}.c(n,2)) = 4;
    end
    
    tmp(Social_Times{i}.d(1,1)-frms:Social_Times{i}.d(end,2)+frmsb) = 15;
    for n = 1:size(Social_Times{i}.d,1)
        tmp(Social_Times{i}.d(n,1):Social_Times{i}.d(n,2)) = 5;
    end
    
 
   
    tmp(size(inscopix{i},2)+1:end) = [];
    SOCIAL{i} = tmp;
    
    
    activity(i,1) = mean(mean(inscopix{i}(:,tmp>=2&tmp<=5))); %all social bouts
    activity(i,2) = mean(mean(inscopix{i}(:,tmp>=10))); %not social (during time around scored bouts and preceding)
    
    activity(i,3) = mean(mean(inscopix{i}(:,tmp>=2&tmp<=3))); %all social bouts in first 2 encounters
    activity(i,4) = mean(mean(inscopix{i}(:,tmp>=12&tmp<=13))); %not social plus preceding frames
    
    activity(i,5) = mean(mean(inscopix{i}(:,tmp>=4&tmp<=5))); %all social bouts in second 2 encounters
    activity(i,6) = mean(mean(inscopix{i}(:,tmp>=14&tmp<=15))); %not social in second two encounters
    
end

%% now calculate activity on a neuron by neuron basis during social and perisocial intervals

k = 1
clear Neuron_Activity
clear act
for i = [HCRC]
    for n = 1:size(inscopix{i},1)
    Neuron_Activity(k,1) = mean(inscopix{i}(n,SOCIAL{i} == 2)); %social bouts, mouse 1
    Neuron_Activity(k,2) = mean(inscopix{i}(n,SOCIAL{i} == 3)); %social bouts, mouse 2
    Neuron_Activity(k,3) = mean(inscopix{i}(n,SOCIAL{i} == 4)); %social bouts, mouse 3
    Neuron_Activity(k,4) = mean(inscopix{i}(n,SOCIAL{i} == 5)); %social bouts, mouse 4
    Neuron_Activity(k,5) = mean(inscopix{i}(n,SOCIAL{i} == 12));%home cage exploration, mouse 1
    Neuron_Activity(k,6) = mean(inscopix{i}(n,SOCIAL{i} == 13));%home cage exploration, mouse 2
    Neuron_Activity(k,7) = mean(inscopix{i}(n,SOCIAL{i} == 14));%home cage exploration, mouse 3
    Neuron_Activity(k,8) = mean(inscopix{i}(n,SOCIAL{i} == 15));%home cage exploration, mouse 4
    
    Neuron_Activity(k,9) = mean(inscopix{i}(n,SOCIAL{i} >= 2&SOCIAL{i} <=5));%All social bouts
    Neuron_Activity(k,10)= mean(inscopix{i}(n,SOCIAL{i} >= 12&SOCIAL{i} <=15));%all exploration  
    Neuron_Activity(k,11)= i; %mouse index
    k = k+1;
    end
end

%calculate means by mouse
for i = [HCRC]
    tmp = find(Neuron_Activity(:,11)==i);
    tmp1 = mean(Neuron_Activity(tmp,:));
    mice_activity(i,:) = tmp1;
end
mean(mice_activity(HCRC,:))
std(mice_activity(HCRC,:)/(numel(HCRC)^0.5))


%plot mean activity first bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,1), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,5), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])

%plot mean activity second mouse bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,2), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,6), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])


%plot mean activity 3rd mouse bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,3), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,7), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])

%plot mean activity 4th mouse bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,4), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,8), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])


%plot mean activity all bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,9), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,10), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])

mean(Neuron_Activity(:,9))
mean(Neuron_Activity(:,10))
[n p] = kstest2(Neuron_Activity(:,1), Neuron_Activity(:,5))
[n p] = kstest2(Neuron_Activity(:,2), Neuron_Activity(:,6))
[n p] = kstest2(Neuron_Activity(:,3), Neuron_Activity(:,7))
[n p] = kstest2(Neuron_Activity(:,4), Neuron_Activity(:,8))
[n p] = kstest2(Neuron_Activity(:,9), Neuron_Activity(:,10))

[n p] = ttest2(Neuron_Activity(:,1), Neuron_Activity(:,5))
[n p] = ttest2(Neuron_Activity(:,2), Neuron_Activity(:,6))
[n p] = ttest2(Neuron_Activity(:,3), Neuron_Activity(:,7))
[n p] = ttest2(Neuron_Activity(:,4), Neuron_Activity(:,8))
[n p] = ttest2(Neuron_Activity(:,9), Neuron_Activity(:,10))

%calculate proportion of neurons with act > thresh
thresh = 0.075, thresh2 = 0
proAct = sum(Neuron_Activity > thresh)/size(Neuron_Activity,1);
%calculate across mice
k = 1, clear tmp, clear tmp1 mice_threshold mice_threshold2
for i = [HCRC]
    tmp = find(Neuron_Activity(:,11)==i);
    tmp1 = mean(Neuron_Activity(tmp,:)>thresh);
    tmp2 = mean(Neuron_Activity(tmp,:)==thresh2);
    mice_threshold(k,:) = tmp1;
    mice_threshold2(k,:) = tmp2;
    k = k+1;
end

%%
k = 1
clear Neuron_Activity
clear act
for i = [HCHC]
    for n = 1:size(inscopix{i},1)
    Neuron_Activity(k,1) = mean(inscopix{i}(n,SOCIAL{i} == 2)); %social bouts, mouse 1
    Neuron_Activity(k,2) = mean(inscopix{i}(n,SOCIAL{i} == 3)); %social bouts, mouse 2
    Neuron_Activity(k,3) = mean(inscopix{i}(n,SOCIAL{i} == 4)); %social bouts, mouse 3
    Neuron_Activity(k,4) = mean(inscopix{i}(n,SOCIAL{i} == 5)); %social bouts, mouse 4
    Neuron_Activity(k,5) = mean(inscopix{i}(n,SOCIAL{i} == 12));%home cage exploration, mouse 1
    Neuron_Activity(k,6) = mean(inscopix{i}(n,SOCIAL{i} == 13));%home cage exploration, mouse 2
    Neuron_Activity(k,7) = mean(inscopix{i}(n,SOCIAL{i} == 14));%home cage exploration, mouse 3
    Neuron_Activity(k,8) = mean(inscopix{i}(n,SOCIAL{i} == 15));%home cage exploration, mouse 4
    
    Neuron_Activity(k,9) = mean(inscopix{i}(n,SOCIAL{i} >= 2&SOCIAL{i} <=5));%All social bouts
    Neuron_Activity(k,10)= mean(inscopix{i}(n,SOCIAL{i} >= 12&SOCIAL{i} <=15));%all exploration  
    Neuron_Activity(k,11)= i; %mouse index
    k = k+1;
    end
end

%calculate means by mouse
for i = [HCHC]
    tmp = find(Neuron_Activity(:,11)==i);
    tmp1 = mean(Neuron_Activity(tmp,:));
    mice_activity(i,:) = tmp1;
end
mean(mice_activity(HCHC,:))
std(mice_activity(HCHC,:)/(numel(HCHC)^0.5))
    
%plot mean all bouts
x = linspace(0,0.125, 100)
act.soc1 = histcounts (Neuron_Activity(:,9), x, 'normalization','cdf')
act.nonsoc1 = histcounts (Neuron_Activity(:,10), x, 'normalization','cdf')

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])


    
%plot mean activity first bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,1), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,5), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])

%plot mean activity second mouse bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,2), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,6), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])


%plot mean activity 3rd mouse bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,3), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,7), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])

%plot mean activity 4th mouse bouts
x = linspace(0,0.125, 50);
act.soc1 = histcounts (Neuron_Activity(:,4), x, 'normalization','cdf'); %social
act.nonsoc1 = histcounts (Neuron_Activity(:,8), x, 'normalization','cdf'); %nonsocial

figure; plot(x(2:end), act.soc1); hold on; plot(x(2:end), act.nonsoc1)
axis([0 0.125 0 1 ])



mean(Neuron_Activity(:,9))
mean(Neuron_Activity(:,10))
[n p] = kstest2(Neuron_Activity(:,1), Neuron_Activity(:,5))
[n p] = kstest2(Neuron_Activity(:,2), Neuron_Activity(:,6))
[n p] = kstest2(Neuron_Activity(:,3), Neuron_Activity(:,7))
[n p] = kstest2(Neuron_Activity(:,4), Neuron_Activity(:,8))
[n p] = kstest2(Neuron_Activity(:,9), Neuron_Activity(:,10))

[n p] = ttest2(Neuron_Activity(:,1), Neuron_Activity(:,5))
[n p] = ttest2(Neuron_Activity(:,2), Neuron_Activity(:,6))
[n p] = ttest2(Neuron_Activity(:,3), Neuron_Activity(:,7))
[n p] = ttest2(Neuron_Activity(:,4), Neuron_Activity(:,8))
[n p] = ttest2(Neuron_Activity(:,9), Neuron_Activity(:,10))

%calculate proportion of neurons with act > thresh
thresh = 0.075, thresh2 = 0
proAct = sum(Neuron_Activity > thresh)/size(Neuron_Activity,1);
%calculate across mice
k = 1, clear tmp, clear tmp1 mice_threshold mice_threshold2
for i = [HCHC]
    tmp = find(Neuron_Activity(:,11)==i);
    tmp1 = mean(Neuron_Activity(tmp,:)>thresh);
    tmp2 = mean(Neuron_Activity(tmp,:)==thresh2);
    mice_threshold(k,:) = tmp1;
    mice_threshold2(k,:) = tmp2;
    k = k+1;
end