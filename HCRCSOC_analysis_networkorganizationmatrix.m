


%Socialx4 analysis
HCRC = [2 3 4 5 6 8 14 16]
HCHC = [10 11 12 13 15 17 18 19]

mice = [HCRC HCHC]




%Sanity check
frms_allmice = 6000 %frames prior to initial contact
frms_mouse17 = 4000
        %note mouse 17 has only 4260 frames between end of social with
        %mouse 3 and beginning of social with mouse 4
frmsb = 0 %frames after social ends


%%
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
    
    
    activity(i,1) = mean(mean(inscopix{i}(:,tmp>=2&tmp<=5)));
    activity(i,2) = mean(mean(inscopix{i}(:,tmp>=10)));
    
    activity(i,3) = mean(mean(inscopix{i}(:,tmp>=2&tmp<=3)));
    activity(i,4) = mean(mean(inscopix{i}(:,tmp>=12&tmp<=13)));
    
    activity(i,5) = mean(mean(inscopix{i}(:,tmp>=4&tmp<=5)));
    activity(i,6) = mean(mean(inscopix{i}(:,tmp>=14&tmp<=15)));
    
end

mean(activity([mice],:))
[n p ] = ttest(activity([mice],1), activity([mice],2))
[n p ] = ttest(activity([mice],3), activity([mice],4))
[n p ] = ttest(activity([mice],5), activity([mice],6))

%% activity vectors
mice = [HCRC]
tmp = []; mean_AV = []; Mean_corr_AV = []
for i = mice
    tmp.a1 = inscopix{i}(:,SOCIAL{i} == 2);
    tmp.b1 = inscopix{i}(:,SOCIAL{i} == 12);

    tmp.a2 = inscopix{i}(:,SOCIAL{i} == 3);
    tmp.b2 = inscopix{i}(:,SOCIAL{i} == 13);
    
    tmp.a3 = inscopix{i}(:,SOCIAL{i} == 4);
    tmp.b3 = inscopix{i}(:,SOCIAL{i} == 14);

    tmp.a4 = inscopix{i}(:,SOCIAL{i} == 5);
    tmp.b4 = inscopix{i}(:,SOCIAL{i} == 15);  
    
    mean_AV{i} = [mean(tmp.a1')' mean(tmp.a2')' mean(tmp.a3')' mean(tmp.a4')' mean(tmp.b1')' mean(tmp.b2')' mean(tmp.b3')' mean(tmp.b4')' ];
    Mean_corr_AV{i} = (corr(zscore(mean_AV{i}')','rows','pairwise'));
end

k = 1
clear tmp
for i = mice
    tmp(:,:,k) = Mean_corr_AV{i};
    k = k+1;
end
    MCA = mean(tmp,3); for i = 1:8; MCA(i,i) = nan; end;
    figure; imagesc(MCA); colorbar; caxis([-0.4, 0.4])
    
    for i = 1:8; tmp(i,i,:) = nan; end
    HCHCtmp = tmp;
    clear tmp
%%    
    

mice = [HCRC]
tmp = []; mean_AV = []; Mean_corr_AV = []
for i = mice
    tmp.a1 = inscopix{i}(:,SOCIAL{i} == 2);
    tmp.b1 = inscopix{i}(:,SOCIAL{i} == 12);

    tmp.a2 = inscopix{i}(:,SOCIAL{i} == 3);
    tmp.b2 = inscopix{i}(:,SOCIAL{i} == 13);
    
    tmp.a3 = inscopix{i}(:,SOCIAL{i} == 4);
    tmp.b3 = inscopix{i}(:,SOCIAL{i} == 14);

    tmp.a4 = inscopix{i}(:,SOCIAL{i} == 5);
    tmp.b4 = inscopix{i}(:,SOCIAL{i} == 15);  
    
    mean_AV{i} = [mean(tmp.a1')' mean(tmp.a2')' mean(tmp.a3')' mean(tmp.a4')' mean(tmp.b1')' mean(tmp.b2')' mean(tmp.b3')' mean(tmp.b4')' ];
    Mean_corr_AV{i} = (corr(zscore(mean_AV{i}')','rows','pairwise'));
end

k = 1
clear tmp
for i = mice
    tmp(:,:,k) = Mean_corr_AV{i};
    k = k+1;
end
    MCA = mean(tmp,3); for i = 1:8; MCA(i,i) = nan; end;
    figure; imagesc(MCA); colorbar; caxis([-0.4, 0.4])
    
    %%
    
     for i = 1:8; tmp(i,i,:) = nan; end
    HCRCtmp = tmp;
    clear tmp  
    
    for i = 1:8; tmpb = HCRCtmp(:,:,i); HCRCepV(:,i) = tmpb(:); end
    for i = 1:8; tmpb = HCHCtmp(:,:,i); HCHCepV(:,i) = tmpb(:); end
    
    epVCorr = corr([HCRCepV HCHCepV],'rows','pairwise'); for i = 1:16; epVCorr(i,i) = nan; end
   
    
    %histogram
    x = linspace(0,1,10)
    ep.hcrc = histcounts((epVCorr(1:8,1:8)), x, 'normalization','pdf');
    ep.hchc = histcounts((epVCorr(9:16,9:16)), x, 'normalization','pdf')    ;
    ep.hchcvhcrc = histcounts((epVCorr(1:8,9:16)), x, 'normalization','pdf') ;
    
    tmp1 = epVCorr(1:8,1:8);
    tmp2 = epVCorr(9:16,9:16);
    tmp3 = epVCorr(1:8,9:16);
 [H,P] =    kstest2(tmp1(:),tmp2(:))
 [H,P] =    kstest2(tmp1(:),tmp3(:))
 [H,P] =    kstest2(tmp2(:),tmp3(:))
    
    figure; 
    plot(x(2:end),ep.hcrc)
    hold on
    plot(x(2:end),ep.hchc)
    plot(x(2:end),ep.hchcvhcrc)
    
    
    