%Fraction Modulated


%individual neuron ensembles

%Socialx4 analysis
HCRC = [2 3 4 5 6 8 14 16]
HCHC = [10 11 12 13 15 17 18 19]

mice = [HCRC HCHC]




%% activity vector based matrix
mice = [HCHC]
tmp = []; mean_AV.HCHC = []; Mean_corr_AV.HCHC = []; Mean_corr_AVpw.HCHC = [];
for i = mice
    raster = inscopix;
    tmp.a1 = raster{i}(:,SOCIAL{i} == 2);
    tmp.b1 = raster{i}(:,SOCIAL{i} == 12);

    tmp.a2 = raster{i}(:,SOCIAL{i} == 3);
    tmp.b2 = raster{i}(:,SOCIAL{i} == 13);
    
    tmp.a3 = raster{i}(:,SOCIAL{i} == 4);
    tmp.b3 = raster{i}(:,SOCIAL{i} == 14);

    tmp.a4 = raster{i}(:,SOCIAL{i} == 5);
    tmp.b4 = raster{i}(:,SOCIAL{i} == 15);  
    
    tmp.ab = raster{i}(:,(SOCIAL{i} == 2) | SOCIAL{i} == 3); %social
    tmp.cd = raster{i}(:,(SOCIAL{i} == 4) | SOCIAL{i} == 5); %social
    tmp.abcd = raster{i}(:, SOCIAL{i} == 2 |SOCIAL{i} == 3 | SOCIAL{i} == 4 |SOCIAL{i} == 5); %social
    
    tmp.abns = raster{i}(:,(SOCIAL{i} == 12) | SOCIAL{i} == 13); %nonsocial
    tmp.cdns = raster{i}(:,(SOCIAL{i} == 14) | SOCIAL{i} == 15); %nonsocial
    tmp.abcdns = raster{i}(:, SOCIAL{i} == 12 |SOCIAL{i} == 13 | SOCIAL{i} == 14 |SOCIAL{i} == 15); %nonsocial    
       
    
   mean_AV.HCHC{i} = [mean(tmp.a1')' mean(tmp.a2')' mean(tmp.a3')' mean(tmp.a4')' mean(tmp.b1')' mean(tmp.b2')' mean(tmp.b3')' mean(tmp.b4')' mean(tmp.ab')' mean(tmp.cd')' mean(tmp.abcd')' mean(tmp.abns')' mean(tmp.cdns')' mean(tmp.abcdns')'  ];
   Mean_corr_AV.HCHC{i} = (corr((mean_AV.HCHC{i}')','rows','pairwise'));
   tmp2 = find(mean_AV.HCHC{i} == 0); 
   tmp3 = mean_AV.HCHC{i};
   tmp3(tmp2) = nan;
   Mean_corr_AVpw.HCHC{i} = (corr((tmp3')','rows','pairwise'));   
   
    %look at cells that fire durign both contexts
   tmp2 = find(sum(mean_AV.HCHC{i}(:,[1:2 5:6])') == 0 | sum(mean_AV.HCHC{i}(:,[3:4 7:8])') == 0); 
   tmp3 = mean_AV.HCHC{i};
   tmp3(tmp2,:) = nan;
   Mean_corr_AVbothcontexts.HCHC{i} = (corr((tmp3')','rows','pairwise'));     
end

k = 1
clear tmp tmp2 tmp3
for i = mice
    tmp(:,:,k) = Mean_corr_AV.HCHC{i};
    tmp2(:,:,k)= Mean_corr_AVpw.HCHC{i}
    tmp3(:,:,k)= Mean_corr_AVbothcontexts.HCHC{i}    
    k = k+1;
end
    MCA.HCHC = mean(tmp,3); for i = 1:8; MCA.HCHC(i,i) = nan; end;
    figure; imagesc(MCA.HCHC(1:8,1:8)); colorbar; caxis([0, 0.6])
    for i = 1:8; tmp(i,i,:) = nan; end
    
    MCA2.HCHC = mean(tmp2,3); for i = 1:8; MCA2.HCHC(i,i) = nan; end;
    figure; imagesc(MCA2.HCHC(1:8,1:8)); colorbar; caxis([0, 0.6])    
    for i = 1:8; tmp2(i,i,:) = nan; end
    
    MCA3.HCHC = mean(tmp3,3); for i = 1:8; MCA3.HCHC(i,i) = nan; end;
    figure; imagesc(MCA3.HCHC(1:8,1:8)); colorbar; caxis([0, 0.6])    
    for i = 1:8; tmp3(i,i,:) = nan; end    
    
    HCHCtmp = tmp;
    HCHC2tmp = tmp2
    HCHC3tmp = tmp3
    clear tmp
%%    
    

mice = [HCRC]
tmp = []; mean_AV.HCRC = []; Mean_corr_AV.HCRC = []; Mean_corr_AVpw = [];
for i = mice
    raster = inscopix;
    tmp.a1 = raster{i}(:,SOCIAL{i} == 2);
    tmp.b1 = raster{i}(:,SOCIAL{i} == 12);

    tmp.a2 = raster{i}(:,SOCIAL{i} == 3);
    tmp.b2 = raster{i}(:,SOCIAL{i} == 13);
    
    tmp.a3 = raster{i}(:,SOCIAL{i} == 4);
    tmp.b3 = raster{i}(:,SOCIAL{i} == 14);

    tmp.a4 = raster{i}(:,SOCIAL{i} == 5);
    tmp.b4 = raster{i}(:,SOCIAL{i} == 15);  
    
    tmp.ab = raster{i}(:,(SOCIAL{i} == 2) | SOCIAL{i} == 3); %social
    tmp.cd = raster{i}(:,(SOCIAL{i} == 4) | SOCIAL{i} == 5); %social
    tmp.abcd = raster{i}(:, SOCIAL{i} == 2 |SOCIAL{i} == 3 | SOCIAL{i} == 4 |SOCIAL{i} == 5); %social
    
    tmp.abns = raster{i}(:,(SOCIAL{i} == 12) | SOCIAL{i} == 13); %nonsocial
    tmp.cdns = raster{i}(:,(SOCIAL{i} == 14) | SOCIAL{i} == 15); %nonsocial
    tmp.abcdns = raster{i}(:, SOCIAL{i} == 12 |SOCIAL{i} == 13 | SOCIAL{i} == 14 |SOCIAL{i} == 15); %nonsocial           
    
    
   mean_AV.HCRC{i} = [mean(tmp.a1')' mean(tmp.a2')' mean(tmp.a3')' mean(tmp.a4')' mean(tmp.b1')' mean(tmp.b2')' mean(tmp.b3')' mean(tmp.b4')' mean(tmp.ab')' mean(tmp.cd')' mean(tmp.abcd')' mean(tmp.abns')' mean(tmp.cdns')' mean(tmp.abcdns')'  ];
   Mean_corr_AV.HCRC{i} = (corr((mean_AV.HCRC{i}')','rows','pairwise')); %zscore?
   tmp2 = find(mean_AV.HCRC{i} == 0); 
   tmp3 = mean_AV.HCRC{i};
   tmp3(tmp2) = nan;
   Mean_corr_AVpw.HCRC{i} = (corr((tmp3')','rows','pairwise'));  
    %look at cells that fire durign both contexts
   tmp2 = find(sum(mean_AV.HCRC{i}(:,[1:2 5:6])') == 0 | sum(mean_AV.HCRC{i}(:,[3:4 7:8])') == 0); 
   tmp3 = mean_AV.HCRC{i};
   tmp3(tmp2,:) = nan;
   Mean_corr_AVbothcontexts.HCRC{i} = (corr((tmp3')','rows','pairwise'));  
end

k = 1
clear tmp tmp2 tmp3
for i = mice
    tmp(:,:,k) = Mean_corr_AV.HCRC{i};
    tmp2(:,:,k)= Mean_corr_AVpw.HCRC{i}  
    tmp3(:,:,k)= Mean_corr_AVbothcontexts.HCRC{i}    
    k = k+1;
end
    MCA.HCRC = mean(tmp,3); for i = 1:8; MCA.HCRC(i,i) = nan; end;
    figure; imagesc(MCA.HCRC(1:8,1:8)); colorbar; caxis([0, 0.6])
    for i = 1:8; tmp(i,i,:) = nan; end  
    
    MCA2.HCRC = mean(tmp2,3); for i = 1:8; MCA2.HCRC(i,i) = nan; end;
    figure; imagesc(MCA2.HCRC(1:8,1:8)); colorbar; caxis([0, 0.6])    
    for i = 1:8; tmp2(i,i,:) = nan; end    

    MCA3.HCRC = mean(tmp3,3); for i = 1:8; MCA3.HCRC(i,i) = nan; end;
    figure; imagesc(MCA3.HCRC(1:8,1:8)); colorbar; caxis([0, 0.6])    
    for i = 1:8; tmp3(i,i,:) = nan; end  
    
        for i = 1:8; tmp(i,i,:) = nan; end
    HCRCtmp = tmp;
    HCRC2tmp = tmp2;
    HCRC3tmp = tmp3
    clear tmp







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

%% now calculate fraction of neurons whose activity increases or decreases significantly during social interaction for each interaction sssion
iterations = 1000
clear tmp1 tmp2 Cells_A Cells_B dist_A dist_B
for i = mice
    i
    tmp1.a = (SOCIAL{i} == 2); %social
    tmp2.a = (SOCIAL{i} == 12);%noninteracting

    tmp1.b = (SOCIAL{i} == 3); %social
    tmp2.b = (SOCIAL{i} == 13);%noninteracting 

    tmp1.c = (SOCIAL{i} == 4); %social
    tmp2.c = (SOCIAL{i} == 14);%noninteracting 
    
    tmp1.d = (SOCIAL{i} == 5); %social
    tmp2.d = (SOCIAL{i} == 15);%noninteracting     

    tmp1.ab = (SOCIAL{i} == 2 |SOCIAL{i} == 3); %social
    tmp2.ab = (SOCIAL{i} == 12 |SOCIAL{i} == 13);%noninteracting     

    tmp1.cd = (SOCIAL{i} == 4 |SOCIAL{i} == 5); %social
    tmp2.cd = (SOCIAL{i} == 14 |SOCIAL{i} == 15);%noninteracting         

    tmp1.abcd = (SOCIAL{i} == 2 |SOCIAL{i} == 3 | SOCIAL{i} == 4 |SOCIAL{i} == 5); %social
    tmp2.abcd = (SOCIAL{i} == 12 |SOCIAL{i} == 13 | SOCIAL{i} == 14 |SOCIAL{i} == 15);%noninteracting     
    
[Cells_A{i}.a, Cells_B{i}.a, dist_A{i}.a, dist_B{i}.a] = ActivityModulation(inscopix{i}, tmp1.a, tmp2.a, iterations);
[Cells_A{i}.b, Cells_B{i}.b, dist_A{i}.b, dist_B{i}.b] = ActivityModulation(inscopix{i}, tmp1.b, tmp2.b, iterations);
[Cells_A{i}.c, Cells_B{i}.c, dist_A{i}.c, dist_B{i}.c] = ActivityModulation(inscopix{i}, tmp1.c, tmp2.c, iterations);
[Cells_A{i}.d, Cells_B{i}.d, dist_A{i}.d, dist_B{i}.d] = ActivityModulation(inscopix{i}, tmp1.d, tmp2.d, iterations);
   
[Cells_A{i}.ab, Cells_B{i}.ab, dist_A{i}.ab, dist_B{i}.ab] = ActivityModulation(inscopix{i}, tmp1.ab, tmp2.ab, iterations);
[Cells_A{i}.cd, Cells_B{i}.cd, dist_A{i}.cd, dist_B{i}.cd] = ActivityModulation(inscopix{i}, tmp1.cd, tmp2.cd, iterations);
[Cells_A{i}.abcd, Cells_B{i}.abcd, dist_A{i}.abcd, dist_B{i}.abcd] = ActivityModulation(inscopix{i}, tmp1.abcd, tmp2.abcd, iterations);
end
%plot_NvB_Distribution(Cells_A{2}.a, Cells_B{2}.a, dist_A{2}.a, dist_B{2}.a, raster, C, Times_A, Times_B)
%set(gca,'FontSize',14)

%%

%analyze on a per neuron basis
clear tmpA tmpB 
soc_mod_HCRC.abcd = []; nonsoc_mod_HCRC.abcd = [];
soc_mod_HCRC.ab = []; nonsoc_mod_HCRC.ab = [];
soc_mod_HCRC.cd = []; nonsoc_mod_HCRC.cd = [];

soc_mod_HCHC.abcd = []; nonsoc_mod_HCHC.abcd = [];
soc_mod_HCHC.ab = []; nonsoc_mod_HCHC.ab = [];
soc_mod_HCHC.cd = []; nonsoc_mod_HCHC.cd = [];

soc_mod_HCHC.a = []; nonsoc_mod_HCHC.a = [];
soc_mod_HCHC.c = []; nonsoc_mod_HCHC.c = [];
soc_mod_HCHC.b = []; nonsoc_mod_HCHC.b = [];
soc_mod_HCHC.d = []; nonsoc_mod_HCHC.d = [];

soc_mod_HCRC.a = []; nonsoc_mod_HCRC.a = [];
soc_mod_HCRC.c = []; nonsoc_mod_HCRC.c = [];
soc_mod_HCRC.b = []; nonsoc_mod_HCRC.b = [];
soc_mod_HCRC.d = []; nonsoc_mod_HCRC.d = [];


%All Mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.abcd = [soc_mod_HCRC.abcd ; [Cells_A{i}.abcd(:,4) repmat(k, numel(Cells_A{i}.abcd(:,4)), 1)]];
    nonsoc_mod_HCRC.abcd  = [nonsoc_mod_HCRC.abcd ; [Cells_B{i}.abcd(:,4) repmat(k, numel(Cells_B{i}.abcd(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC];
    soc_mod_HCHC.abcd  = [soc_mod_HCHC.abcd; [Cells_A{i}.abcd(:,4) repmat(k, numel(Cells_A{i}.abcd(:,4)), 1)]];
    nonsoc_mod_HCHC.abcd = [nonsoc_mod_HCHC.abcd; [Cells_B{i}.abcd(:,4) repmat(k, numel(Cells_B{i}.abcd(:,4)), 1)]]; 
    k = k+1;
end

%First Two mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.ab = [soc_mod_HCRC.ab ; [Cells_A{i}.ab(:,4) repmat(k, numel(Cells_A{i}.ab(:,4)), 1)]];
    nonsoc_mod_HCRC.ab = [nonsoc_mod_HCRC.ab; [Cells_B{i}.ab(:,4) repmat(k, numel(Cells_B{i}.ab(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.ab  = [soc_mod_HCHC.ab; [Cells_A{i}.ab(:,4) repmat(k, numel(Cells_A{i}.ab(:,4)), 1)]];
    nonsoc_mod_HCHC.ab = [nonsoc_mod_HCHC.ab; [Cells_B{i}.ab(:,4) repmat(k, numel(Cells_B{i}.ab(:,4)), 1)]]; 
    k = k+1;
end

%Last Two mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.cd = [soc_mod_HCRC.cd ; [Cells_A{i}.cd(:,4) repmat(k, numel(Cells_A{i}.cd(:,4)), 1)]];
    nonsoc_mod_HCRC.cd  = [nonsoc_mod_HCRC.cd ; [Cells_B{i}.cd(:,4) repmat(k, numel(Cells_B{i}.cd(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.cd  = [soc_mod_HCHC.cd; [Cells_A{i}.cd(:,4) repmat(k, numel(Cells_A{i}.cd(:,4)), 1)]];
    nonsoc_mod_HCHC.cd = [nonsoc_mod_HCHC.cd; [Cells_B{i}.cd(:,4) repmat(k, numel(Cells_B{i}.cd(:,4)), 1)]];
    k = k+1;
end


%individual mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.a = [soc_mod_HCRC.a ; [Cells_A{i}.a(:,4) repmat(k, numel(Cells_A{i}.a(:,4)), 1)]];
    nonsoc_mod_HCRC.a  = [nonsoc_mod_HCRC.a ; [Cells_B{i}.a(:,4) repmat(k, numel(Cells_B{i}.a(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.a  = [soc_mod_HCHC.a; [Cells_A{i}.a(:,4) repmat(k, numel(Cells_A{i}.a(:,4)), 1)]];
    nonsoc_mod_HCHC.a= [nonsoc_mod_HCHC.a; [Cells_B{i}.a(:,4) repmat(k, numel(Cells_B{i}.a(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCRC]; 
    soc_mod_HCRC.b = [soc_mod_HCRC.b ; [Cells_A{i}.b(:,4) repmat(k, numel(Cells_A{i}.b(:,4)), 1)]];
    nonsoc_mod_HCRC.b  = [nonsoc_mod_HCRC.b ; [Cells_B{i}.b(:,4) repmat(k, numel(Cells_B{i}.b(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.b  = [soc_mod_HCHC.b; [Cells_A{i}.b(:,4) repmat(k, numel(Cells_A{i}.b(:,4)), 1)] ];
    nonsoc_mod_HCHC.b = [nonsoc_mod_HCHC.b; [Cells_B{i}.b(:,4) repmat(k, numel(Cells_B{i}.b(:,4)), 1)]]; 
    k = k+1;
end


k = 1
for i = [HCRC]; 
    soc_mod_HCRC.c = [soc_mod_HCRC.c ; [Cells_A{i}.c(:,4) repmat(k, numel(Cells_A{i}.c(:,4)), 1)]];
    nonsoc_mod_HCRC.c  = [nonsoc_mod_HCRC.c ; [Cells_B{i}.c(:,4) repmat(k, numel(Cells_B{i}.c(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.c  = [soc_mod_HCHC.c; [Cells_A{i}.c(:,4) repmat(k, numel(Cells_A{i}.c(:,4)), 1)]];
    nonsoc_mod_HCHC.c = [nonsoc_mod_HCHC.c; [Cells_B{i}.c(:,4) repmat(k, numel(Cells_B{i}.c(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCRC]; 
    soc_mod_HCRC.d = [soc_mod_HCRC.d ; [Cells_A{i}.d(:,4) repmat(k, numel(Cells_A{i}.d(:,4)), 1)] ];
    nonsoc_mod_HCRC.d  = [nonsoc_mod_HCRC.d ; [Cells_B{i}.d(:,4) repmat(k, numel(Cells_B{i}.d(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.d  = [soc_mod_HCHC.d; [Cells_A{i}.d(:,4) repmat(k, numel(Cells_A{i}.d(:,4)), 1)]];
    nonsoc_mod_HCHC.d = [nonsoc_mod_HCHC.d; [Cells_B{i}.d(:,4) repmat(k, numel(Cells_B{i}.d(:,4)), 1)]]; 
    k = k+1
end

%%
xx = linspace(0,1,10)
space = [0 0.05]
figure;imagesc(imgaussfilt(histcounts2 (soc_mod_HCHC.ab(:,1), soc_mod_HCHC.cd(:,1),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (nonsoc_mod_HCHC.ab(:,1), nonsoc_mod_HCHC.cd(:,1),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
corr(soc_mod_HCHC.ab(:,1), soc_mod_HCHC.cd(:,1))
corr(nonsoc_mod_HCHC.ab(:,1), nonsoc_mod_HCHC.cd(:,1))

corr(soc_mod_HCHC.ab(:,1), nonsoc_mod_HCHC.cd(:,1))
corr(nonsoc_mod_HCHC.ab(:,1), soc_mod_HCHC.cd(:,1))


figure;imagesc(imgaussfilt(histcounts2 (soc_mod_HCRC.ab(:,1), soc_mod_HCRC.cd(:,1),xx,xx,'normalization','probability'),.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (nonsoc_mod_HCRC.ab(:,1), nonsoc_mod_HCRC.cd(:,1),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
corr(soc_mod_HCRC.ab(:,1), soc_mod_HCRC.cd(:,1))
corr(nonsoc_mod_HCRC.ab(:,1), nonsoc_mod_HCRC.cd(:,1))
corr(soc_mod_HCRC.ab(:,1), nonsoc_mod_HCRC.cd(:,1))
corr(nonsoc_mod_HCRC.ab(:,1), soc_mod_HCRC.cd(:,1))

figure; plot(xx(2:end), histcounts(soc_mod_HCRC.ab(:,1), xx, 'normalization','probability'));
hold on; plot(xx(2:end), histcounts(soc_mod_HCRC.cd(:,1), xx, 'normalization','probability'));

figure; plot(xx(2:end), histcounts(soc_mod_HCHC.ab(:,1), xx, 'normalization','probability'));
hold on; plot(xx(2:end), histcounts(soc_mod_HCHC.cd(:,1), xx, 'normalization','probability'));

figure; plot(xx(2:end), histcounts(soc_mod_HCHC.ab(:,1), xx, 'normalization','probability'));
hold on; plot(xx(2:end), histcounts(soc_mod_HCRC.ab(:,1), xx, 'normalization','probability'));

figure; plot(xx(2:end), histcounts(soc_mod_HCHC.cd(:,1), xx, 'normalization','probability'));
hold on; plot(xx(2:end), histcounts(soc_mod_HCRC.cd(:,1), xx, 'normalization','probability'));


figure; plot(xx(2:end), histcounts(soc_mod_HCHC.abcd(:,1), xx, 'normalization','probability'));
hold on; plot(xx(2:end), histcounts(soc_mod_HCRC.abcd(:,1), xx, 'normalization','probability'));



figure; plot(xx(2:end), histcounts(nonsoc_mod_HCHC.ab(:,1), xx, 'normalization','probability'));
hold on; plot(xx(2:end), histcounts(nonsoc_mod_HCHC.cd(:,1), xx, 'normalization','probability'));


%% compare epochs

corr(soc_mod_HCHC.ab(:,1), soc_mod_HCHC.cd(:,1))
corr(soc_mod_HCRC.ab(:,1), soc_mod_HCRC.cd(:,1))

corr(soc_mod_HCRC.a(:,1), soc_mod_HCRC.b(:,1))
corr(soc_mod_HCRC.b(:,1), soc_mod_HCRC.c(:,1))
corr(soc_mod_HCRC.c(:,1), soc_mod_HCRC.d(:,1))

corr(soc_mod_HCHC.a(:,1), soc_mod_HCHC.b(:,1))
corr(soc_mod_HCHC.b(:,1), soc_mod_HCHC.c(:,1))
corr(soc_mod_HCHC.c(:,1), soc_mod_HCHC.d(:,1))

corr(nonsoc_mod_HCRC.a(:,1), nonsoc_mod_HCRC.b(:,1))
corr(nonsoc_mod_HCRC.b(:,1), nonsoc_mod_HCRC.c(:,1))
corr(nonsoc_mod_HCRC.c(:,1), nonsoc_mod_HCRC.d(:,1))

corr(nonsoc_mod_HCHC.a(:,1), nonsoc_mod_HCHC.b(:,1))
corr(nonsoc_mod_HCHC.b(:,1), nonsoc_mod_HCHC.c(:,1))
corr(nonsoc_mod_HCHC.c(:,1), nonsoc_mod_HCHC.d(:,1))



HR = [soc_mod_HCRC.a(:,1) soc_mod_HCRC.b(:,1) soc_mod_HCRC.c(:,1), soc_mod_HCRC.d(:,1) nonsoc_mod_HCRC.a(:,1) nonsoc_mod_HCRC.b(:,1) nonsoc_mod_HCRC.c(:,1), nonsoc_mod_HCRC.d(:,1)];
HH = [soc_mod_HCHC.a(:,1) soc_mod_HCHC.b(:,1) soc_mod_HCHC.c(:,1), soc_mod_HCHC.d(:,1) nonsoc_mod_HCHC.a(:,1) nonsoc_mod_HCHC.b(:,1) nonsoc_mod_HCHC.c(:,1), nonsoc_mod_HCHC.d(:,1)];

tmp = (corr(HR)); for i = 1:8; tmp(i,i) = nan; end
figure; imagesc(tmp) 
caxis([-0.35 0.4])

tmp = (corr(HH)); for i = 1:8; tmp(i,i) = nan; end
figure; imagesc(tmp) 
caxis([-0.35 0.4])





%% now try analyzing only within epoch
%some videos were stopped before end of behavior
for i = mice
    Social_Times2{i} = Social_Times{i};
    while Social_Times2{i}.d(end,2)>size(inscopix{i},2)
        Social_Times2{i}.d(end,:) = [];
        i
    end
end
        


clear tmp1 tmp2 trim_raster
for i = mice
if i == 17; frms = frms_mouse17; else; frms = frms_allmice; end
    i
    clear tmp; clear tmpb;
    tmp = inscopix{i}(:,1:Social_Times2{i}.d(end,2)+frmsb); %trim off the extra scored behavior
    tmpb = SOCIAL{i}(1:Social_Times2{i}.d(end,2)+frmsb); 
    
    tmp1.a = (tmpb == 2); %social
    tmp2.a = (tmpb == 12);%noninteracting
        trim_raster{i}.a2 = tmp(:,tmpb ==2 | tmpb ==12);
        tmp1.a2 = tmp1.a(Social_Times2{i}.a(1,1)-frms:Social_Times2{i}.a(end,2)+frmsb); 
        tmp2.a2 = tmp2.a(Social_Times2{i}.a(1,1)-frms:Social_Times2{i}.a(end,2)+frmsb); 
        
    tmp1.b = (tmpb == 3); %social
    tmp2.b = (tmpb == 13);%noninteracting 
        trim_raster{i}.b2 = tmp(:,tmpb ==3 | tmpb ==13);
        tmp1.b2 = tmp1.b(Social_Times2{i}.b(1,1)-frms:Social_Times2{i}.b(end,2)+frmsb); 
        tmp2.b2 = tmp2.b(Social_Times2{i}.b(1,1)-frms:Social_Times2{i}.b(end,2)+frmsb); 

    tmp1.c = (tmpb == 4); %social
    tmp2.c = (tmpb  == 14);%noninteracting
        trim_raster{i}.c2 = tmp(:,tmpb ==4 | tmpb ==14);
        tmp1.c2 = tmp1.c(Social_Times2{i}.c(1,1)-frms:Social_Times2{i}.c(end,2)+frmsb); 
        tmp2.c2 = tmp2.c(Social_Times2{i}.c(1,1)-frms:Social_Times2{i}.c(end,2)+frmsb);     
    
    tmp1.d = (tmpb == 5);                                  %social
    tmp2.d = (tmpb == 15);                                   %noninteracting
        trim_raster{i}.d2 = tmp(:,tmpb ==5 | tmpb ==15); 
        tmp1.d2 = tmp1.d(Social_Times2{i}.d(1,1)-frms:Social_Times2{i}.d(end,2)+frmsb);  
        tmp2.d2 = tmp2.d(Social_Times2{i}.d(1,1)-frms:Social_Times2{i}.d(end,2)+frmsb) ; 

        
        
%grouped social ensembles        
    tmp1.ab = (tmpb == 2 | tmpb == 3); %social
    tmp2.ab = (tmpb == 12 | tmpb == 13);%noninteracting     
        trim_raster{i}.ab2 = tmp(:,tmpb ==2 | tmpb ==12 | tmpb == 3 | tmpb == 13);
        tmp1.ab2 = [tmp1.ab(Social_Times2{i}.a(1,1)-frms:Social_Times2{i}.a(end,2)+frmsb) tmp1.ab(Social_Times2{i}.b(1,1)-frms:Social_Times2{i}.b(end,2)+frmsb)]; 
        tmp2.ab2 = [tmp2.ab(Social_Times2{i}.a(1,1)-frms:Social_Times2{i}.a(end,2)+frmsb) tmp2.ab(Social_Times2{i}.b(1,1)-frms:Social_Times2{i}.b(end,2)+frmsb) ];  
    
    
    tmp1.cd = (tmpb == 4 | tmpb == 5);                 %social
    tmp2.cd = (tmpb == 14 | tmpb == 15);                %noninteracting   
        trim_raster{i}.cd2 = tmp(:,tmpb ==4 |tmpb==14 | tmpb == 5 | tmpb == 15);
        tmp1.cd2 = [ tmp1.cd(Social_Times2{i}.c(1,1)-frms:Social_Times2{i}.c(end,2)+frmsb) tmp1.cd(Social_Times2{i}.d(1,1)-frms:Social_Times2{i}.d(end,2)+frmsb)]; 
        tmp2.cd2 = [ tmp2.cd(Social_Times2{i}.c(1,1)-frms:Social_Times2{i}.c(end,2)+frmsb) tmp2.cd(Social_Times2{i}.d(1,1)-frms:Social_Times2{i}.d(end,2)+frmsb) ] ;       

    tmp1.abcd = (tmpb == 2 |tmpb == 3 | tmpb == 4 |tmpb == 5);     %social frames
    tmp2.abcd = (tmpb == 12 |tmpb == 13 | tmpb == 14 |tmpb == 15); %noninteracting frames    
        trim_raster{i}.abcd2 = tmp(:,tmpb ==2 | tmpb ==12 | tmpb == 3 | tmpb == 13 | tmpb ==4 | tmpb ==14 | tmpb == 5 | tmpb == 15);
        tmp1.abcd2 = [ tmp1.abcd(Social_Times2{i}.a(1,1)-frms:Social_Times2{i}.a(end,2)+frmsb) tmp1.abcd(Social_Times2{i}.b(1,1)-frms:Social_Times2{i}.b(end,2)+frmsb) tmp1.abcd(Social_Times2{i}.c(1,1)-frms:Social_Times2{i}.c(end,2)+frmsb) tmp1.abcd(Social_Times2{i}.d(1,1)-frms:Social_Times2{i}.d(end,2)+frmsb) ] ;   
        tmp2.abcd2 = [ tmp2.abcd(Social_Times2{i}.a(1,1)-frms:Social_Times2{i}.a(end,2)+frmsb) tmp2.abcd(Social_Times2{i}.b(1,1)-frms:Social_Times2{i}.b(end,2)+frmsb) tmp2.abcd(Social_Times2{i}.c(1,1)-frms:Social_Times2{i}.c(end,2)+frmsb) tmp2.abcd(Social_Times2{i}.d(1,1)-frms:Social_Times2{i}.d(end,2)+frmsb) ] ;                

        
        
        
        
        
        
        %context ensembles
        %1. all behaviors
        tmp1.abvcd = (tmpb == 2 |tmpb == 3 | tmpb == 12 |tmpb == 13  );     %context AB
        tmp2.abvcd = (tmpb == 4 |tmpb == 5 | tmpb == 14 |tmpb == 15); %context CD    
        trim_raster{i}.abvcd2 = tmp(:,tmpb ==2 | tmpb ==12 | tmpb == 3 | tmpb == 13 | tmpb ==4 | tmpb ==14 | tmpb == 5 | tmpb == 15);

        tmp1.abvcd2 = zeros(1, size(trim_raster{i}.abvcd2,2)); tmp2.abvcd2 = tmp1.abvcd2;
        tmp1.abvcd2 (1:sum(tmpb == 2 |tmpb == 3 | tmpb == 12 |tmpb == 13  )) = 1 ;   
        tmp2.abvcd2 (sum(tmpb == 2 |tmpb == 3 | tmpb == 12 |tmpb == 13  )+1: end) = 1  ;          
        
        
        
        tmp1.abvcd = (tmpb == 2 |tmpb == 3);     %context AB SOC
        tmp2.abvcd = (tmpb == 4 |tmpb == 5); %context CD SOC
        trim_raster{i}.abvcd2soc = tmp(:,tmpb ==2 | tmpb == 3 | tmpb ==4 | tmpb == 5 );
        tmp1.abvcd2soc = zeros(1, size(trim_raster{i}.abvcd2soc,2)); tmp2.abvcd2soc = tmp1.abvcd2soc;
        tmp1.abvcd2soc (1:sum(tmpb == 2 |tmpb == 3)) = 1 ;   
        tmp2.abvcd2soc (sum(tmpb == 2 |tmpb == 3)+1: end) = 1  ;  
        
        tmp1.abvcd = (tmpb == 12 |tmpb == 13  );     %context AB NONSOC
        tmp2.abvcd = (tmpb == 14 |tmpb == 15); %context CD NONSOC
        trim_raster{i}.abvcd2nonsoc = tmp(:,tmpb ==12 | tmpb == 13 | tmpb ==14 | tmpb == 15);
        tmp1.abvcd2nonsoc = zeros(1, size(trim_raster{i}.abvcd2nonsoc,2)); tmp2.abvcd2nonsoc = tmp1.abvcd2nonsoc;
        tmp1.abvcd2nonsoc (1:sum(tmpb == 12 |tmpb == 13)) = 1 ;   
        tmp2.abvcd2nonsoc (sum(tmpb == 12 |tmpb == 13)+1: end) = 1  ;                
                
        
        
        
        
        
        
        
[Cells_A{i}.a2, Cells_B{i}.a2, dist_A{i}.a2, dist_B{i}.a2] = ActivityModulationB(trim_raster{i}.a2, tmp1.a2, tmp2.a2, iterations);
[Cells_A{i}.b2, Cells_B{i}.b2, dist_A{i}.b2, dist_B{i}.b2] = ActivityModulationB(trim_raster{i}.b2, tmp1.b2, tmp2.b2, iterations);
[Cells_A{i}.c2, Cells_B{i}.c2, dist_A{i}.c2, dist_B{i}.c2] = ActivityModulationB(trim_raster{i}.c2, tmp1.c2, tmp2.c2, iterations);
[Cells_A{i}.d2, Cells_B{i}.d2, dist_A{i}.d2, dist_B{i}.d2] = ActivityModulationB(trim_raster{i}.d2, tmp1.d2, tmp2.d2, iterations);
   
[Cells_A{i}.ab2, Cells_B{i}.ab2, dist_A{i}.ab2, dist_B{i}.ab2] = ActivityModulationB(trim_raster{i}.ab2, tmp1.ab2, tmp2.ab2, iterations);
[Cells_A{i}.cd2, Cells_B{i}.cd2, dist_A{i}.cd2, dist_B{i}.cd2] = ActivityModulationB(trim_raster{i}.cd2, tmp1.cd2, tmp2.cd2, iterations);
[Cells_A{i}.abcd2, Cells_B{i}.abcd2, dist_A{i}.abcd2, dist_B{i}.abcd2] = ActivityModulationB(trim_raster{i}.abcd2, tmp1.abcd2, tmp2.abcd2, iterations);
[Cells_A{i}.a2bvcd2, Cells_B{i}.a2bvcd2, dist_A{i}.a2bvcd2, dist_B{i}.a2bvcd2] = ActivityModulationB(trim_raster{i}.a2, tmp1.a2, tmp2.a2, iterations);

%context ensemble
[Cells_A{i}.abvcd2, Cells_B{i}.abvcd2, dist_A{i}.abvcd2, dist_B{i}.abvcd2] = ActivityModulationB(trim_raster{i}.abvcd2, tmp1.abvcd2, tmp2.abvcd2, iterations);
[Cells_A{i}.abvcd2SOC, Cells_B{i}.abvcd2SOC, dist_A{i}.abvcd2SOC, dist_B{i}.abvcd2SOC] = ActivityModulationB(trim_raster{i}.abvcd2soc, tmp1.abvcd2soc, tmp2.abvcd2soc, iterations);
[Cells_A{i}.abvcd2NONSOC, Cells_B{i}.abvcd2NONSOC, dist_A{i}.abvcd2NONSOC, dist_B{i}.abvcd2NONSOC] = ActivityModulationB(trim_raster{i}.abvcd2nonsoc, tmp1.abvcd2nonsoc, tmp2.abvcd2nonsoc, iterations);


end
%plot_NvB_Distribution(Cells_A{2}.a, Cells_B{2}.a, dist_A{2}.a, dist_B{2}.a, raster, C, Times_A, Times_B)
%set(gca,'FontSize',14)

%%

%analyze on a per neuron basis
 
soc_mod_HCRC.abcd2 = []; nonsoc_mod_HCRC.abcd2 = [];
soc_mod_HCRC.ab2 = []; nonsoc_mod_HCRC.ab2 = [];
soc_mod_HCRC.cd2 = []; nonsoc_mod_HCRC.cd2 = [];

soc_mod_HCHC.abcd2 = []; nonsoc_mod_HCHC.abcd2 = [];
soc_mod_HCHC.ab2 = []; nonsoc_mod_HCHC.ab2 = [];
soc_mod_HCHC.cd2 = []; nonsoc_mod_HCHC.cd2 = [];

soc_mod_HCHC.a2 = []; nonsoc_mod_HCHC.a2 = [];
soc_mod_HCHC.c2 = []; nonsoc_mod_HCHC.c2 = [];
soc_mod_HCHC.b2 = []; nonsoc_mod_HCHC.b2 = [];
soc_mod_HCHC.d2 = []; nonsoc_mod_HCHC.d2 = [];

soc_mod_HCRC.a2 = []; nonsoc_mod_HCRC.a2 = [];
soc_mod_HCRC.c2 = []; nonsoc_mod_HCRC.c2 = [];
soc_mod_HCRC.b2 = []; nonsoc_mod_HCRC.b2 = [];
soc_mod_HCRC.d2 = []; nonsoc_mod_HCRC.d2 = [];
contextAB_mod_HCHC.abvcd2 = []
contextAB_mod_HCRC.abvcd2 = []
contextCD_mod_HCHC.abvcd2 = []
contextCD_mod_HCRC.abvcd2 = []

contextAB_mod_HCHC.abvcd2SOC = []
contextAB_mod_HCRC.abvcd2SOC = []
contextCD_mod_HCHC.abvcd2SOC = []
contextCD_mod_HCRC.abvcd2SOC = []
contextAB_mod_HCHC.abvcd2NONSOC = []
contextAB_mod_HCRC.abvcd2NONSOC = []
contextCD_mod_HCHC.abvcd2NONSOC = []
contextCD_mod_HCRC.abvcd2NONSOC = []
%All Mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.abcd2 = [soc_mod_HCRC.abcd2 ; [Cells_A{i}.abcd2(:,4) repmat(k, numel(Cells_A{i}.abcd2(:,4)), 1)]];
    nonsoc_mod_HCRC.abcd2  = [nonsoc_mod_HCRC.abcd2 ; [Cells_B{i}.abcd2(:,4) repmat(k, numel(Cells_B{i}.abcd2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.abcd2  = [soc_mod_HCHC.abcd2; [Cells_A{i}.abcd2(:,4) repmat(k, numel(Cells_A{i}.abcd2(:,4)), 1)]];
    nonsoc_mod_HCHC.abcd2 = [nonsoc_mod_HCHC.abcd2; [Cells_B{i}.abcd2(:,4) repmat(k, numel(Cells_B{i}.abcd2(:,4)), 1)]]; 
    k = k+1;
end

%all epoch context 
k = 1
for i = [HCRC]; 
    contextAB_mod_HCRC.abvcd2 = [contextAB_mod_HCRC.abvcd2 ; [Cells_A{i}.abvcd2(:,4) repmat(k, numel(Cells_A{i}.abvcd2(:,4)), 1)]];
    contextCD_mod_HCRC.abvcd2  = [contextCD_mod_HCRC.abvcd2 ; [Cells_B{i}.abvcd2(:,4) repmat(k, numel(Cells_B{i}.abvcd2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    contextAB_mod_HCHC.abvcd2  = [contextAB_mod_HCHC.abvcd2; [Cells_A{i}.abvcd2(:,4) repmat(k, numel(Cells_A{i}.abvcd2(:,4)), 1)]];
    contextCD_mod_HCHC.abvcd2 = [contextCD_mod_HCHC.abvcd2; [Cells_B{i}.abvcd2(:,4) repmat(k, numel(Cells_B{i}.abvcd2(:,4)), 1)]]; 
    k = k+1;
end

%Using social frames only
k = 1
for i = [HCRC]; 
    contextAB_mod_HCRC.abvcd2SOC = [contextAB_mod_HCRC.abvcd2SOC ; [Cells_A{i}.abvcd2SOC(:,4) repmat(k, numel(Cells_A{i}.abvcd2SOC(:,4)), 1)]];
    contextCD_mod_HCRC.abvcd2SOC  = [contextCD_mod_HCRC.abvcd2SOC ; [Cells_B{i}.abvcd2SOC(:,4) repmat(k, numel(Cells_B{i}.abvcd2SOC(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    contextAB_mod_HCHC.abvcd2SOC  = [contextAB_mod_HCHC.abvcd2SOC; [Cells_A{i}.abvcd2SOC(:,4) repmat(k, numel(Cells_A{i}.abvcd2SOC(:,4)), 1)]];
    contextCD_mod_HCHC.abvcd2SOC = [contextCD_mod_HCHC.abvcd2SOC; [Cells_B{i}.abvcd2SOC(:,4) repmat(k, numel(Cells_B{i}.abvcd2SOC(:,4)), 1)]]; 
    k = k+1;
end

%using nonsocial frames only
k = 1
for i = [HCRC]; 
    contextAB_mod_HCRC.abvcd2NONSOC = [contextAB_mod_HCRC.abvcd2NONSOC ; [Cells_A{i}.abvcd2NONSOC(:,4) repmat(k, numel(Cells_A{i}.abvcd2NONSOC(:,4)), 1)]];
    contextCD_mod_HCRC.abvcd2NONSOC  = [contextCD_mod_HCRC.abvcd2NONSOC ; [Cells_B{i}.abvcd2NONSOC(:,4) repmat(k, numel(Cells_B{i}.abvcd2NONSOC(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    contextAB_mod_HCHC.abvcd2NONSOC  = [contextAB_mod_HCHC.abvcd2NONSOC; [Cells_A{i}.abvcd2NONSOC(:,4) repmat(k, numel(Cells_A{i}.abvcd2NONSOC(:,4)), 1)]];
    contextCD_mod_HCHC.abvcd2NONSOC = [contextCD_mod_HCHC.abvcd2NONSOC; [Cells_B{i}.abvcd2NONSOC(:,4) repmat(k, numel(Cells_B{i}.abvcd2NONSOC(:,4)), 1)]]; 
    k = k+1;
end






%First Two mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.ab2 = [soc_mod_HCRC.ab2 ; [Cells_A{i}.ab2(:,4) repmat(k, numel(Cells_A{i}.ab2(:,4)), 1)]];
    nonsoc_mod_HCRC.ab2  = [nonsoc_mod_HCRC.ab2 ; [Cells_B{i}.ab2(:,4) repmat(k, numel(Cells_B{i}.ab2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.ab2  = [soc_mod_HCHC.ab2; [Cells_A{i}.ab2(:,4) repmat(k, numel(Cells_A{i}.ab2(:,4)), 1)]];
    nonsoc_mod_HCHC.ab2 = [nonsoc_mod_HCHC.ab2; [Cells_B{i}.ab2(:,4) repmat(k, numel(Cells_B{i}.ab2(:,4)), 1)]]; 
    k = k+1;
end

%Last Two mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.cd2 = [soc_mod_HCRC.cd2 ; [Cells_A{i}.cd2(:,4) repmat(k, numel(Cells_A{i}.cd2(:,4)), 1)]];
    nonsoc_mod_HCRC.cd2  = [nonsoc_mod_HCRC.cd2 ; [Cells_B{i}.cd2(:,4) repmat(k, numel(Cells_B{i}.cd2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.cd2  = [soc_mod_HCHC.cd2; [Cells_A{i}.cd2(:,4) repmat(k, numel(Cells_A{i}.cd2(:,4)), 1)]];
    nonsoc_mod_HCHC.cd2 = [nonsoc_mod_HCHC.cd2; [Cells_B{i}.cd2(:,4) repmat(k, numel(Cells_B{i}.cd2(:,4)), 1)]];
    k = k+1;
end


%individual mice
k = 1
for i = [HCRC]; 
    soc_mod_HCRC.a2 = [soc_mod_HCRC.a2 ; [Cells_A{i}.a2(:,4) repmat(k, numel(Cells_A{i}.a2(:,4)), 1)]];
    nonsoc_mod_HCRC.a2  = [nonsoc_mod_HCRC.a2 ; [Cells_B{i}.a2(:,4) repmat(k, numel(Cells_B{i}.a2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.a2  = [soc_mod_HCHC.a2; [Cells_A{i}.a2(:,4) repmat(k, numel(Cells_A{i}.a2(:,4)), 1)]];
    nonsoc_mod_HCHC.a2= [nonsoc_mod_HCHC.a2; [Cells_B{i}.a2(:,4) repmat(k, numel(Cells_B{i}.a2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCRC]; 
    soc_mod_HCRC.b2 = [soc_mod_HCRC.b2 ; [Cells_A{i}.b2(:,4) repmat(k, numel(Cells_A{i}.b2(:,4)), 1)]];
    nonsoc_mod_HCRC.b2  = [nonsoc_mod_HCRC.b2 ; [Cells_B{i}.b2(:,4) repmat(k, numel(Cells_B{i}.b2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.b2  = [soc_mod_HCHC.b2; [Cells_A{i}.b2(:,4) repmat(k, numel(Cells_A{i}.b2(:,4)), 1)] ];
    nonsoc_mod_HCHC.b2 = [nonsoc_mod_HCHC.b2; [Cells_B{i}.b2(:,4) repmat(k, numel(Cells_B{i}.b2(:,4)), 1)]]; 
    k = k+1;
end


k = 1
for i = [HCRC]; 
    soc_mod_HCRC.c2 = [soc_mod_HCRC.c2 ; [Cells_A{i}.c2(:,4) repmat(k, numel(Cells_A{i}.c2(:,4)), 1)]];
    nonsoc_mod_HCRC.c2  = [nonsoc_mod_HCRC.c2 ; [Cells_B{i}.c2(:,4) repmat(k, numel(Cells_B{i}.c2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.c2  = [soc_mod_HCHC.c2; [Cells_A{i}.c2(:,4) repmat(k, numel(Cells_A{i}.c2(:,4)), 1)]];
    nonsoc_mod_HCHC.c2 = [nonsoc_mod_HCHC.c2; [Cells_B{i}.c2(:,4) repmat(k, numel(Cells_B{i}.c2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCRC]; 
    soc_mod_HCRC.d2 = [soc_mod_HCRC.d2 ; [Cells_A{i}.d2(:,4) repmat(k, numel(Cells_A{i}.d2(:,4)), 1)] ];
    nonsoc_mod_HCRC.d2  = [nonsoc_mod_HCRC.d2 ; [Cells_B{i}.d2(:,4) repmat(k, numel(Cells_B{i}.d2(:,4)), 1)]]; 
    k = k+1;
end

k = 1
for i = [HCHC]; 
    soc_mod_HCHC.d2  = [soc_mod_HCHC.d2; [Cells_A{i}.d2(:,4) repmat(k, numel(Cells_A{i}.d2(:,4)), 1)]];
    nonsoc_mod_HCHC.d2 = [nonsoc_mod_HCHC.d2; [Cells_B{i}.d2(:,4) repmat(k, numel(Cells_B{i}.d2(:,4)), 1)]]; 
    k = k+1
end



%modulation matrix
sum(soc_mod_HCRC.ab2(:,1) >= 0.9 & contextAB_mod_HCRC.abvcd2(:,1)>= 0.9)./632 %social and context up
sum(soc_mod_HCRC.ab2(:,1) >= 0.9 & contextAB_mod_HCRC.abvcd2(:,1)<= 0.1)./632 %social up and context down
sum(soc_mod_HCRC.ab2(:,1) <= 0.1 & contextAB_mod_HCRC.abvcd2(:,1)>= 0.9)./632 %social down and context up
sum(soc_mod_HCRC.ab2(:,1) <= 0.1 & contextAB_mod_HCRC.abvcd2(:,1)<= 0.1)./632 %social and context down

sum(soc_mod_HCRC.ab2(:,1) >= 0.9 & contextAB_mod_HCRC.abvcd2(:,1)> 0.1 & contextAB_mod_HCRC.abvcd2(:,1)< 0.9)./632 %positive in social and nonmodulated in context
sum(soc_mod_HCRC.ab2(:,1) <= 0.1 & contextAB_mod_HCRC.abvcd2(:,1)> 0.1 & contextAB_mod_HCRC.abvcd2(:,1)< 0.9)./632 % negative in social and nonmodulated in context

sum(soc_mod_HCRC.ab2(:,1) > 0.1 & soc_mod_HCRC.ab2(:,1) < 0.9 & contextAB_mod_HCRC.abvcd2(:,1)> 0.1 & contextAB_mod_HCRC.abvcd2(:,1)< 0.9)./632 %middle box 
sum(soc_mod_HCRC.ab2(:,1) > 0.1 & soc_mod_HCRC.ab2(:,1) < 0.9 &contextAB_mod_HCRC.abvcd2(:,1)>= 0.9)./632 
sum(soc_mod_HCRC.ab2(:,1) > 0.1 & soc_mod_HCRC.ab2(:,1) < 0.9 &contextAB_mod_HCRC.abvcd2(:,1)<= 0.1)./632 
%three cells removed because isnans for contextAB)

sum(soc_mod_HCHC.ab2(:,1) >= 0.9 & contextAB_mod_HCHC.abvcd2(:,1)>= 0.9)./685 %social + and context +
sum(soc_mod_HCHC.ab2(:,1) >= 0.9 & contextAB_mod_HCHC.abvcd2(:,1)<= 0.1)./685  %social + and context -
sum(soc_mod_HCHC.ab2(:,1) <= 0.1 & contextAB_mod_HCHC.abvcd2(:,1)>= 0.9)./685 %social - and context +
sum(soc_mod_HCHC.ab2(:,1) <= 0.1 & contextAB_mod_HCHC.abvcd2(:,1)<= 0.1)./685 %social - and context -

sum(soc_mod_HCHC.ab2(:,1) >= 0.9 & contextAB_mod_HCHC.abvcd2(:,1)> 0.1 & contextAB_mod_HCHC.abvcd2(:,1)< 0.9)./685 %social + and context +/-
sum(soc_mod_HCHC.ab2(:,1) <= 0.1 & contextAB_mod_HCHC.abvcd2(:,1)> 0.1 & contextAB_mod_HCHC.abvcd2(:,1)< 0.9)./685 %social - and context +/-

sum(soc_mod_HCHC.ab2(:,1) > 0.1 & soc_mod_HCHC.ab2(:,1) < 0.9 & contextAB_mod_HCHC.abvcd2(:,1)> 0.1 & contextAB_mod_HCHC.abvcd2(:,1)< 0.9)./685 
sum(soc_mod_HCHC.ab2(:,1) > 0.1 & soc_mod_HCHC.ab2(:,1) < 0.9 & contextAB_mod_HCHC.abvcd2(:,1)>= 0.9)./685
sum(soc_mod_HCHC.ab2(:,1) > 0.1 & soc_mod_HCHC.ab2(:,1) < 0.9 & contextAB_mod_HCHC.abvcd2(:,1)<= 0.1)./685     

%%
xx = linspace(0,1,10)
space = [0 0.07]
figure;imagesc(imgaussfilt(histcounts2 (soc_mod_HCHC.ab2(:,1), soc_mod_HCHC.cd2(:,1),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (nonsoc_mod_HCHC.ab2(:,1), nonsoc_mod_HCHC.cd2(:,1),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
[ rho pval] = corr(soc_mod_HCHC.ab2(:,1), soc_mod_HCHC.cd2(:,1))
corr(nonsoc_mod_HCHC.ab2(:,1), nonsoc_mod_HCHC.cd2(:,1))
corr(soc_mod_HCHC.ab2(:,1), nonsoc_mod_HCHC.cd2(:,1))
corr(nonsoc_mod_HCHC.ab2(:,1), soc_mod_HCHC.cd2(:,1))

%colormap(brewermap([],"OrRd"))

figure;imagesc(imgaussfilt(histcounts2 (soc_mod_HCRC.ab2(:,1), soc_mod_HCRC.cd2(:,1),xx,xx,'normalization','probability'),.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (nonsoc_mod_HCRC.ab2(:,1), nonsoc_mod_HCRC.cd2(:,1),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
[ rho pval] = corr(soc_mod_HCRC.ab2(:,1), soc_mod_HCRC.cd2(:,1),'rows','pairwise')
corr(nonsoc_mod_HCRC.ab2(:,1), nonsoc_mod_HCRC.cd2(:,1),'rows','pairwise')
corr(soc_mod_HCRC.ab2(:,1), nonsoc_mod_HCRC.cd2(:,1))
corr(nonsoc_mod_HCRC.ab2(:,1), soc_mod_HCRC.cd2(:,1))




%% compare epochs

[rho, pval] = corr(soc_mod_HCHC.ab2(:,1), soc_mod_HCHC.cd2(:,1))
[rho, pval] = corr(soc_mod_HCRC.ab2(:,1), soc_mod_HCRC.cd2(:,1),'rows','pairwise')
[rho, pval] = corr(nonsoc_mod_HCHC.ab2(:,1), nonsoc_mod_HCHC.cd2(:,1))
[rho, pval] = corr(nonsoc_mod_HCRC.ab2(:,1), nonsoc_mod_HCRC.cd2(:,1))


corr(soc_mod_HCRC.a2(:,1), soc_mod_HCRC.b2(:,1))
corr(soc_mod_HCRC.b2(:,1), soc_mod_HCRC.c2(:,1))
corr(soc_mod_HCRC.c2(:,1), soc_mod_HCRC.d2(:,1))

corr(soc_mod_HCHC.a2(:,1), soc_mod_HCHC.b2(:,1))
corr(soc_mod_HCHC.b2(:,1), soc_mod_HCHC.c2(:,1))
corr(soc_mod_HCHC.c2(:,1), soc_mod_HCHC.d2(:,1))

corr(nonsoc_mod_HCRC.a2(:,1), nonsoc_mod_HCRC.b2(:,1))
corr(nonsoc_mod_HCRC.b2(:,1), nonsoc_mod_HCRC.c2(:,1))
corr(nonsoc_mod_HCRC.c2(:,1), nonsoc_mod_HCRC.d2(:,1))

corr(nonsoc_mod_HCHC.a2(:,1), nonsoc_mod_HCHC.b2(:,1))
corr(nonsoc_mod_HCHC.b2(:,1), nonsoc_mod_HCHC.c2(:,1))
corr(nonsoc_mod_HCHC.c2(:,1), nonsoc_mod_HCHC.d2(:,1))





HR = [soc_mod_HCRC.a2(:,1) soc_mod_HCRC.b2(:,1) soc_mod_HCRC.c2(:,1), soc_mod_HCRC.d2(:,1) nonsoc_mod_HCRC.a2(:,1) nonsoc_mod_HCRC.b2(:,1) nonsoc_mod_HCRC.c2(:,1), nonsoc_mod_HCRC.d2(:,1)];
HH = [soc_mod_HCHC.a2(:,1) soc_mod_HCHC.b2(:,1) soc_mod_HCHC.c2(:,1), soc_mod_HCHC.d2(:,1) nonsoc_mod_HCHC.a2(:,1) nonsoc_mod_HCHC.b2(:,1) nonsoc_mod_HCHC.c2(:,1), nonsoc_mod_HCHC.d2(:,1)];

tmp = corr(HR,'rows','pairwise'); for i = 1:8; tmp(i,i) = nan; end
figure; imagesc(tmp) 
caxis([-0.35 0.4])

tmp = (corr(HH)); for i = 1:8; tmp(i,i) = nan; end
figure; imagesc(tmp) 
caxis([-0.35 0.4])


%now analyze on a mouse by mouse basis
for i = 1:numel(HCHC)
    tmp = find(soc_mod_HCHC.ab2(:,2) == i);
    ABvsCD2_HCHC(i) = corr(soc_mod_HCHC.ab2(tmp,1), soc_mod_HCHC.cd2(tmp,1),'rows','pairwise');
end


for i = 1:numel(HCRC)
    tmp = find(soc_mod_HCRC.ab2(:,2) == i);
    ABvsCD2_HCRC(i) = corr(soc_mod_HCRC.ab2(tmp,1), soc_mod_HCRC.cd2(tmp,1),'rows','pairwise');
end

[n p] = ttest2(ABvsCD2_HCHC, ABvsCD2_HCRC)



for i = 1:numel(HCHC)
    tmp = find(soc_mod_HCHC.ab2(:,2) == i);
    ABvsCD_HCHC(i) = corr(soc_mod_HCHC.ab(tmp,1), soc_mod_HCHC.cd(tmp,1),'rows','pairwise');
end


for i = 1:numel(HCRC)
    tmp = find(soc_mod_HCRC.ab(:,2) == i);
    ABvsCD_HCRC(i) = corr(soc_mod_HCRC.ab(tmp,1), soc_mod_HCRC.cd(tmp,1),'rows','pairwise');
end
[n p] = signrank(ABvsCD_HCHC, ABvsCD_HCRC)


ABvsCD_HCHC_AV = squeeze(HCHCtmp(9,10,:)) 
ABvsCD_HCRC_AV = squeeze(HCRCtmp(9,10,:))



figure;scatter(ABvsCD2_HCHC, ABvsCD2_HCRC,'.'); line([0 0.9],[0 0.9]);
figure;scatter(ABvsCD_HCHC_AV, ABvsCD_HCRC_AV,'.'); line([0 0.9],[0 0.9]);


[n p] = signrank(ABvsCD2_HCHC, ABvsCD2_HCRC)
[n p] = signrank(ABvsCD_HCHC_AV, ABvsCD_HCRC_AV)
mean(ABvsCD2_HCHC), std(ABvsCD2_HCHC)./(8^0.5)
mean(ABvsCD2_HCRC), std(ABvsCD2_HCRC)./(8^0.5)
mean(ABvsCD_HCHC_AV), std(ABvsCD_HCHC_AV)./(8^0.5)
mean(ABvsCD_HCRC_AV), std(ABvsCD_HCRC_AV)./(8^0.5)

figure;scatter(ABvsCD2_HCHC, ABvsCD2_HCRC);hold on; scatter(ABvsCD_HCHC_AV, ABvsCD_HCRC_AV); line([-1 1],[-1 1])
figure;scatter(ABvsCD2_HCHC, ABvsCD_HCHC_AV);hold on; scatter(ABvsCD2_HCRC, ABvsCD_HCRC_AV); line([-1 1],[-1 1])




% social vs nonsocial - all cells
clear socvsnonsoc_withincontext_HCHC_AV socvsnonsoc_withincontext_HCRC_AV socvsnonsoc_betweencontext_HCHC_AV socvsnonsoc_betweencontext_HCRC_AV
for i = 1:8
socvsnonsoc_withincontext_HCHC_AV(i) =    mean(mean( [(HCHCtmp(1:2,5:6,i)) (HCHCtmp(3:4,7:8,i))]));
socvsnonsoc_betweencontext_HCHC_AV(i) =   mean(mean( [(HCHCtmp(1:2,7:8,i)) (HCHCtmp(3:4,5:6,i))]));

socvsnonsoc_withincontext_HCRC_AV(i) =    mean(mean( [(HCRCtmp(1:2,5:6,i)) (HCRCtmp(3:4,7:8,i))]));
socvsnonsoc_betweencontext_HCRC_AV(i) =   mean(mean( [(HCRCtmp(1:2,7:8,i)) (HCRCtmp(3:4,5:6,i))]));

socvssoc_withincontext_HCHC_AV(i) =    mean(mean( HCHCtmp(1:2,1:2,i),'omitnan'));
socvssoc_betweencontext_HCHC_AV(i) =   mean(mean( HCHCtmp(1:2,3:4,i),'omitnan'));

socvssoc_withincontext_HCRC_AV(i) =    mean(mean( HCRCtmp(1:2,1:2,i),'omitnan'));
socvssoc_betweencontext_HCRC_AV(i) =   mean(mean( HCRCtmp(1:2,3:4,i),'omitnan'));

end


% social vs nonsocial - pairwsie removal
clear socvsnonsoc_withincontext_HCHC2_AV socvsnonsoc_withincontext_HCRC2_AV socvsnonsoc_betweencontext_HCHC2_AV socvsnonsoc_betweencontext_HCRC2_AV
for i = 1:8
socvsnonsoc_withincontext_HCH2C_AV(i) =    mean(mean( [(HCHC2tmp(1:2,5:6,i)) (HCHC2tmp(3:4,7:8,i))]));
socvsnonsoc_betweencontext_HCHC2_AV(i) =   mean(mean( [(HCHC2tmp(1:2,7:8,i)) (HCHC2tmp(3:4,5:6,i))]));

socvsnonsoc_withincontext_HCRC2_AV(i) =    mean(mean( [(HCRC2tmp(1:2,5:6,i)) (HCRC2tmp(3:4,7:8,i))]));
socvsnonsoc_betweencontext_HCRC2_AV(i) =   mean(mean( [(HCRC2tmp(1:2,7:8,i)) (HCRC2tmp(3:4,5:6,i))]));

socvssoc_withincontext_HCHC2_AV(i) =    mean(mean( HCHC2tmp(1:2,1:2,i),'omitnan'));
socvssoc_betweencontext_HCHC2_AV(i) =   mean(mean( HCHC2tmp(1:2,3:4,i),'omitnan'));

socvssoc_withincontext_HCRC2_AV(i) =    mean(mean( HCRC2tmp(1:2,1:2,i),'omitnan'));
socvssoc_betweencontext_HCRC2_AV(i) =   mean(mean( HCRC2tmp(1:2,3:4,i),'omitnan'));

end


% social vs nonsocial - context-dependent activity removal
clear socvsnonsoc_withincontext_HCHC3_AV socvsnonsoc_withincontext_HCRC3_AV socvsnonsoc_betweencontext_HCHC3_AV socvsnonsoc_betweencontext_HCRC3_AV
for i = 1:8
socvsnonsoc_withincontext_HCHC3_AV(i) =    mean(mean( [(HCHC3tmp(1:2,5:6,i)) (HCHC3tmp(3:4,7:8,i))]));
socvsnonsoc_betweencontext_HCHC3_AV(i) =   mean(mean( [(HCHC3tmp(1:2,7:8,i)) (HCHC3tmp(3:4,5:6,i))]));

socvsnonsoc_withincontext_HCRC3_AV(i) =    mean(mean( [(HCRC3tmp(1:2,5:6,i)) (HCRC3tmp(3:4,7:8,i))]));
socvsnonsoc_betweencontext_HCR3C_AV(i) =   mean(mean( [(HCRC3tmp(1:2,7:8,i)) (HCRC3tmp(3:4,5:6,i))]));

socvssoc_withincontext_HCHC3_AV(i) =    mean(mean( HCHC3tmp(1:2,1:2,i),'omitnan'));
socvssoc_betweencontext_HCHC3_AV(i) =   mean(mean( HCHC3tmp(1:2,3:4,i),'omitnan'));

socvssoc_withincontext_HCRC3_AV(i) =    mean(mean( HCRC3tmp(1:2,1:2,i),'omitnan'));
socvssoc_betweencontext_HCRC3_AV(i) =   mean(mean( HCRC3tmp(1:2,3:4,i),'omitnan'));

end







mean(socvsnonsoc_withincontext_HCHC_AV), std(socvsnonsoc_withincontext_HCHC_AV)/8^0.5
mean(socvsnonsoc_withincontext_HCRC_AV), std(socvsnonsoc_withincontext_HCRC_AV)/8^0.5

mean(socvsnonsoc_betweencontext_HCHC_AV), std(socvsnonsoc_betweencontext_HCHC_AV)/8^0.5
mean(socvsnonsoc_betweencontext_HCRC_AV), std(socvsnonsoc_betweencontext_HCRC_AV)/8^0.5

mean(socvssoc_withincontext_HCHC_AV), std(socvssoc_withincontext_HCHC_AV)/8^0.5
mean(socvssoc_withincontext_HCRC_AV), std(socvssoc_withincontext_HCRC_AV)/8^0.5

mean(socvssoc_betweencontext_HCHC_AV), std(socvssoc_betweencontext_HCHC_AV)/8^0.5
mean(socvssoc_betweencontext_HCRC_AV), std(socvssoc_betweencontext_HCRC_AV)/8^0.5
%%

%now analyze on a mouse by mouse basis looking at social context 1 vs
%context 2
for i = 1:numel(HCHC)
    tmp1 = find(soc_mod_HCHC.b2(:,2) == i);
    tmp2 = find(soc_mod_HCHC.c2(:,2) == i);
    BvsC2_HCHC(i) = corr(soc_mod_HCHC.b2(tmp1,1), soc_mod_HCHC.c2(tmp2,1),'rows','pairwise');
end


for i = 1:numel(HCHC)
    tmp1 = find(soc_mod_HCRC.b2(:,2) == i);
    tmp2 = find(soc_mod_HCRC.c2(:,2) == i);
    BvsC2_HCRC(i) = corr(soc_mod_HCRC.b2(tmp1,1), soc_mod_HCRC.c2(tmp2,1),'rows','pairwise');
end
[n p] = ttest2(BvsC2_HCHC, BvsC2_HCRC)



for i = 1:numel(HCHC)
    tmp1 = find(soc_mod_HCHC.b(:,2) == i);
    tmp2 = find(soc_mod_HCHC.c(:,2) == i);
    BvsC_HCHC(i) = corr(soc_mod_HCHC.b(tmp1,1), soc_mod_HCHC.c(tmp2,1),'rows','pairwise');
end


for i = 1:numel(HCHC)
    tmp1 = find(soc_mod_HCRC.b(:,2) == i);
    tmp2 = find(soc_mod_HCRC.c(:,2) == i);
    BvsC_HCRC(i) = corr(soc_mod_HCRC.b(tmp1,1), soc_mod_HCRC.c(tmp2,1),'rows','pairwise');
end
[n p] = ttest2(BvsC_HCHC, BvsC_HCRC)


BvsC_HCHC_AV = squeeze(HCHCtmp(2,3,:)) 
BvsC_HCRC_AV = squeeze(HCRCtmp(2,3,:))

[n p] = signrank(BvsC_HCHC_AV, BvsC_HCRC_AV)
[n p] = signrank(BvsC2_HCHC, BvsC2_HCRC)
mean(BvsC_HCHC_AV), std(BvsC_HCHC_AV)/(8^0.5)
mean(BvsC_HCRC_AV), std(BvsC_HCRC_AV)/(8^0.5)
mean(BvsC2_HCHC), std(BvsC2_HCHC)/(8^0.5)
mean(BvsC2_HCRC), std(BvsC2_HCRC)/(8^0.5)



figure;scatter(BvsC_HCHC_AV, BvsC_HCRC_AV,'.'); line([-0.10 0.8],[-0.10 0.8])
figure;scatter(BvsC2_HCHC, BvsC2_HCRC,'.');hold on;  line([-0.10 0.8],[-0.10 0.8])

%%
%compare soc and nonsoc
clear tmp1 soc_nonsoc_withincontext
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    %tmp1(1) = corr(soc_mod_HCHC.a2(tmp,1), nonsoc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    %tmp1(2) = corr(soc_mod_HCHC.b2(tmp,1), nonsoc_mod_HCHC.b2(tmp,1),'rows','pairwise');
    tmp1(1) = corr(soc_mod_HCHC.a2(tmp,1), nonsoc_mod_HCHC.b2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCHC.b2(tmp,1), nonsoc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    
    %tmp1(5) = corr(soc_mod_HCHC.c2(tmp,1), nonsoc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    %tmp1(6) = corr(soc_mod_HCHC.d2(tmp,1), nonsoc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCHC.c2(tmp,1), nonsoc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCHC.d2(tmp,1), nonsoc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    soc_nonsoc_withincontext.HCHC(i,:) = tmp1;
end

clear tmp1
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    %tmp1(1) = corr(soc_mod_HCRC.a2(tmp,1), soc_mod_HCRC.a2(tmp,1),'rows','pairwise');
    %tmp1(2) = corr(soc_mod_HCRC.b2(tmp,1), soc_mod_HCRC.b2(tmp,1),'rows','pairwise');
    tmp1(1) = corr(soc_mod_HCRC.a2(tmp,1), soc_mod_HCRC.b2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCRC.b2(tmp,1), soc_mod_HCRC.a2(tmp,1),'rows','pairwise');

    %tmp1(5) = corr(soc_mod_HCRC.c2(tmp,1), soc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    %tmp1(6) = corr(soc_mod_HCRC.d2(tmp,1), soc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCRC.c2(tmp,1), soc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCRC.d2(tmp,1), soc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    soc_soc_withincontext.HCRC(i,:) = tmp1;
end

for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    %tmp1(1) = corr(soc_mod_HCHC.a2(tmp,1), soc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    %tmp1(2) = corr(soc_mod_HCHC.b2(tmp,1), soc_mod_HCHC.b2(tmp,1),'rows','pairwise');
    tmp1(1) = corr(soc_mod_HCHC.a2(tmp,1), soc_mod_HCHC.b2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCHC.b2(tmp,1), soc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    
    %tmp1(5) = corr(soc_mod_HCHC.c2(tmp,1), soc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    %tmp1(6) = corr(soc_mod_HCHC.d2(tmp,1), soc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCHC.c2(tmp,1), soc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCHC.d2(tmp,1), soc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    soc_soc_withincontext.HCHC(i,:) = tmp1;
end

clear tmp1
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    %tmp1(1) = corr(soc_mod_HCRC.a2(tmp,1), nonsoc_mod_HCRC.a2(tmp,1),'rows','pairwise');
    %tmp1(2) = corr(soc_mod_HCRC.b2(tmp,1), nonsoc_mod_HCRC.b2(tmp,1),'rows','pairwise');
    tmp1(1) = corr(soc_mod_HCRC.a2(tmp,1), nonsoc_mod_HCRC.b2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCRC.b2(tmp,1), nonsoc_mod_HCRC.a2(tmp,1),'rows','pairwise');

    %tmp1(5) = corr(soc_mod_HCRC.c2(tmp,1), nonsoc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    %tmp1(6) = corr(soc_mod_HCRC.d2(tmp,1), nonsoc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCRC.c2(tmp,1), nonsoc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCRC.d2(tmp,1), nonsoc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    soc_nonsoc_withincontext.HCRC(i,:) = tmp1;
end







clear tmp1 soc_nonsoc_betweencontext
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    tmp1(1) = corr(soc_mod_HCHC.a2(tmp,1), nonsoc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCHC.b2(tmp,1), nonsoc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCHC.c2(tmp,1), nonsoc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCHC.c2(tmp,1), nonsoc_mod_HCHC.b2(tmp,1),'rows','pairwise');

    tmp1(5) = corr(soc_mod_HCHC.b2(tmp,1), nonsoc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(6) = corr(soc_mod_HCHC.a2(tmp,1), nonsoc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(7) = corr(soc_mod_HCHC.d2(tmp,1), nonsoc_mod_HCHC.b2(tmp,1),'rows','pairwise');
    tmp1(8) = corr(soc_mod_HCHC.d2(tmp,1), nonsoc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    soc_nonsoc_betweencontext.HCHC(i,:) = tmp1;
end

clear tmp1
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    tmp1(1) = corr(soc_mod_HCRC.a2(tmp,1), nonsoc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCRC.b2(tmp,1), nonsoc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCRC.c2(tmp,1), nonsoc_mod_HCRC.a2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCRC.c2(tmp,1), nonsoc_mod_HCRC.b2(tmp,1),'rows','pairwise');

    tmp1(5) = corr(soc_mod_HCRC.b2(tmp,1), nonsoc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(6) = corr(soc_mod_HCRC.a2(tmp,1), nonsoc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(7) = corr(soc_mod_HCRC.d2(tmp,1), nonsoc_mod_HCRC.b2(tmp,1),'rows','pairwise');
    tmp1(8) = corr(soc_mod_HCRC.d2(tmp,1), nonsoc_mod_HCRC.a2(tmp,1),'rows','pairwise');
    soc_nonsoc_betweencontext.HCRC(i,:) = tmp1;
end

clear tmp1 
soc_soc_betweencontext.HCHC = []
soc_soc_withincontext.HCHC = []
soc_soc_betweencontext.HCRC = []
soc_soc_withincontext.HC = []
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    tmp1(1) = corr(soc_mod_HCHC.a2(tmp,1), soc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCHC.b2(tmp,1), soc_mod_HCHC.c2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCHC.c2(tmp,1), soc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCHC.c2(tmp,1), soc_mod_HCHC.b2(tmp,1),'rows','pairwise');

    tmp1(5) = corr(soc_mod_HCHC.b2(tmp,1), soc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(6) = corr(soc_mod_HCHC.a2(tmp,1), soc_mod_HCHC.d2(tmp,1),'rows','pairwise');
    tmp1(7) = corr(soc_mod_HCHC.d2(tmp,1), soc_mod_HCHC.b2(tmp,1),'rows','pairwise');
    tmp1(8) = corr(soc_mod_HCHC.d2(tmp,1), soc_mod_HCHC.a2(tmp,1),'rows','pairwise');
    soc_soc_betweencontext.HCHC(i,:) = tmp1;
end

clear tmp1
for i = 1:8
    tmp = find(soc_mod_HCRC.a(:,2) == i);
    tmp1(1) = corr(soc_mod_HCRC.a2(tmp,1), soc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    tmp1(2) = corr(soc_mod_HCRC.b2(tmp,1), soc_mod_HCRC.c2(tmp,1),'rows','pairwise');
    tmp1(3) = corr(soc_mod_HCRC.c2(tmp,1), soc_mod_HCRC.a2(tmp,1),'rows','pairwise');
    tmp1(4) = corr(soc_mod_HCRC.c2(tmp,1), soc_mod_HCRC.b2(tmp,1),'rows','pairwise');

    tmp1(5) = corr(soc_mod_HCRC.b2(tmp,1), soc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(6) = corr(soc_mod_HCRC.a2(tmp,1), soc_mod_HCRC.d2(tmp,1),'rows','pairwise');
    tmp1(7) = corr(soc_mod_HCRC.d2(tmp,1), soc_mod_HCRC.b2(tmp,1),'rows','pairwise');
    tmp1(8) = corr(soc_mod_HCRC.d2(tmp,1), soc_mod_HCRC.a2(tmp,1),'rows','pairwise');
    soc_soc_betweencontext.HCRC(i,:) = tmp1;
end

%socnonsoc
%within
ans = mean(soc_nonsoc_withincontext.HCHC')
ans = mean(soc_nonsoc_withincontext.HCRC')

%between
ans = mean(soc_nonsoc_betweencontext.HCHC')
ans = mean(soc_nonsoc_betweencontext.HCRC')

%socsoc
%within
ans = mean(soc_soc_withincontext.HCHC')
ans = mean(soc_soc_withincontext.HCRC')

%between
ans = mean(soc_soc_betweencontext.HCHC')
ans = mean(soc_soc_betweencontext.HCRC')


%%
%now average A and B vs C and D


%now analyze on a mouse by mouse basis looking at social context 1 vs
%context 2
for i = 1:numel(HCHC)
    tmp1 = find(soc_mod_HCHC.a2(:,2) == i);
    tmp2 = find(soc_mod_HCHC.b2(:,2) == i);
    tmp3 = find(soc_mod_HCHC.c2(:,2) == i);
    tmp4 = find(soc_mod_HCHC.d2(:,2) == i); 
    ac = corr(soc_mod_HCHC.a2(tmp1,1), soc_mod_HCHC.c2(tmp2,1),'rows','pairwise')
    ad = corr(soc_mod_HCHC.a2(tmp1,1), soc_mod_HCHC.d2(tmp2,1),'rows','pairwise')
    bc = corr(soc_mod_HCHC.b2(tmp1,1), soc_mod_HCHC.c2(tmp2,1),'rows','pairwise')
    bd = corr(soc_mod_HCHC.b2(tmp1,1), soc_mod_HCHC.d2(tmp2,1),'rows','pairwise')
   
    A_BvsC_D2_HCHC(i) = mean([ac ad bc bd]);
end


for i = 1:numel(HCRC)
    tmp1 = find(soc_mod_HCRC.a2(:,2) == i);
    tmp2 = find(soc_mod_HCRC.b2(:,2) == i);
    tmp3 = find(soc_mod_HCRC.c2(:,2) == i);
    tmp4 = find(soc_mod_HCRC.d2(:,2) == i); 
    ac = corr(soc_mod_HCRC.a2(tmp1,1), soc_mod_HCRC.c2(tmp2,1),'rows','pairwise')
    ad = corr(soc_mod_HCRC.a2(tmp1,1), soc_mod_HCRC.d2(tmp2,1),'rows','pairwise')
    bc = corr(soc_mod_HCRC.b2(tmp1,1), soc_mod_HCRC.c2(tmp2,1),'rows','pairwise')
    bd = corr(soc_mod_HCRC.b2(tmp1,1), soc_mod_HCRC.d2(tmp2,1),'rows','pairwise')
   
    A_BvsC_D2_HCRC(i) = mean([ac ad bc bd]);
end
[n p] = ttest2(A_BvsC_D2_HCHC, A_BvsC_D2_HCRC)


ac = squeeze(HCHCtmp(1,3,:)) 
ad = squeeze(HCHCtmp(1,4,:)) 
bc = squeeze(HCHCtmp(2,3,:)) 
bd = squeeze(HCHCtmp(2,4,:)) 
mean_abcd = mean([ac ad bc bd]')';
A_BvsC_D_HCHC_AV = mean_abcd

ac = squeeze(HCRCtmp(1,3,:)) 
ad = squeeze(HCRCtmp(1,4,:)) 
bc = squeeze(HCRCtmp(2,3,:)) 
bd = squeeze(HCRCtmp(2,4,:)) 
mean_abcd = mean([ac ad bc bd]')';
A_BvsC_D_HCRC_AV = mean_abcd;



[n p] = signrank(A_BvsC_D_HCHC_AV, A_BvsC_D_HCRC_AV)
[n p] = signrank(A_BvsC_D2_HCHC, A_BvsC_D2_HCRC)
mean(A_BvsC_D_HCHC_AV), std(A_BvsC_D_HCHC_AV)./(8^0.5)
mean(A_BvsC_D_HCRC_AV), std(A_BvsC_D_HCRC_AV)./(8^0.5)
mean(A_BvsC_D2_HCHC), std(A_BvsC_D2_HCHC)./(8^0.5)
mean(A_BvsC_D2_HCRC), std(A_BvsC_D2_HCRC)./(8^0.5)


figure;scatter(A_BvsC_D_HCHC_AV, A_BvsC_D_HCRC_AV,'.'); line([-0.10 0.8],[-0.10 0.8])
figure;scatter(A_BvsC_D2_HCHC, A_BvsC_D2_HCRC,'.');hold on;  line([-0.10 0.8],[-0.10 0.8])




%% now do same for home cage exploration

%% compare epochs


%now analyze on a mouse by mouse basis
for i = 1:numel(HCHC)
    tmp = find(nonsoc_mod_HCHC.ab2(:,2) == i);
    ABvsCD2_HCHCns(i) = corr(nonsoc_mod_HCHC.ab2(tmp,1), nonsoc_mod_HCHC.cd2(tmp,1),'rows','pairwise');
end


for i = 1:numel(HCRC)
    tmp = find(nonsoc_mod_HCRC.ab2(:,2) == i);
    ABvsCD2_HCRCns(i) = corr(nonsoc_mod_HCRC.ab2(tmp,1), nonsoc_mod_HCRC.cd2(tmp,1),'rows','pairwise');
end

[n p] = ttest2(ABvsCD2_HCHCns, ABvsCD2_HCRCns)



for i = 1:numel(HCHC)
    tmp = find(nonsoc_mod_HCHC.ab2(:,2) == i);
    ABvsCD_HCHCns(i) = corr(nonsoc_mod_HCHC.ab(tmp,1), nonsoc_mod_HCHC.cd(tmp,1),'rows','pairwise');
end


for i = 1:numel(HCRC)
    tmp = find(nonsoc_mod_HCRC.ab(:,2) == i);
    ABvsCD_HCRCns(i) = corr(nonsoc_mod_HCRC.ab(tmp,1), nonsoc_mod_HCRC.cd(tmp,1),'rows','pairwise');
end
[n p] = signrank(ABvsCD_HCHCns, ABvsCD_HCRCns)


ABvsCD_HCHC_AVns = squeeze(HCHCtmp(12,13,:)) 
ABvsCD_HCRC_AVns = squeeze(HCRCtmp(12,13,:))

figure;scatter(ABvsCD2_HCHCns, ABvsCD2_HCRCns,'.'); line([-0.2 0.9],[-0.2 0.9]);
figure;scatter(ABvsCD_HCHC_AVns, ABvsCD_HCRC_AVns,'.'); line([-0.2 0.9],[-0.2 0.9]);


[n p] = signrank(ABvsCD2_HCHCns, ABvsCD2_HCRCns)
[n p] = signrank(ABvsCD_HCHC_AVns, ABvsCD_HCRC_AVns)
mean(ABvsCD2_HCHCns), std(ABvsCD2_HCHCns)./(8^0.5)
mean(ABvsCD2_HCRCns), std(ABvsCD2_HCRCns)./(8^0.5)
mean(ABvsCD_HCHC_AVns), std(ABvsCD_HCHC_AVns)./(8^0.5)
mean(ABvsCD_HCRC_AVns), std(ABvsCD_HCRC_AVns)./(8^0.5)

figure;scatter(ABvsCD2_HCHCns, ABvsCD2_HCRCns);hold on; scatter(ABvsCD_HCHC_AVns, ABvsCD_HCRC_AVns); line([-1 1],[-1 1])
figure;scatter(ABvsCD2_HCHCns, ABvsCD_HCHC_AVns);hold on; scatter(ABvsCD2_HCRCns, ABvsCD_HCRC_AVns); line([-1 1],[-1 1])



%%

%now analyze on a mouse by mouse basis looking at social context 1 vs
%context 2
for i = 1:numel(HCHC)
    tmp1 = find(nonsoc_mod_HCHC.b2(:,2) == i);
    tmp2 = find(nonsoc_mod_HCHC.c2(:,2) == i);
    BvsC2_HCHCns(i) = corr(nonsoc_mod_HCHC.b2(tmp1,1), nonsoc_mod_HCHC.c2(tmp2,1),'rows','pairwise');
end


for i = 1:numel(HCHC)
    tmp1 = find(nonsoc_mod_HCRC.b2(:,2) == i);
    tmp2 = find(nonsoc_mod_HCRC.c2(:,2) == i);
    BvsC2_HCRCns(i) = corr(nonsoc_mod_HCRC.b2(tmp1,1), nonsoc_mod_HCRC.c2(tmp2,1),'rows','pairwise');
end
[n p] = ttest2(BvsC2_HCHCns, BvsC2_HCRCns)



for i = 1:numel(HCHC)
    tmp1 = find(nonsoc_mod_HCHC.b(:,2) == i);
    tmp2 = find(nonsoc_mod_HCHC.c(:,2) == i);
    BvsC_HCHCns(i) = corr(nonsoc_mod_HCHC.b(tmp1,1), nonsoc_mod_HCHC.c(tmp2,1),'rows','pairwise');
end


for i = 1:numel(HCHC)
    tmp1 = find(nonsoc_mod_HCRC.b(:,2) == i);
    tmp2 = find(nonsoc_mod_HCRC.c(:,2) == i);
    BvsC_HCRCns(i) = corr(nonsoc_mod_HCRC.b(tmp1,1), nonsoc_mod_HCRC.c(tmp2,1),'rows','pairwise');
end
[n p] = ttest2(BvsC_HCHCns, BvsC_HCRCns)


BvsC_HCHC_AVns = squeeze(HCHCtmp(6,7,:)) 
BvsC_HCRC_AVns = squeeze(HCRCtmp(6,7,:))

[n p] = signrank(BvsC_HCHC_AVns, BvsC_HCRC_AVns)
[n p] = signrank(BvsC2_HCHCns, BvsC2_HCRCns)
mean(BvsC_HCHC_AVns), std(BvsC_HCHC_AVns)/(8^0.5)
mean(BvsC_HCRC_AVns), std(BvsC_HCRC_AVns)/(8^0.5)
mean(BvsC2_HCHCns), std(BvsC2_HCHCns)/(8^0.5)
mean(BvsC2_HCRCns), std(BvsC2_HCRCns)/(8^0.5)

figure;scatter(BvsC_HCHC_AVns, BvsC_HCRC_AVns,'.'); line([-0.40 0.8],[-0.40 0.8])
figure;scatter(BvsC2_HCHCns, BvsC2_HCRCns,'.');hold on;  line([-0.40 0.8],[-0.40 0.8])

%%
%now average A and B vs C and D


%now analyze on a mouse by mouse basis looking at social context 1 vs
%context 2
for i = 1:numel(HCHC)
    tmp1 = find(nonsoc_mod_HCHC.a2(:,2) == i);
    tmp2 = find(nonsoc_mod_HCHC.b2(:,2) == i);
    tmp3 = find(nonsoc_mod_HCHC.c2(:,2) == i);
    tmp4 = find(nonsoc_mod_HCHC.d2(:,2) == i); 
    ac = corr(nonsoc_mod_HCHC.a2(tmp1,1), nonsoc_mod_HCHC.c2(tmp2,1),'rows','pairwise')
    ad = corr(nonsoc_mod_HCHC.a2(tmp1,1), nonsoc_mod_HCHC.d2(tmp2,1),'rows','pairwise')
    bc = corr(nonsoc_mod_HCHC.b2(tmp1,1), nonsoc_mod_HCHC.c2(tmp2,1),'rows','pairwise')
    bd = corr(nonsoc_mod_HCHC.b2(tmp1,1), nonsoc_mod_HCHC.d2(tmp2,1),'rows','pairwise')
   
    A_BvsC_D2_HCHCns(i) = mean([ac ad bc bd]);
end


for i = 1:numel(HCRC)
    tmp1 = find(nonsoc_mod_HCRC.a2(:,2) == i);
    tmp2 = find(nonsoc_mod_HCRC.b2(:,2) == i);
    tmp3 = find(nonsoc_mod_HCRC.c2(:,2) == i);
    tmp4 = find(nonsoc_mod_HCRC.d2(:,2) == i); 
    ac = corr(nonsoc_mod_HCRC.a2(tmp1,1), nonsoc_mod_HCRC.c2(tmp2,1),'rows','pairwise')
    ad = corr(nonsoc_mod_HCRC.a2(tmp1,1), nonsoc_mod_HCRC.d2(tmp2,1),'rows','pairwise')
    bc = corr(nonsoc_mod_HCRC.b2(tmp1,1), nonsoc_mod_HCRC.c2(tmp2,1),'rows','pairwise')
    bd = corr(nonsoc_mod_HCRC.b2(tmp1,1), nonsoc_mod_HCRC.d2(tmp2,1),'rows','pairwise')
   
    A_BvsC_D2_HCRCns(i) = mean([ac ad bc bd]);
end
[n p] = ttest2(A_BvsC_D2_HCHCns, A_BvsC_D2_HCRCns)


ac = squeeze(HCHCtmp(5,7,:)) 
ad = squeeze(HCHCtmp(5,8,:)) 
bc = squeeze(HCHCtmp(6,7,:)) 
bd = squeeze(HCHCtmp(6,8,:)) 
mean_abcd = mean([ac ad bc bd]')';
A_BvsC_D_HCHC_AVns = mean_abcd

ac = squeeze(HCRCtmp(5,7,:)) 
ad = squeeze(HCRCtmp(5,8,:)) 
bc = squeeze(HCRCtmp(6,7,:)) 
bd = squeeze(HCRCtmp(6,8,:)) 
mean_abcd = mean([ac ad bc bd]')';
A_BvsC_D_HCRC_AVns = mean_abcd;



[n p] = signrank(A_BvsC_D_HCHC_AVns, A_BvsC_D_HCRC_AVns)
[n p] = signrank(A_BvsC_D2_HCHCns, A_BvsC_D2_HCRCns)
mean(A_BvsC_D_HCHC_AVns), std(A_BvsC_D_HCHC_AVns)./(8^0.5)
mean(A_BvsC_D_HCRC_AVns), std(A_BvsC_D_HCRC_AVns)./(8^0.5)
mean(A_BvsC_D2_HCHCns), std(A_BvsC_D2_HCHCns)./(8^0.5)
mean(A_BvsC_D2_HCRCns), std(A_BvsC_D2_HCRCns)./(8^0.5)

figure;scatter(A_BvsC_D_HCHC_AVns, A_BvsC_D_HCRC_AVns,'.'); line([-0.20 0.8],[-0.20 0.8])
figure;scatter(A_BvsC_D2_HCHCns, A_BvsC_D2_HCRCns,'.');hold on;  line([-0.20 0.8],[-0.20 0.8])







%%
%classify social vs nonsocial
%1. acrross all epochs
%2. train on one epoch and test on another
%uses svm_MI function [MI,performance, Beta] = svm_MI(AB, ab, iterations, holdout)
clear tmp MI performance Beta performance_AvB performance_allshuffledtest performance_AvBshuf
iterations = 500
mice = [HCRC HCHC]
for i = mice(1:end)
    i
    raster = inscopix;
    tmp.a1 = raster{i}(:,SOCIAL{i} == 2); %social
    tmp.b1 = raster{i}(:,SOCIAL{i} == 12); %nonsocial

    tmp.a2 = raster{i}(:,SOCIAL{i} == 3); %social
    tmp.b2 = raster{i}(:,SOCIAL{i} == 13); %nonsocial
    
    tmp.a3 = raster{i}(:,SOCIAL{i} == 4); %social
    tmp.b3 = raster{i}(:,SOCIAL{i} == 14); %nonsocial

    tmp.a4 = raster{i}(:,SOCIAL{i} == 5); %social
    tmp.b4 = raster{i}(:,SOCIAL{i} == 15);  %nonsocial
    
    tmp.ab = raster{i}(:,(SOCIAL{i} == 2) | SOCIAL{i} == 3); %social
    tmp.cd = raster{i}(:,(SOCIAL{i} == 4) | SOCIAL{i} == 5); %social
    tmp.abcd = raster{i}(:, SOCIAL{i} == 2 |SOCIAL{i} == 3 | SOCIAL{i} == 4 |SOCIAL{i} == 5); %social
    
    tmp.abns = raster{i}(:,(SOCIAL{i} == 12) | SOCIAL{i} == 13); %nonsocial
    tmp.cdns = raster{i}(:,(SOCIAL{i} == 14) | SOCIAL{i} == 15); %nonsocial
    tmp.abcdns = raster{i}(:, SOCIAL{i} == 12 |SOCIAL{i} == 13 | SOCIAL{i} == 14 |SOCIAL{i} == 15); %nonsocial 
    
    
    %all social vs nonsocial frames
    soc_frames_all = [ones(1,size(tmp.a1,2)) zeros(1,size(tmp.b1,2)) ones(1,size(tmp.a2,2)) zeros(1,size(tmp.b2,2)) ones(1,size(tmp.a3,2)) zeros(1,size(tmp.b3,2)) ones(1,size(tmp.a4,2)) zeros(1,size(tmp.b4,2))];
    soc_raster_all = [tmp.a1 tmp.b1 tmp.a2 tmp.b2 tmp.a3 tmp.b3 tmp.a4 tmp.b4];
    [MI.all{i},performance.all(i,:), Beta.all{i}] = svm_MI(soc_raster_all, soc_frames_all+1, 100, .25);
    %shuffled
    [MI.allshuf{i},performance.allshuf(i,:), Beta.allshuf{i}] = svm_MI(random_shuf(soc_raster_all) , soc_frames_all+1, 100, .25);
    
    %individual epochs
    soc_frames{1} = [ones(1,size(tmp.a1,2)) zeros(1,size(tmp.b1,2)) ];
    soc_raster{1} = [tmp.a1 tmp.b1];
    [MI.a{i},performance.a(i,:), Beta.a{i}] = svm_MI(soc_raster{1}, soc_frames{1}+1, 100, .2);    
    %shuffled
    [MI.ashuf{i},performance.ashuf(i,:), Beta.ashuf{i}] = svm_MI(random_shuf(soc_raster{1}) , soc_frames{1}+1, 100, .2);
        
    soc_frames{2} = [ones(1,size(tmp.a2,2)) zeros(1,size(tmp.b2,2)) ];
    soc_raster{2} = [tmp.a2 tmp.b2];
    [MI.b{i},performance.b(i,:), Beta.b{i}] = svm_MI(soc_raster{2}, soc_frames{2}+1, 100, .2);     
    %shuffled
    [MI.bshuf{i},performance.bshuf(i,:), Beta.bshuf{i}] = svm_MI(random_shuf(soc_raster{2}) , soc_frames{2}+1, 100, .2);
         
    soc_frames{3} = [ones(1,size(tmp.a3,2)) zeros(1,size(tmp.b3,2)) ];
    soc_raster{3} = [tmp.a3 tmp.b3];
    [MI.c{i},performance.c(i,:), Beta.c{i}] = svm_MI(soc_raster{3}, soc_frames{3}+1, 100, .2);    
    %shuffled
    [MI.cshuf{i},performance.cshuf(i,:), Beta.cshuf{i}] = svm_MI(random_shuf(soc_raster{3}) , soc_frames{3}+1, 100, .2);
        
    soc_frames{4} = [ones(1,size(tmp.a4,2)) zeros(1,size(tmp.b4,2)) ];
    soc_raster{4} = [tmp.a4 tmp.b4];
    [MI.d{i},performance.d(i,:), Beta.d{i}] = svm_MI(soc_raster{4}, soc_frames{4}+1, 100, .2);    
    %shuffled
    [MI.dshuf{i},performance.dshuf(i,:), Beta.dshuf{i}] = svm_MI(random_shuf(soc_raster{4}) , soc_frames{4}+1, 100, .2);
            
%train and then test on shuffled data
[obj obj2] = svm_MI_training(soc_raster_all, soc_frames_all+1, iterations);
[performance_allshuffledtest(i,:)] = svm_MI_testing(random_shuf(soc_raster_all), soc_frames_all+1, iterations, obj, obj2);


    
    
%train on one and test on another   clear soc_frames 

for n = 1:4
    n
    for nn = 1:4
        [obj obj2] = svm_MI_training(soc_raster{n}, soc_frames{n}+1, iterations);
        [performance_AvB{i}{n, nn}] = svm_MI_testing(soc_raster{nn}, soc_frames{nn}+1, iterations, obj, obj2);
        %shuffled
            [performance_AvBshuf{i}{n, nn}] = svm_MI_testing(circ_shuf(soc_raster{nn}, size(soc_raster{nn},2)), soc_frames{nn}+1, iterations, obj, obj2);

    end
end

end



signrank(performance.all(HCHC,2),performance.all(HCRC,2))
figure; scatter(performance.all(HCHC,2),performance.all(HCRC,2),'.')
hold on; scatter(performance_allshuffledtest(HCHC,2),performance_allshuffledtest(HCRC,2),'.')
hold on; line ([0.4 0.8], [0.4 0.8])
mean(performance.all(HCHC,2)), std(performance.all(HCHC,2))./(8^0.5)
mean(performance.all(HCRC,2)), std(performance.all(HCRC,2))./(8^0.5)
mean(performance_allshuffledtest(HCHC,2)), std(performance_allshuffledtest(HCHC,2))./(8^0.5)
mean(performance_allshuffledtest(HCRC,2)), std(performance_allshuffledtest(HCRC,2))./(8^0.5)


signrank(performance.a(HCHC,2),performance.a(HCRC,2))
figure; scatter(performance.a(HCHC,2),performance.a(HCRC,2),'.')
hold on; scatter(performance.ashuf(HCHC,2),performance.ashuf(HCRC,2),'.')
hold on; line ([0.45 0.85], [0.45 0.85])
mean(performance.a(HCHC,2)), std(performance.a(HCHC,2))./(8^0.5)
mean(performance.a(HCRC,2)), std(performance.a(HCRC,2))./(8^0.5)
mean(performance.ashuf(HCHC,2)), std(performance.ashuf(HCHC,2))./(8^0.5)
mean(performance.ashuf(HCRC,2)), std(performance.ashuf(HCRC,2))./(8^0.5)


signrank(performance.b(HCHC,2),performance.b(HCRC,2))
figure; scatter(performance.b(HCHC,2),performance.b(HCRC,2),'.')
hold on; scatter(performance.bshuf(HCHC,2),performance.bshuf(HCRC,2),'.')
hold on; line ([0.45 0.85], [0.45 0.85])

mean(performance.b(HCHC,2)), std(performance.b(HCHC,2))./(8^0.5)
mean(performance.b(HCRC,2)), std(performance.b(HCRC,2))./(8^0.5)
mean(performance.bshuf(HCHC,2)), std(performance.bshuf(HCHC,2))./(8^0.5)
mean(performance.bshuf(HCRC,2)), std(performance.bshuf(HCRC,2))./(8^0.5)

signrank(performance.c(HCHC,2),performance.c(HCRC,2))
figure; scatter(performance.c(HCHC,2),performance.c(HCRC,2),'.')
hold on; scatter(performance.cshuf(HCHC,2),performance.cshuf(HCRC,2),'.')
hold on; line ([0.45 0.85], [0.45 0.85])
mean(performance.c(HCHC,2)), std(performance.c(HCHC,2))./(8^0.5)
mean(performance.c(HCRC,2)), std(performance.c(HCRC,2))./(8^0.5)
mean(performance.cshuf(HCHC,2)), std(performance.cshuf(HCHC,2))./(8^0.5)
mean(performance.cshuf(HCRC,2)), std(performance.cshuf(HCRC,2))./(8^0.5)

signrank(performance.d(HCHC,2),performance.d(HCRC,2))
figure; scatter(performance.d(HCHC,2),performance.d(HCRC,2),'.')
hold on; scatter(performance.dshuf(HCHC,2),performance.dshuf(HCRC,2),'.')
hold on; line ([0.45 0.85], [0.45 0.85])
mean(performance.d(HCHC,2)), std(performance.d(HCHC,2))./(8^0.5)
mean(performance.d(HCRC,2)), std(performance.d(HCRC,2))./(8^0.5)
mean(performance.dshuf(HCHC,2)), std(performance.dshuf(HCHC,2))./(8^0.5)
mean(performance.dshuf(HCRC,2)), std(performance.dshuf(HCRC,2))./(8^0.5)

figure; scatter(performance.all(HCHC,2), performance.all(HCRC,2),'.')
hold on; scatter(performance.allshuf(HCHC,2), performance.allshuf(HCRC,2),'.')
line ([0.5 0.8], [0.5 0.8])
axis ([0.5 0.8 0.5 0.8])
mean(performance.all(HCHC,2)), std(performance.all(HCHC,2))./(8^0.5)
mean(performance.all(HCRC,2)), std(performance.all(HCRC,2))./(8^0.5)
mean(performance.allshuf(HCHC,2)), std(performance.allshuf(HCHC,2))./(8^0.5)
mean(performance.allshuf(HCRC,2)), std(performance.allshuf(HCRC,2))./(8^0.5)

for i = mice
    for n = 1:4
        for nn = 1:4
    perf.svm(n,nn,i) = performance_AvB{i}{n,nn}(2);
    perf.svmshuf(n,nn,i) = performance_AvBshuf{i}{n,nn}(2);    
        end
    end
end
for i = 1:4; perf.svm(i,i,:) = nan; perf.svmshuf(i,i,:) = nan; end;
figure; imagesc(mean(perf.svm(:,:, HCHC),3)); caxis([0.5 0.65])
figure; imagesc(mean(perf.svm(:,:, HCRC),3)); caxis([0.5 0.65])
figure; imagesc(mean(perf.svmshuf(:,:, HCHC),3)); caxis([0.5 0.65])
figure; imagesc(mean(perf.svmshuf(:,:, HCRC),3)); caxis([0.5 0.65])

%mean by mouse
%first within context
tmp = (perf.svm([1 2],[1 2], HCHC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)
tmp = (perf.svm([1 2],[1 2], HCRC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)

%between context
tmp = (perf.svm([1 2],[3 4], HCHC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)
tmp = (perf.svm([1 2],[3 4], HCRC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)

%now same comparisons for shuffled data
%first within context
tmp = (perf.svmshuf([1 2],[1 2], HCHC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)
tmp = (perf.svmshuf([1 2],[1 2], HCRC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)

%between context
tmp = (perf.svmshuf([1 2],[3 4], HCHC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)
tmp = (perf.svmshuf([1 2],[3 4], HCRC)); tmp = squeeze(mean(mean(tmp(:,:,:),2,'omitnan'))),, mean(tmp),std(tmp)./(numel(tmp)^0.5)





%% calculate cosine similarity between 1. Social ensembles (context abcd) and 2. context ensembles ab vs cd

%first define the two ensembles (social and context) for HCHC and HCRC

soc_mod_HCRC.abcd2 
contextAB_mod_HCRC.abvcd2

for i = 1:8
 tmp = find(soc_mod_HCHC.abcd2 (:,2) == i);
 tmp2 = find(contextAB_mod_HCHC.abvcd2(:,2) == i);
    
 [cossim_HCHC(i) theta(i)]= cossim(soc_mod_HCHC.abcd2(tmp,1)'-0.5, (contextAB_mod_HCHC.abvcd2(tmp2,1)')-0.5,1);

 tmp = find(soc_mod_HCRC.abcd2 (:,2) == i);
 tmp2 = find(contextAB_mod_HCRC.abvcd2(:,2) == i);
    
 [cossim_HCRC(i) theta(i)]= cossim(soc_mod_HCRC.abcd2(tmp,1)'-0.5, contextAB_mod_HCRC.abvcd2(tmp2,1)'-0.5,1); 
    %have to center at zero

end


%now compare social ensembles for AB and CD, nonsocial ensembles for AB and
%CD, and context ensembles made with only social or nonsocial frames from AB and CD.
all_cossim_HCHC = []; all_theta_HCHC = [];
for i = 1:8
 %social and nonsocial
 tmp1 = find(soc_mod_HCHC.ab2 (:,2) == i); %social AB
 tmp2 = find(soc_mod_HCHC.cd2 (:,2) == i); %Social CD
 tmp3 = find(nonsoc_mod_HCHC.ab2 (:,2) == i); %nonsocial AB
 tmp4 = find(nonsoc_mod_HCHC.cd2 (:,2) == i); %nonsocial CD 
 
 %context
 tmp5 = find(contextAB_mod_HCHC.abvcd2SOC (:,2) == i); %context AB SOCIAL frames
 tmp6 = find(contextCD_mod_HCHC.abvcd2SOC (:,2) == i); %context CD SOCIAL frames
 tmp7 = find(contextAB_mod_HCHC.abvcd2NONSOC (:,2) == i); %context AB NONSOC frames
 tmp8 = find(contextCD_mod_HCHC.abvcd2NONSOC (:,2) == i); %context CD NONSOC frames
 tmp9 = find(contextAB_mod_HCHC.abvcd2 (:,2) == i); %context AB all frames
 tmp10= find(contextCD_mod_HCHC.abvcd2 (:,2) == i); %context CD all frames
 

 tmp = [soc_mod_HCHC.ab2(tmp1,1)...
     soc_mod_HCHC.cd2(tmp2,1)...
     nonsoc_mod_HCHC.ab2(tmp3,1)...
     nonsoc_mod_HCHC.cd2(tmp4,1)...
     contextAB_mod_HCHC.abvcd2SOC(tmp5,1)...
     contextCD_mod_HCHC.abvcd2SOC(tmp6,1)...
     contextAB_mod_HCHC.abvcd2NONSOC(tmp7,1)...
     contextCD_mod_HCHC.abvcd2NONSOC(tmp8,1)...
     contextAB_mod_HCHC.abvcd2(tmp9,1)...
     contextCD_mod_HCHC.abvcd2(tmp10,1)];
 
 
 for n = 1:10
     for p = 1:10
    [all_cossim_HCHC(n,p,i) all_theta_HCHC(n,p,i)]= cossim(tmp(:,n)'-0.5, tmp(:,p)'-0.5,1);
     end
 end
end

all_cossim_HCRC = []; all_theta_HCRC = [];
for i = 1:8
 %social and nonsocial
 tmp1 = find(soc_mod_HCRC.ab2 (:,2) == i); %social AB
 tmp2 = find(soc_mod_HCRC.cd2 (:,2) == i); %Social CD
 tmp3 = find(nonsoc_mod_HCRC.ab2 (:,2) == i); %social AB
 tmp4 = find(nonsoc_mod_HCRC.cd2 (:,2) == i); %Social CD 
 
 %context
 tmp5 = find(contextAB_mod_HCRC.abvcd2SOC (:,2) == i); %context AB SOCIAL frames
 tmp6 = find(contextCD_mod_HCRC.abvcd2SOC (:,2) == i); %context CD SOCIAL frames
 tmp7 = find(contextAB_mod_HCRC.abvcd2NONSOC (:,2) == i); %context AB NONSOC frames
 tmp8 = find(contextCD_mod_HCRC.abvcd2NONSOC (:,2) == i); %context CD NONSOC frames
 tmp9 = find(contextAB_mod_HCRC.abvcd2 (:,2) == i); %context AB all frames
 tmp10= find(contextCD_mod_HCRC.abvcd2 (:,2) == i); %context CD all frames
 

 tmp = [soc_mod_HCRC.ab2(tmp1,1)...
     soc_mod_HCRC.cd2(tmp2,1)...
     nonsoc_mod_HCRC.ab2(tmp3,1)...
     nonsoc_mod_HCRC.cd2(tmp4,1)...
     contextAB_mod_HCRC.abvcd2SOC(tmp5,1)...
     contextCD_mod_HCRC.abvcd2SOC(tmp6,1)...
     contextAB_mod_HCRC.abvcd2NONSOC(tmp7,1)...
     contextCD_mod_HCRC.abvcd2NONSOC(tmp8,1)...
     contextAB_mod_HCRC.abvcd2(tmp9,1)...
     contextCD_mod_HCRC.abvcd2(tmp10,1)];
 
 
 for n = 1:10
     for p = 1:10
    [all_cossim_HCRC(n,p,i) all_theta_HCRC(n,p,i)]= cossim(tmp(:,n)'-0.5, tmp(:,p)'-0.5,1);
     end
 end
end








 

figure; imagesc(mean(all_cossim_HCHC,3))
figure; imagesc(mean(all_cossim_HCRC,3))
figure; plot(mean(all_cossim_HCHC(1,:,:),3)); hold on; plot(mean(all_cossim_HCRC(1,:,:),3))

figure; plot(mean(all_cossim_HCHC(2,:,:),3)); hold on; plot(mean(all_cossim_HCRC(2,:,:),3))

%% calculate cosine similarity between 1. Social ensembles (context abcd) and 2. context ensembles ab vs cd



%now compare social ensembles for AB and CD, nonsocial ensembles for AB and
%CD, and context ensembles made with only social or nonsocial frames from AB and CD.
all_cossim_HCHC = []; all_theta_HCHC = [];
for i = 1:8
 %social and nonsocial
 tmp1 = find(soc_mod_HCHC.ab2 (:,2) == i); %social AB
 tmp2 = find(soc_mod_HCHC.cd2 (:,2) == i); %Social CD
 tmp3 = find(nonsoc_mod_HCHC.ab2 (:,2) == i); %nonsocial AB
 tmp4 = find(nonsoc_mod_HCHC.cd2 (:,2) == i); %nonsocial CD 
 
 %context
 tmp5 = find(contextAB_mod_HCHC.abvcd2SOC (:,2) == i); %context AB SOCIAL frames
 tmp6 = find(contextCD_mod_HCHC.abvcd2SOC (:,2) == i); %context CD SOCIAL frames
 tmp7 = find(contextAB_mod_HCHC.abvcd2NONSOC (:,2) == i); %context AB NONSOC frames
 tmp8 = find(contextCD_mod_HCHC.abvcd2NONSOC (:,2) == i); %context CD NONSOC frames
 tmp9 = find(contextAB_mod_HCHC.abvcd2 (:,2) == i); %context AB all frames
 tmp10= find(contextCD_mod_HCHC.abvcd2 (:,2) == i); %context CD all frames
 
    %remove social and nonsocial frame derived context enesmeble
 tmp = [soc_mod_HCHC.ab2(tmp1,1)...
     soc_mod_HCHC.cd2(tmp2,1)...
     nonsoc_mod_HCHC.ab2(tmp3,1)...
     nonsoc_mod_HCHC.cd2(tmp4,1)...
     contextAB_mod_HCHC.abvcd2(tmp9,1)...
     contextCD_mod_HCHC.abvcd2(tmp10,1)];
 
 
 for n = 1:6
     for p = 1:6
    [all_cossim_HCHC(n,p,i) all_theta_HCHC(n,p,i)]= cossim(tmp(:,n)'-0.5, tmp(:,p)'-0.5,1);
    [all_cossim_shuf_HCHC(n,p,i) all_theta_HCHC(n,p,i)]= cossim(tmp(:,n)'-0.5, circ_shuf(tmp(:,p)'-0.5,30),1);
     end
 end
end

all_cossim_HCRC = []; all_theta_HCRC = [];
for i = 1:8
 %social and nonsocial
 tmp1 = find(soc_mod_HCRC.ab2 (:,2) == i); %social AB
 tmp2 = find(soc_mod_HCRC.cd2 (:,2) == i); %Social CD
 tmp3 = find(nonsoc_mod_HCRC.ab2 (:,2) == i); %social AB
 tmp4 = find(nonsoc_mod_HCRC.cd2 (:,2) == i); %Social CD 
 
 %context
 tmp5 = find(contextAB_mod_HCRC.abvcd2SOC (:,2) == i); %context AB SOCIAL frames
 tmp6 = find(contextCD_mod_HCRC.abvcd2SOC (:,2) == i); %context CD SOCIAL frames
 tmp7 = find(contextAB_mod_HCRC.abvcd2NONSOC (:,2) == i); %context AB NONSOC frames
 tmp8 = find(contextCD_mod_HCRC.abvcd2NONSOC (:,2) == i); %context CD NONSOC frames
 tmp9 = find(contextAB_mod_HCRC.abvcd2 (:,2) == i); %context AB all frames
 tmp10= find(contextCD_mod_HCRC.abvcd2 (:,2) == i); %context CD all frames
 
    %remove social and nonsocial context ensemble
 tmp = [soc_mod_HCRC.ab2(tmp1,1)...
     soc_mod_HCRC.cd2(tmp2,1)...
     nonsoc_mod_HCRC.ab2(tmp3,1)...
     nonsoc_mod_HCRC.cd2(tmp4,1)...
     contextAB_mod_HCRC.abvcd2(tmp9,1)...
     contextCD_mod_HCRC.abvcd2(tmp10,1)];
 
 
 for n = 1:6
     for p = 1:6
    [all_cossim_HCRC(n,p,i) all_theta_HCRC(n,p,i)]= cossim(tmp(:,n)'-0.5, tmp(:,p)'-0.5,1);
    [all_cossim_shuf_HCRC(n,p,i) all_theta_HCRC(n,p,i)]= cossim(tmp(:,n)'-0.5, circ_shuf(tmp(:,p)'-0.5,30),1);
     end
 end
end








 
cspace = ([-0.9 1])
figure; imagesc(mean(all_cossim_HCHC,3)); caxis(cspace)
figure; imagesc(mean(all_cossim_HCRC,3));  caxis(cspace)
figure; imagesc(mean(all_cossim_shuf_HCHC,3));  caxis(cspace)
figure; imagesc(mean(all_cossim_shuf_HCRC,3));  caxis(cspace)
figure; plot(mean(all_cossim_HCHC(1,:,:),3)); hold on; plot(mean(all_cossim_HCRC(1,:,:),3))

figure; plot(mean(all_cossim_HCHC(2,:,:),3)); hold on; plot(mean(all_cossim_HCRC(2,:,:),3))


