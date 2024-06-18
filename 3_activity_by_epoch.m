%3compare overall activity during different epochs
%there are 9 epochs (HC1 HC2 HC3 HC4 HC5 HC6, as well as EZM, EPM, XM)
%calcute 1. mean activity by epoch and then 2. calculate activity vectors to
%compare overall ensemble reorganization, finally calculate correlations
%during each epoch

%will look at different behaviors (sub-epochs) within each epoch in later script

%input for each mouse is cell matrix consisting of activity of each nueron
%over time and a structure matrix containing the beginning and end of each
%epoch

%first step is to make activity rasters or calcium tracces confined to
%given epochs. Will make both calcium traces and rasters for later analysis


%
calcium_epoch = []
raster_epoch = []

dir{1} = 4099436
calcium_epoch{1}.HC1 = calcium{1}(:,mazes.m4099436.HC1(1,1):mazes.m4099436.HC1(1,2));
calcium_epoch{1}.HC2 = calcium{1}(:,mazes.m4099436.HC2(1,1):mazes.m4099436.HC2(1,2));
calcium_epoch{1}.HC3 = calcium{1}(:,mazes.m4099436.HC3(1,1):mazes.m4099436.HC3(1,2));
calcium_epoch{1}.HC4 = calcium{1}(:,mazes.m4099436.HC4(1,1):mazes.m4099436.HC4(1,2));
calcium_epoch{1}.HC5 = calcium{1}(:,mazes.m4099436.HC5(1,1):mazes.m4099436.HC5(1,2));
calcium_epoch{1}.HC6 = calcium{1}(:,mazes.m4099436.HC6(1,1):mazes.m4099436.HC6(1,2));
calcium_epoch{1}.EZM = calcium{1}(:,mazes.m4099436.EZM(1,1):mazes.m4099436.EZM(1,2));
calcium_epoch{1}.EPM = calcium{1}(:,mazes.m4099436.EPM(1,1):mazes.m4099436.EPM(1,2));
calcium_epoch{1}.XM  = calcium{1}(:,mazes.m4099436.XM(1,1):mazes.m4099436.XM(1,2));

%EPM arms
calcium_epoch{1}.EPM_open_left  = []; for i = 1:size(EPM.open.left.m4099436,1);  calcium_epoch{1}.EPM_open_left  = [calcium_epoch{1}.EPM_open_left      calcium{1}(:,EPM.open.left.m4099436(i,1):EPM.open.left.m4099436(i,2))]; end
calcium_epoch{1}.EPM_open_right = []; for i = 1:size(EPM.open.right.m4099436,1); calcium_epoch{1}.EPM_open_right  = [calcium_epoch{1}.EPM_open_right    calcium{1}(:,EPM.open.right.m4099436(i,1):EPM.open.right.m4099436(i,2))]; end
calcium_epoch{1}.EPM_closed_top = []; for i = 1:size(EPM.closed.top.m4099436,1); calcium_epoch{1}.EPM_closed_top  = [calcium_epoch{1}.EPM_closed_top    calcium{1}(:,EPM.closed.top.m4099436(i,1):EPM.closed.top.m4099436(i,2))]; end
calcium_epoch{1}.EPM_closed_bottom = []; for i = 1:size(EPM.closed.bottom.m4099436,1); calcium_epoch{1}.EPM_closed_bottom  = [calcium_epoch{1}.EPM_closed_bottom    calcium{1}(:,EPM.closed.bottom.m4099436(i,1):EPM.closed.bottom.m4099436(i,2))]; end

%EZM arms
calcium_epoch{1}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4099436,1);               calcium_epoch{1}.EZM_open_left  = [calcium_epoch{1}.EZM_open_left                           calcium{1}(:,EZM.open.left.m4099436(i,1):EZM.open.left.m4099436(i,2))]; end
calcium_epoch{1}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4099436,1);              calcium_epoch{1}.EZM_open_right  = [calcium_epoch{1}.EZM_open_right                         calcium{1}(:,EZM.open.right.m4099436(i,1):EZM.open.right.m4099436(i,2))]; end
calcium_epoch{1}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4099436,1);     calcium_epoch{1}.EZM_closed_topfromedge  = [calcium_epoch{1}.EZM_closed_topfromedge         calcium{1}(:,EZM.closed.top.fromedge.m4099436(i,1):EZM.closed.top.fromedge.m4099436(i,2))]; end
calcium_epoch{1}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4099436,1);     calcium_epoch{1}.EZM_closed_topfromopen  = [calcium_epoch{1}.EZM_closed_topfromopen         calcium{1}(:,EZM.closed.top.fromopen.m4099436(i,1):EZM.closed.top.fromopen.m4099436(i,2))]; end
calcium_epoch{1}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4099436,1);  calcium_epoch{1}.EZM_closed_bottomfromedge  = [calcium_epoch{1}.EZM_closed_bottomfromedge   calcium{1}(:,EZM.closed.bottom.fromedge.m4099436(i,1):EZM.closed.bottom.fromedge.m4099436(i,2))]; end
calcium_epoch{1}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4099436,1);  calcium_epoch{1}.EZM_closed_bottomfromopen  = [calcium_epoch{1}.EZM_closed_bottomfromopen   calcium{1}(:,EZM.closed.bottom.fromopen.m4099436(i,1):EZM.closed.bottom.fromopen.m4099436(i,2))]; end

%XM arms
calcium_epoch{1}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4099436,1);     calcium_epoch{1}.XM_longarm_top  = [calcium_epoch{1}.XM_longarm_top         calcium{1}(:,XM.Longarm.top.m4099436(i,1):XM.Longarm.top.m4099436(i,2))]; end
calcium_epoch{1}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4099436,1);  calcium_epoch{1}.XM_longarm_bottom  = [calcium_epoch{1}.XM_longarm_bottom   calcium{1}(:,XM.Longarm.bottom.m4099436(i,1):XM.Longarm.bottom.m4099436(i,2))]; end
calcium_epoch{1}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4099436,1);        calcium_epoch{1}.XM_shortarm  = [calcium_epoch{1}.XM_shortarm               calcium{1}(:,XM.shortarm.m4099436(i,1):XM.shortarm.m4099436(i,2))]; end


raster_epoch{1}.HC1 = inscopix{1}(:,mazes.m4099436.HC1(1,1):mazes.m4099436.HC1(1,2));
raster_epoch{1}.HC2 = inscopix{1}(:,mazes.m4099436.HC2(1,1):mazes.m4099436.HC2(1,2));
raster_epoch{1}.HC3 = inscopix{1}(:,mazes.m4099436.HC3(1,1):mazes.m4099436.HC3(1,2));
raster_epoch{1}.HC4 = inscopix{1}(:,mazes.m4099436.HC4(1,1):mazes.m4099436.HC4(1,2));
raster_epoch{1}.HC5 = inscopix{1}(:,mazes.m4099436.HC5(1,1):mazes.m4099436.HC5(1,2));
raster_epoch{1}.HC6 = inscopix{1}(:,mazes.m4099436.HC6(1,1):mazes.m4099436.HC6(1,2));
raster_epoch{1}.EZM = inscopix{1}(:,mazes.m4099436.EZM(1,1):mazes.m4099436.EZM(1,2));
raster_epoch{1}.EPM = inscopix{1}(:,mazes.m4099436.EPM(1,1):mazes.m4099436.EPM(1,2));
raster_epoch{1}.XM  = inscopix{1}(:,mazes.m4099436.XM(1,1):mazes.m4099436.XM(1,2));

%EPM arms
raster_epoch{1}.EPM_open_left  = []; for i = 1:size(EPM.open.left.m4099436,1);  raster_epoch{1}.EPM_open_left  = [raster_epoch{1}.EPM_open_left      calcium{1}(:,EPM.open.left.m4099436(i,1):EPM.open.left.m4099436(i,2))]; end
raster_epoch{1}.EPM_open_right = []; for i = 1:size(EPM.open.right.m4099436,1); raster_epoch{1}.EPM_open_right  = [raster_epoch{1}.EPM_open_right    calcium{1}(:,EPM.open.right.m4099436(i,1):EPM.open.right.m4099436(i,2))]; end
raster_epoch{1}.EPM_closed_top = []; for i = 1:size(EPM.closed.top.m4099436,1); raster_epoch{1}.EPM_closed_top  = [raster_epoch{1}.EPM_closed_top    calcium{1}(:,EPM.closed.top.m4099436(i,1):EPM.closed.top.m4099436(i,2))]; end
raster_epoch{1}.EPM_closed_bottom = []; for i = 1:size(EPM.closed.bottom.m4099436,1); raster_epoch{1}.EPM_closed_bottom  = [raster_epoch{1}.EPM_closed_bottom    calcium{1}(:,EPM.closed.bottom.m4099436(i,1):EPM.closed.bottom.m4099436(i,2))]; end

%EZM arms
raster_epoch{1}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4099436,1);               raster_epoch{1}.EZM_open_left  = [raster_epoch{1}.EZM_open_left                           inscopix{1}(:,EZM.open.left.m4099436(i,1):EZM.open.left.m4099436(i,2))]; end
raster_epoch{1}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4099436,1);              raster_epoch{1}.EZM_open_right  = [raster_epoch{1}.EZM_open_right                         inscopix{1}(:,EZM.open.right.m4099436(i,1):EZM.open.right.m4099436(i,2))]; end
raster_epoch{1}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4099436,1);     raster_epoch{1}.EZM_closed_topfromedge  = [raster_epoch{1}.EZM_closed_topfromedge         inscopix{1}(:,EZM.closed.top.fromedge.m4099436(i,1):EZM.closed.top.fromedge.m4099436(i,2))]; end
raster_epoch{1}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4099436,1);     raster_epoch{1}.EZM_closed_topfromopen  = [raster_epoch{1}.EZM_closed_topfromopen         inscopix{1}(:,EZM.closed.top.fromopen.m4099436(i,1):EZM.closed.top.fromopen.m4099436(i,2))]; end
raster_epoch{1}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4099436,1);  raster_epoch{1}.EZM_closed_bottomfromedge  = [raster_epoch{1}.EZM_closed_bottomfromedge   inscopix{1}(:,EZM.closed.bottom.fromedge.m4099436(i,1):EZM.closed.bottom.fromedge.m4099436(i,2))]; end
raster_epoch{1}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4099436,1);  raster_epoch{1}.EZM_closed_bottomfromopen  = [raster_epoch{1}.EZM_closed_bottomfromopen   inscopix{1}(:,EZM.closed.bottom.fromopen.m4099436(i,1):EZM.closed.bottom.fromopen.m4099436(i,2))]; end

%XM arms
raster_epoch{1}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4099436,1);     raster_epoch{1}.XM_longarm_top  = [raster_epoch{1}.XM_longarm_top         inscopix{1}(:,XM.Longarm.top.m4099436(i,1):XM.Longarm.top.m4099436(i,2))]; end
raster_epoch{1}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4099436,1);  raster_epoch{1}.XM_longarm_bottom  = [raster_epoch{1}.XM_longarm_bottom   inscopix{1}(:,XM.Longarm.bottom.m4099436(i,1):XM.Longarm.bottom.m4099436(i,2))]; end
raster_epoch{1}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4099436,1);        raster_epoch{1}.XM_shortarm  = [raster_epoch{1}.XM_shortarm               inscopix{1}(:,XM.shortarm.m4099436(i,1):XM.shortarm.m4099436(i,2))]; end






dir{2} = 4099438
calcium_epoch{2}.HC1 = calcium{2}(:,mazes.m4099438.HC1(1,1):mazes.m4099438.HC1(1,2));
calcium_epoch{2}.HC2 = calcium{2}(:,mazes.m4099438.HC2(1,1):mazes.m4099438.HC2(1,2));
calcium_epoch{2}.HC3 = calcium{2}(:,mazes.m4099438.HC3(1,1):mazes.m4099438.HC3(1,2));
calcium_epoch{2}.HC4 = calcium{2}(:,mazes.m4099438.HC4(1,1):mazes.m4099438.HC4(1,2));
calcium_epoch{2}.HC5 = calcium{2}(:,mazes.m4099438.HC5(1,1):mazes.m4099438.HC5(1,2));
calcium_epoch{2}.HC6 = calcium{2}(:,mazes.m4099438.HC6(1,1):115068);
calcium_epoch{2}.EZM = calcium{2}(:,mazes.m4099438.EZM(1,1):mazes.m4099438.EZM(1,2));
calcium_epoch{2}.EPM = calcium{2}(:,mazes.m4099438.EPM(1,1):mazes.m4099438.EPM(1,2));
calcium_epoch{2}.XM  = calcium{2}(:,mazes.m4099438.XM(1,1):mazes.m4099438.XM(1,2));

%EPM arms
calcium_epoch{2}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4099438,1);           calcium_epoch{2}.EPM_open_left  = [calcium_epoch{2}.EPM_open_left      calcium{2}(:,EPM.open.left.m4099438(i,1):EPM.open.left.m4099438(i,2))]; end
calcium_epoch{2}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4099438,1);          calcium_epoch{2}.EPM_open_right  = [calcium_epoch{2}.EPM_open_right    calcium{2}(:,EPM.open.right.m4099438(i,1):EPM.open.right.m4099438(i,2))]; end
calcium_epoch{2}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4099438,1);          calcium_epoch{2}.EPM_closed_top  = [calcium_epoch{2}.EPM_closed_top    calcium{2}(:,EPM.closed.top.m4099438(i,1):EPM.closed.top.m4099438(i,2))]; end
calcium_epoch{2}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4099438,1);       calcium_epoch{2}.EPM_closed_bottom  = [calcium_epoch{2}.EPM_closed_bottom    calcium{2}(:,EPM.closed.bottom.m4099438(i,1):EPM.closed.bottom.m4099438(i,2))]; end

%EZM arms
calcium_epoch{2}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4099438,1);               calcium_epoch{2}.EZM_open_left  = [calcium_epoch{2}.EZM_open_left                           calcium{2}(:,EZM.open.left.m4099438(i,1):EZM.open.left.m4099438(i,2))]; end
calcium_epoch{2}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4099438,1);              calcium_epoch{2}.EZM_open_right  = [calcium_epoch{2}.EZM_open_right                         calcium{2}(:,EZM.open.right.m4099438(i,1):EZM.open.right.m4099438(i,2))]; end
calcium_epoch{2}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4099438,1);     calcium_epoch{2}.EZM_closed_topfromedge  = [calcium_epoch{2}.EZM_closed_topfromedge         calcium{2}(:,EZM.closed.top.fromedge.m4099438(i,1):EZM.closed.top.fromedge.m4099438(i,2))]; end
calcium_epoch{2}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4099438,1);     calcium_epoch{2}.EZM_closed_topfromopen  = [calcium_epoch{2}.EZM_closed_topfromopen         calcium{2}(:,EZM.closed.top.fromopen.m4099438(i,1):EZM.closed.top.fromopen.m4099438(i,2))]; end
calcium_epoch{2}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4099438,1);  calcium_epoch{2}.EZM_closed_bottomfromedge  = [calcium_epoch{2}.EZM_closed_bottomfromedge   calcium{2}(:,EZM.closed.bottom.fromedge.m4099438(i,1):EZM.closed.bottom.fromedge.m4099438(i,2))]; end
calcium_epoch{2}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4099438,1);  calcium_epoch{2}.EZM_closed_bottomfromopen  = [calcium_epoch{2}.EZM_closed_bottomfromopen   calcium{2}(:,EZM.closed.bottom.fromopen.m4099438(i,1):EZM.closed.bottom.fromopen.m4099438(i,2))]; end

%XM arms
calcium_epoch{2}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4099438,1);     calcium_epoch{2}.XM_longarm_top  = [calcium_epoch{2}.XM_longarm_top         calcium{2}(:,XM.Longarm.top.m4099438(i,1):XM.Longarm.top.m4099438(i,2))]; end
calcium_epoch{2}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4099438,1);  calcium_epoch{2}.XM_longarm_bottom  = [calcium_epoch{2}.XM_longarm_bottom   calcium{2}(:,XM.Longarm.bottom.m4099438(i,1):XM.Longarm.bottom.m4099438(i,2))]; end
calcium_epoch{2}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4099438,1);        calcium_epoch{2}.XM_shortarm  = [calcium_epoch{2}.XM_shortarm               calcium{2}(:,XM.shortarm.m4099438(i,1):XM.shortarm.m4099438(i,2))]; end




raster_epoch{2}.HC1 = inscopix{2}(:,mazes.m4099438.HC1(1,1):mazes.m4099438.HC1(1,2));
raster_epoch{2}.HC2 = inscopix{2}(:,mazes.m4099438.HC2(1,1):mazes.m4099438.HC2(1,2));
raster_epoch{2}.HC3 = inscopix{2}(:,mazes.m4099438.HC3(1,1):mazes.m4099438.HC3(1,2));
raster_epoch{2}.HC4 = inscopix{2}(:,mazes.m4099438.HC4(1,1):mazes.m4099438.HC4(1,2));
raster_epoch{2}.HC5 = inscopix{2}(:,mazes.m4099438.HC5(1,1):mazes.m4099438.HC5(1,2));
raster_epoch{2}.HC6 = inscopix{2}(:,mazes.m4099438.HC6(1,1):115068);
raster_epoch{2}.EZM = inscopix{2}(:,mazes.m4099438.EZM(1,1):mazes.m4099438.EZM(1,2));
raster_epoch{2}.EPM = inscopix{2}(:,mazes.m4099438.EPM(1,1):mazes.m4099438.EPM(1,2));
raster_epoch{2}.XM  = inscopix{2}(:,mazes.m4099438.XM(1,1):mazes.m4099438.XM(1,2));

%EPM arms
raster_epoch{2}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4099438,1);           raster_epoch{2}.EPM_open_left  = [raster_epoch{2}.EPM_open_left      inscopix{2}(:,EPM.open.left.m4099438(i,1):EPM.open.left.m4099438(i,2))]; end
raster_epoch{2}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4099438,1);          raster_epoch{2}.EPM_open_right  = [raster_epoch{2}.EPM_open_right    inscopix{2}(:,EPM.open.right.m4099438(i,1):EPM.open.right.m4099438(i,2))]; end
raster_epoch{2}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4099438,1);          raster_epoch{2}.EPM_closed_top  = [raster_epoch{2}.EPM_closed_top    inscopix{2}(:,EPM.closed.top.m4099438(i,1):EPM.closed.top.m4099438(i,2))]; end
raster_epoch{2}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4099438,1);       raster_epoch{2}.EPM_closed_bottom  = [raster_epoch{2}.EPM_closed_bottom    inscopix{2}(:,EPM.closed.bottom.m4099438(i,1):EPM.closed.bottom.m4099438(i,2))]; end

%EZM arms
raster_epoch{2}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4099438,1);               raster_epoch{2}.EZM_open_left  = [raster_epoch{2}.EZM_open_left                           inscopix{2}(:,EZM.open.left.m4099438(i,1):EZM.open.left.m4099438(i,2))]; end
raster_epoch{2}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4099438,1);              raster_epoch{2}.EZM_open_right  = [raster_epoch{2}.EZM_open_right                         inscopix{2}(:,EZM.open.right.m4099438(i,1):EZM.open.right.m4099438(i,2))]; end
raster_epoch{2}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4099438,1);     raster_epoch{2}.EZM_closed_topfromedge  = [raster_epoch{2}.EZM_closed_topfromedge         inscopix{2}(:,EZM.closed.top.fromedge.m4099438(i,1):EZM.closed.top.fromedge.m4099438(i,2))]; end
raster_epoch{2}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4099438,1);     raster_epoch{2}.EZM_closed_topfromopen  = [raster_epoch{2}.EZM_closed_topfromopen         inscopix{2}(:,EZM.closed.top.fromopen.m4099438(i,1):EZM.closed.top.fromopen.m4099438(i,2))]; end
raster_epoch{2}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4099438,1);  raster_epoch{2}.EZM_closed_bottomfromedge  = [raster_epoch{2}.EZM_closed_bottomfromedge   inscopix{2}(:,EZM.closed.bottom.fromedge.m4099438(i,1):EZM.closed.bottom.fromedge.m4099438(i,2))]; end
raster_epoch{2}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4099438,1);  raster_epoch{2}.EZM_closed_bottomfromopen  = [raster_epoch{2}.EZM_closed_bottomfromopen   inscopix{2}(:,EZM.closed.bottom.fromopen.m4099438(i,1):EZM.closed.bottom.fromopen.m4099438(i,2))]; end

%XM arms
raster_epoch{2}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4099438,1);     raster_epoch{2}.XM_longarm_top  = [raster_epoch{2}.XM_longarm_top         inscopix{2}(:,XM.Longarm.top.m4099438(i,1):XM.Longarm.top.m4099438(i,2))]; end
raster_epoch{2}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4099438,1);  raster_epoch{2}.XM_longarm_bottom  = [raster_epoch{2}.XM_longarm_bottom   inscopix{2}(:,XM.Longarm.bottom.m4099438(i,1):XM.Longarm.bottom.m4099438(i,2))]; end
raster_epoch{2}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4099438,1);        raster_epoch{2}.XM_shortarm  = [raster_epoch{2}.XM_shortarm               inscopix{2}(:,XM.shortarm.m4099438(i,1):XM.shortarm.m4099438(i,2))]; end





dir{3} = 4128595
calcium_epoch{3}.HC1 = calcium{3}(:,mazes.m4128595.HC1(1,1):mazes.m4128595.HC1(1,2));
calcium_epoch{3}.HC2 = calcium{3}(:,mazes.m4128595.HC2(1,1):mazes.m4128595.HC2(1,2));
calcium_epoch{3}.HC3 = calcium{3}(:,mazes.m4128595.HC3(1,1):mazes.m4128595.HC3(1,2));
calcium_epoch{3}.HC4 = calcium{3}(:,mazes.m4128595.HC4(1,1):mazes.m4128595.HC4(1,2));
calcium_epoch{3}.HC5 = calcium{3}(:,mazes.m4128595.HC5(1,1):mazes.m4128595.HC5(1,2));
calcium_epoch{3}.HC6 = calcium{3}(:,mazes.m4128595.HC6(1,1):mazes.m4128595.HC6(1,2));
calcium_epoch{3}.EZM = calcium{3}(:,mazes.m4128595.EZM(1,1):mazes.m4128595.EZM(1,2));
calcium_epoch{3}.EPM = calcium{3}(:,mazes.m4128595.EPM(1,1):mazes.m4128595.EPM(1,2));
calcium_epoch{3}.XM  = calcium{3}(:,mazes.m4128595.XM(1,1):mazes.m4128595.XM(1,2));

%EPM arms
calcium_epoch{3}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128595,1);           calcium_epoch{3}.EPM_open_left  = [calcium_epoch{3}.EPM_open_left      calcium{3}(:,EPM.open.left.m4128595(i,1):EPM.open.left.m4128595(i,2))]; end
calcium_epoch{3}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128595,1);          calcium_epoch{3}.EPM_open_right  = [calcium_epoch{3}.EPM_open_right    calcium{3}(:,EPM.open.right.m4128595(i,1):EPM.open.right.m4128595(i,2))]; end
calcium_epoch{3}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128595,1);          calcium_epoch{3}.EPM_closed_top  = [calcium_epoch{3}.EPM_closed_top    calcium{3}(:,EPM.closed.top.m4128595(i,1):EPM.closed.top.m4128595(i,2))]; end
calcium_epoch{3}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128595,1);       calcium_epoch{3}.EPM_closed_bottom  = [calcium_epoch{3}.EPM_closed_bottom    calcium{3}(:,EPM.closed.bottom.m4128595(i,1):EPM.closed.bottom.m4128595(i,2))]; end

%EZM arms
calcium_epoch{3}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128595,1);               calcium_epoch{3}.EZM_open_left  = [calcium_epoch{3}.EZM_open_left                           calcium{3}(:,EZM.open.left.m4128595(i,1):EZM.open.left.m4128595(i,2))]; end
calcium_epoch{3}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128595,1);              calcium_epoch{3}.EZM_open_right  = [calcium_epoch{3}.EZM_open_right                         calcium{3}(:,EZM.open.right.m4128595(i,1):EZM.open.right.m4128595(i,2))]; end
calcium_epoch{3}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128595,1);     calcium_epoch{3}.EZM_closed_topfromedge  = [calcium_epoch{3}.EZM_closed_topfromedge         calcium{3}(:,EZM.closed.top.fromedge.m4128595(i,1):EZM.closed.top.fromedge.m4128595(i,2))]; end
calcium_epoch{3}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128595,1);     calcium_epoch{3}.EZM_closed_topfromopen  = [calcium_epoch{3}.EZM_closed_topfromopen         calcium{3}(:,EZM.closed.top.fromopen.m4128595(i,1):EZM.closed.top.fromopen.m4128595(i,2))]; end
calcium_epoch{3}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128595,1);  calcium_epoch{3}.EZM_closed_bottomfromedge  = [calcium_epoch{3}.EZM_closed_bottomfromedge   calcium{3}(:,EZM.closed.bottom.fromedge.m4128595(i,1):EZM.closed.bottom.fromedge.m4128595(i,2))]; end
calcium_epoch{3}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128595,1);  calcium_epoch{3}.EZM_closed_bottomfromopen  = [calcium_epoch{3}.EZM_closed_bottomfromopen   calcium{3}(:,EZM.closed.bottom.fromopen.m4128595(i,1):EZM.closed.bottom.fromopen.m4128595(i,2))]; end

%XM arms
calcium_epoch{3}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128595,1);     calcium_epoch{3}.XM_longarm_top  = [calcium_epoch{3}.XM_longarm_top         calcium{3}(:,XM.Longarm.top.m4128595(i,1):XM.Longarm.top.m4128595(i,2))]; end
calcium_epoch{3}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128595,1);  calcium_epoch{3}.XM_longarm_bottom  = [calcium_epoch{3}.XM_longarm_bottom   calcium{3}(:,XM.Longarm.bottom.m4128595(i,1):XM.Longarm.bottom.m4128595(i,2))]; end
calcium_epoch{3}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128595,1);        calcium_epoch{3}.XM_shortarm  = [calcium_epoch{3}.XM_shortarm               calcium{3}(:,XM.shortarm.m4128595(i,1):XM.shortarm.m4128595(i,2))]; end




raster_epoch{3}.HC1 = inscopix{3}(:,mazes.m4128595.HC1(1,1):mazes.m4128595.HC1(1,2));
raster_epoch{3}.HC2 = inscopix{3}(:,mazes.m4128595.HC2(1,1):mazes.m4128595.HC2(1,2));
raster_epoch{3}.HC3 = inscopix{3}(:,mazes.m4128595.HC3(1,1):mazes.m4128595.HC3(1,2));
raster_epoch{3}.HC4 = inscopix{3}(:,mazes.m4128595.HC4(1,1):mazes.m4128595.HC4(1,2));
raster_epoch{3}.HC5 = inscopix{3}(:,mazes.m4128595.HC5(1,1):mazes.m4128595.HC5(1,2));
raster_epoch{3}.HC6 = inscopix{3}(:,mazes.m4128595.HC6(1,1):mazes.m4128595.HC6(1,2));
raster_epoch{3}.EZM = inscopix{3}(:,mazes.m4128595.EZM(1,1):mazes.m4128595.EZM(1,2));
raster_epoch{3}.EPM = inscopix{3}(:,mazes.m4128595.EPM(1,1):mazes.m4128595.EPM(1,2));
raster_epoch{3}.XM  = inscopix{3}(:,mazes.m4128595.XM(1,1):mazes.m4128595.XM(1,2));

%EPM arms
raster_epoch{3}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128595,1);           raster_epoch{3}.EPM_open_left  = [raster_epoch{3}.EPM_open_left      inscopix{3}(:,EPM.open.left.m4128595(i,1):EPM.open.left.m4128595(i,2))]; end
raster_epoch{3}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128595,1);          raster_epoch{3}.EPM_open_right  = [raster_epoch{3}.EPM_open_right    inscopix{3}(:,EPM.open.right.m4128595(i,1):EPM.open.right.m4128595(i,2))]; end
raster_epoch{3}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128595,1);          raster_epoch{3}.EPM_closed_top  = [raster_epoch{3}.EPM_closed_top    inscopix{3}(:,EPM.closed.top.m4128595(i,1):EPM.closed.top.m4128595(i,2))]; end
raster_epoch{3}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128595,1);       raster_epoch{3}.EPM_closed_bottom  = [raster_epoch{3}.EPM_closed_bottom    inscopix{3}(:,EPM.closed.bottom.m4128595(i,1):EPM.closed.bottom.m4128595(i,2))]; end

%EZM arms
raster_epoch{3}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128595,1);               raster_epoch{3}.EZM_open_left  = [raster_epoch{3}.EZM_open_left                           inscopix{3}(:,EZM.open.left.m4128595(i,1):EZM.open.left.m4128595(i,2))]; end
raster_epoch{3}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128595,1);              raster_epoch{3}.EZM_open_right  = [raster_epoch{3}.EZM_open_right                         inscopix{3}(:,EZM.open.right.m4128595(i,1):EZM.open.right.m4128595(i,2))]; end
raster_epoch{3}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128595,1);     raster_epoch{3}.EZM_closed_topfromedge  = [raster_epoch{3}.EZM_closed_topfromedge         inscopix{3}(:,EZM.closed.top.fromedge.m4128595(i,1):EZM.closed.top.fromedge.m4128595(i,2))]; end
raster_epoch{3}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128595,1);     raster_epoch{3}.EZM_closed_topfromopen  = [raster_epoch{3}.EZM_closed_topfromopen         inscopix{3}(:,EZM.closed.top.fromopen.m4128595(i,1):EZM.closed.top.fromopen.m4128595(i,2))]; end
raster_epoch{3}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128595,1);  raster_epoch{3}.EZM_closed_bottomfromedge  = [raster_epoch{3}.EZM_closed_bottomfromedge   inscopix{3}(:,EZM.closed.bottom.fromedge.m4128595(i,1):EZM.closed.bottom.fromedge.m4128595(i,2))]; end
raster_epoch{3}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128595,1);  raster_epoch{3}.EZM_closed_bottomfromopen  = [raster_epoch{3}.EZM_closed_bottomfromopen   inscopix{3}(:,EZM.closed.bottom.fromopen.m4128595(i,1):EZM.closed.bottom.fromopen.m4128595(i,2))]; end

%XM arms
raster_epoch{3}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128595,1);     raster_epoch{3}.XM_longarm_top  = [raster_epoch{3}.XM_longarm_top         inscopix{3}(:,XM.Longarm.top.m4128595(i,1):XM.Longarm.top.m4128595(i,2))]; end
raster_epoch{3}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128595,1);  raster_epoch{3}.XM_longarm_bottom  = [raster_epoch{3}.XM_longarm_bottom   inscopix{3}(:,XM.Longarm.bottom.m4128595(i,1):XM.Longarm.bottom.m4128595(i,2))]; end
raster_epoch{3}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128595,1);        raster_epoch{3}.XM_shortarm  = [raster_epoch{3}.XM_shortarm               inscopix{3}(:,XM.shortarm.m4128595(i,1):XM.shortarm.m4128595(i,2))]; end




dir{4} = 4128596
calcium_epoch{4}.HC1 = calcium{4}(:,mazes.m4128596.HC1(1,1):mazes.m4128596.HC1(1,2));
calcium_epoch{4}.HC2 = calcium{4}(:,mazes.m4128596.HC2(1,1):mazes.m4128596.HC2(1,2));
calcium_epoch{4}.HC3 = calcium{4}(:,mazes.m4128596.HC3(1,1):mazes.m4128596.HC3(1,2));
calcium_epoch{4}.HC4 = calcium{4}(:,mazes.m4128596.HC4(1,1):mazes.m4128596.HC4(1,2));
calcium_epoch{4}.HC5 = calcium{4}(:,mazes.m4128596.HC5(1,1):mazes.m4128596.HC5(1,2));
calcium_epoch{4}.HC6 = calcium{4}(:,mazes.m4128596.HC6(1,1):mazes.m4128596.HC6(1,2));
calcium_epoch{4}.EZM = calcium{4}(:,mazes.m4128596.EZM(1,1):mazes.m4128596.EZM(1,2));
calcium_epoch{4}.EPM = calcium{4}(:,mazes.m4128596.EPM(1,1):mazes.m4128596.EPM(1,2));
calcium_epoch{4}.XM  = calcium{4}(:,mazes.m4128596.XM(1,1):mazes.m4128596.XM(1,2));


%EPM arms
calcium_epoch{4}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128596,1);           calcium_epoch{4}.EPM_open_left  = [calcium_epoch{4}.EPM_open_left      calcium{4}(:,EPM.open.left.m4128596(i,1):EPM.open.left.m4128596(i,2))]; end
calcium_epoch{4}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128596,1);          calcium_epoch{4}.EPM_open_right  = [calcium_epoch{4}.EPM_open_right    calcium{4}(:,EPM.open.right.m4128596(i,1):EPM.open.right.m4128596(i,2))]; end
calcium_epoch{4}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128596,1);          calcium_epoch{4}.EPM_closed_top  = [calcium_epoch{4}.EPM_closed_top    calcium{4}(:,EPM.closed.top.m4128596(i,1):EPM.closed.top.m4128596(i,2))]; end
calcium_epoch{4}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128596,1);       calcium_epoch{4}.EPM_closed_bottom  = [calcium_epoch{4}.EPM_closed_bottom    calcium{4}(:,EPM.closed.bottom.m4128596(i,1):EPM.closed.bottom.m4128596(i,2))]; end

%EZM arms
calcium_epoch{4}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128596,1);               calcium_epoch{4}.EZM_open_left  = [calcium_epoch{4}.EZM_open_left                           calcium{4}(:,EZM.open.left.m4128596(i,1):EZM.open.left.m4128596(i,2))]; end
calcium_epoch{4}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128596,1);              calcium_epoch{4}.EZM_open_right  = [calcium_epoch{4}.EZM_open_right                         calcium{4}(:,EZM.open.right.m4128596(i,1):EZM.open.right.m4128596(i,2))]; end
calcium_epoch{4}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128596,1);     calcium_epoch{4}.EZM_closed_topfromedge  = [calcium_epoch{4}.EZM_closed_topfromedge         calcium{4}(:,EZM.closed.top.fromedge.m4128596(i,1):EZM.closed.top.fromedge.m4128596(i,2))]; end
calcium_epoch{4}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128596,1);     calcium_epoch{4}.EZM_closed_topfromopen  = [calcium_epoch{4}.EZM_closed_topfromopen         calcium{4}(:,EZM.closed.top.fromopen.m4128596(i,1):EZM.closed.top.fromopen.m4128596(i,2))]; end
calcium_epoch{4}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128596,1);  calcium_epoch{4}.EZM_closed_bottomfromedge  = [calcium_epoch{4}.EZM_closed_bottomfromedge   calcium{4}(:,EZM.closed.bottom.fromedge.m4128596(i,1):EZM.closed.bottom.fromedge.m4128596(i,2))]; end
calcium_epoch{4}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128596,1);  calcium_epoch{4}.EZM_closed_bottomfromopen  = [calcium_epoch{4}.EZM_closed_bottomfromopen   calcium{4}(:,EZM.closed.bottom.fromopen.m4128596(i,1):EZM.closed.bottom.fromopen.m4128596(i,2))]; end

%XM arms
calcium_epoch{4}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128596,1);     calcium_epoch{4}.XM_longarm_top  = [calcium_epoch{4}.XM_longarm_top         calcium{4}(:,XM.Longarm.top.m4128596(i,1):XM.Longarm.top.m4128596(i,2))]; end
calcium_epoch{4}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128596,1);  calcium_epoch{4}.XM_longarm_bottom  = [calcium_epoch{4}.XM_longarm_bottom   calcium{4}(:,XM.Longarm.bottom.m4128596(i,1):XM.Longarm.bottom.m4128596(i,2))]; end
calcium_epoch{4}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128596,1);        calcium_epoch{4}.XM_shortarm  = [calcium_epoch{4}.XM_shortarm               calcium{4}(:,XM.shortarm.m4128596(i,1):XM.shortarm.m4128596(i,2))]; end



raster_epoch{4}.HC1 = inscopix{4}(:,mazes.m4128596.HC1(1,1):mazes.m4128596.HC1(1,2));
raster_epoch{4}.HC2 = inscopix{4}(:,mazes.m4128596.HC2(1,1):mazes.m4128596.HC2(1,2));
raster_epoch{4}.HC3 = inscopix{4}(:,mazes.m4128596.HC3(1,1):mazes.m4128596.HC3(1,2));
raster_epoch{4}.HC4 = inscopix{4}(:,mazes.m4128596.HC4(1,1):mazes.m4128596.HC4(1,2));
raster_epoch{4}.HC5 = inscopix{4}(:,mazes.m4128596.HC5(1,1):mazes.m4128596.HC5(1,2));
raster_epoch{4}.HC6 = inscopix{4}(:,mazes.m4128596.HC6(1,1):mazes.m4128596.HC6(1,2));
raster_epoch{4}.EZM = inscopix{4}(:,mazes.m4128596.EZM(1,1):mazes.m4128596.EZM(1,2));
raster_epoch{4}.EPM = inscopix{4}(:,mazes.m4128596.EPM(1,1):mazes.m4128596.EPM(1,2));
raster_epoch{4}.XM  = inscopix{4}(:,mazes.m4128596.XM(1,1):mazes.m4128596.XM(1,2));

%EPM arms
raster_epoch{4}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128596,1);           raster_epoch{4}.EPM_open_left  = [raster_epoch{4}.EPM_open_left      inscopix{4}(:,EPM.open.left.m4128596(i,1):EPM.open.left.m4128596(i,2))]; end
raster_epoch{4}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128596,1);          raster_epoch{4}.EPM_open_right  = [raster_epoch{4}.EPM_open_right    inscopix{4}(:,EPM.open.right.m4128596(i,1):EPM.open.right.m4128596(i,2))]; end
raster_epoch{4}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128596,1);          raster_epoch{4}.EPM_closed_top  = [raster_epoch{4}.EPM_closed_top    inscopix{4}(:,EPM.closed.top.m4128596(i,1):EPM.closed.top.m4128596(i,2))]; end
raster_epoch{4}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128596,1);       raster_epoch{4}.EPM_closed_bottom  = [raster_epoch{4}.EPM_closed_bottom    inscopix{4}(:,EPM.closed.bottom.m4128596(i,1):EPM.closed.bottom.m4128596(i,2))]; end

%EZM arms
raster_epoch{4}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128596,1);               raster_epoch{4}.EZM_open_left  = [raster_epoch{4}.EZM_open_left                           inscopix{4}(:,EZM.open.left.m4128596(i,1):EZM.open.left.m4128596(i,2))]; end
raster_epoch{4}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128596,1);              raster_epoch{4}.EZM_open_right  = [raster_epoch{4}.EZM_open_right                         inscopix{4}(:,EZM.open.right.m4128596(i,1):EZM.open.right.m4128596(i,2))]; end
raster_epoch{4}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128596,1);     raster_epoch{4}.EZM_closed_topfromedge  = [raster_epoch{4}.EZM_closed_topfromedge         inscopix{4}(:,EZM.closed.top.fromedge.m4128596(i,1):EZM.closed.top.fromedge.m4128596(i,2))]; end
raster_epoch{4}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128596,1);     raster_epoch{4}.EZM_closed_topfromopen  = [raster_epoch{4}.EZM_closed_topfromopen         inscopix{4}(:,EZM.closed.top.fromopen.m4128596(i,1):EZM.closed.top.fromopen.m4128596(i,2))]; end
raster_epoch{4}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128596,1);  raster_epoch{4}.EZM_closed_bottomfromedge  = [raster_epoch{4}.EZM_closed_bottomfromedge   inscopix{4}(:,EZM.closed.bottom.fromedge.m4128596(i,1):EZM.closed.bottom.fromedge.m4128596(i,2))]; end
raster_epoch{4}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128596,1);  raster_epoch{4}.EZM_closed_bottomfromopen  = [raster_epoch{4}.EZM_closed_bottomfromopen   inscopix{4}(:,EZM.closed.bottom.fromopen.m4128596(i,1):EZM.closed.bottom.fromopen.m4128596(i,2))]; end

%XM arms
raster_epoch{4}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128596,1);     raster_epoch{4}.XM_longarm_top  = [raster_epoch{4}.XM_longarm_top         inscopix{4}(:,XM.Longarm.top.m4128596(i,1):XM.Longarm.top.m4128596(i,2))]; end
raster_epoch{4}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128596,1);  raster_epoch{4}.XM_longarm_bottom  = [raster_epoch{4}.XM_longarm_bottom   inscopix{4}(:,XM.Longarm.bottom.m4128596(i,1):XM.Longarm.bottom.m4128596(i,2))]; end
raster_epoch{4}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128596,1);        raster_epoch{4}.XM_shortarm  = [raster_epoch{4}.XM_shortarm               inscopix{4}(:,XM.shortarm.m4128596(i,1):XM.shortarm.m4128596(i,2))]; end






dir{5} = 4128597
calcium_epoch{5}.HC1 = calcium{5}(:,mazes.m4128597.HC1(1,1):mazes.m4128597.HC1(1,2));
calcium_epoch{5}.HC2 = calcium{5}(:,mazes.m4128597.HC2(1,1):mazes.m4128597.HC2(1,2));
calcium_epoch{5}.HC3 = calcium{5}(:,mazes.m4128597.HC3(1,1):mazes.m4128597.HC3(1,2));
calcium_epoch{5}.HC4 = calcium{5}(:,mazes.m4128597.HC4(1,1):mazes.m4128597.HC4(1,2));
calcium_epoch{5}.HC5 = calcium{5}(:,mazes.m4128597.HC5(1,1):mazes.m4128597.HC5(1,2));
calcium_epoch{5}.HC6 = calcium{5}(:,mazes.m4128597.HC6(1,1):mazes.m4128597.HC6(1,2));
calcium_epoch{5}.EZM = calcium{5}(:,mazes.m4128597.EZM(1,1):mazes.m4128597.EZM(1,2));
calcium_epoch{5}.EPM = calcium{5}(:,mazes.m4128597.EPM(1,1):mazes.m4128597.EPM(1,2));
calcium_epoch{5}.XM  = calcium{5}(:,mazes.m4128597.XM(1,1):mazes.m4128597.XM(1,2));


%EPM arms
calcium_epoch{5}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128597,1);           calcium_epoch{5}.EPM_open_left  = [calcium_epoch{5}.EPM_open_left      calcium{5}(:,EPM.open.left.m4128597(i,1):EPM.open.left.m4128597(i,2))]; end
calcium_epoch{5}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128597,1);          calcium_epoch{5}.EPM_open_right  = [calcium_epoch{5}.EPM_open_right    calcium{5}(:,EPM.open.right.m4128597(i,1):EPM.open.right.m4128597(i,2))]; end
calcium_epoch{5}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128597,1);          calcium_epoch{5}.EPM_closed_top  = [calcium_epoch{5}.EPM_closed_top    calcium{5}(:,EPM.closed.top.m4128597(i,1):EPM.closed.top.m4128597(i,2))]; end
calcium_epoch{5}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128597,1);       calcium_epoch{5}.EPM_closed_bottom  = [calcium_epoch{5}.EPM_closed_bottom    calcium{5}(:,EPM.closed.bottom.m4128597(i,1):EPM.closed.bottom.m4128597(i,2))]; end

%EZM arms
calcium_epoch{5}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128597,1);               calcium_epoch{5}.EZM_open_left  = [calcium_epoch{5}.EZM_open_left                           calcium{5}(:,EZM.open.left.m4128597(i,1):EZM.open.left.m4128597(i,2))]; end
calcium_epoch{5}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128597,1);              calcium_epoch{5}.EZM_open_right  = [calcium_epoch{5}.EZM_open_right                         calcium{5}(:,EZM.open.right.m4128597(i,1):EZM.open.right.m4128597(i,2))]; end
calcium_epoch{5}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128597,1);     calcium_epoch{5}.EZM_closed_topfromedge  = [calcium_epoch{5}.EZM_closed_topfromedge         calcium{5}(:,EZM.closed.top.fromedge.m4128597(i,1):EZM.closed.top.fromedge.m4128597(i,2))]; end
calcium_epoch{5}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128597,1);     calcium_epoch{5}.EZM_closed_topfromopen  = [calcium_epoch{5}.EZM_closed_topfromopen         calcium{5}(:,EZM.closed.top.fromopen.m4128597(i,1):EZM.closed.top.fromopen.m4128597(i,2))]; end
calcium_epoch{5}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128597,1);  calcium_epoch{5}.EZM_closed_bottomfromedge  = [calcium_epoch{5}.EZM_closed_bottomfromedge   calcium{5}(:,EZM.closed.bottom.fromedge.m4128597(i,1):EZM.closed.bottom.fromedge.m4128597(i,2))]; end
calcium_epoch{5}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128597,1);  calcium_epoch{5}.EZM_closed_bottomfromopen  = [calcium_epoch{5}.EZM_closed_bottomfromopen   calcium{5}(:,EZM.closed.bottom.fromopen.m4128597(i,1):EZM.closed.bottom.fromopen.m4128597(i,2))]; end

%XM arms
calcium_epoch{5}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128597,1);     calcium_epoch{5}.XM_longarm_top  = [calcium_epoch{5}.XM_longarm_top         calcium{5}(:,XM.Longarm.top.m4128597(i,1):XM.Longarm.top.m4128597(i,2))]; end
calcium_epoch{5}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128597,1);  calcium_epoch{5}.XM_longarm_bottom  = [calcium_epoch{5}.XM_longarm_bottom   calcium{5}(:,XM.Longarm.bottom.m4128597(i,1):XM.Longarm.bottom.m4128597(i,2))]; end
calcium_epoch{5}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128597,1);        calcium_epoch{5}.XM_shortarm  = [calcium_epoch{5}.XM_shortarm               calcium{5}(:,XM.shortarm.m4128597(i,1):XM.shortarm.m4128597(i,2))]; end





raster_epoch{5}.HC1 = inscopix{5}(:,mazes.m4128597.HC1(1,1):mazes.m4128597.HC1(1,2));
raster_epoch{5}.HC2 = inscopix{5}(:,mazes.m4128597.HC2(1,1):mazes.m4128597.HC2(1,2));
raster_epoch{5}.HC3 = inscopix{5}(:,mazes.m4128597.HC3(1,1):mazes.m4128597.HC3(1,2));
raster_epoch{5}.HC4 = inscopix{5}(:,mazes.m4128597.HC4(1,1):mazes.m4128597.HC4(1,2));
raster_epoch{5}.HC5 = inscopix{5}(:,mazes.m4128597.HC5(1,1):mazes.m4128597.HC5(1,2));
raster_epoch{5}.HC6 = inscopix{5}(:,mazes.m4128597.HC6(1,1):mazes.m4128597.HC6(1,2));
raster_epoch{5}.EZM = inscopix{5}(:,mazes.m4128597.EZM(1,1):mazes.m4128597.EZM(1,2));
raster_epoch{5}.EPM = inscopix{5}(:,mazes.m4128597.EPM(1,1):mazes.m4128597.EPM(1,2));
raster_epoch{5}.XM  = inscopix{5}(:,mazes.m4128597.XM(1,1):mazes.m4128597.XM(1,2));

%EPM arms
raster_epoch{5}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128597,1);           raster_epoch{5}.EPM_open_left  = [raster_epoch{5}.EPM_open_left      inscopix{5}(:,EPM.open.left.m4128597(i,1):EPM.open.left.m4128597(i,2))]; end
raster_epoch{5}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128597,1);          raster_epoch{5}.EPM_open_right  = [raster_epoch{5}.EPM_open_right    inscopix{5}(:,EPM.open.right.m4128597(i,1):EPM.open.right.m4128597(i,2))]; end
raster_epoch{5}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128597,1);          raster_epoch{5}.EPM_closed_top  = [raster_epoch{5}.EPM_closed_top    inscopix{5}(:,EPM.closed.top.m4128597(i,1):EPM.closed.top.m4128597(i,2))]; end
raster_epoch{5}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128597,1);       raster_epoch{5}.EPM_closed_bottom  = [raster_epoch{5}.EPM_closed_bottom    inscopix{5}(:,EPM.closed.bottom.m4128597(i,1):EPM.closed.bottom.m4128597(i,2))]; end

%EZM arms
raster_epoch{5}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128597,1);               raster_epoch{5}.EZM_open_left  = [raster_epoch{5}.EZM_open_left                           inscopix{5}(:,EZM.open.left.m4128597(i,1):EZM.open.left.m4128597(i,2))]; end
raster_epoch{5}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128597,1);              raster_epoch{5}.EZM_open_right  = [raster_epoch{5}.EZM_open_right                         inscopix{5}(:,EZM.open.right.m4128597(i,1):EZM.open.right.m4128597(i,2))]; end
raster_epoch{5}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128597,1);     raster_epoch{5}.EZM_closed_topfromedge  = [raster_epoch{5}.EZM_closed_topfromedge         inscopix{5}(:,EZM.closed.top.fromedge.m4128597(i,1):EZM.closed.top.fromedge.m4128597(i,2))]; end
raster_epoch{5}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128597,1);     raster_epoch{5}.EZM_closed_topfromopen  = [raster_epoch{5}.EZM_closed_topfromopen         inscopix{5}(:,EZM.closed.top.fromopen.m4128597(i,1):EZM.closed.top.fromopen.m4128597(i,2))]; end
raster_epoch{5}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128597,1);  raster_epoch{5}.EZM_closed_bottomfromedge  = [raster_epoch{5}.EZM_closed_bottomfromedge   inscopix{5}(:,EZM.closed.bottom.fromedge.m4128597(i,1):EZM.closed.bottom.fromedge.m4128597(i,2))]; end
raster_epoch{5}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128597,1);  raster_epoch{5}.EZM_closed_bottomfromopen  = [raster_epoch{5}.EZM_closed_bottomfromopen   inscopix{5}(:,EZM.closed.bottom.fromopen.m4128597(i,1):EZM.closed.bottom.fromopen.m4128597(i,2))]; end

%XM arms
raster_epoch{5}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128597,1);     raster_epoch{5}.XM_longarm_top  = [raster_epoch{5}.XM_longarm_top         inscopix{5}(:,XM.Longarm.top.m4128597(i,1):XM.Longarm.top.m4128597(i,2))]; end
raster_epoch{5}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128597,1);  raster_epoch{5}.XM_longarm_bottom  = [raster_epoch{5}.XM_longarm_bottom   inscopix{5}(:,XM.Longarm.bottom.m4128597(i,1):XM.Longarm.bottom.m4128597(i,2))]; end
raster_epoch{5}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128597,1);        raster_epoch{5}.XM_shortarm  = [raster_epoch{5}.XM_shortarm               inscopix{5}(:,XM.shortarm.m4128597(i,1):XM.shortarm.m4128597(i,2))]; end




dir{6} = 4128598
calcium_epoch{6}.HC1 = calcium{6}(:,mazes.m4128598.HC1(1,1):mazes.m4128598.HC1(1,2));
calcium_epoch{6}.HC2 = calcium{6}(:,mazes.m4128598.HC2(1,1):mazes.m4128598.HC2(1,2));
calcium_epoch{6}.HC3 = calcium{6}(:,mazes.m4128598.HC3(1,1):mazes.m4128598.HC3(1,2));
calcium_epoch{6}.HC4 = calcium{6}(:,mazes.m4128598.HC4(1,1):mazes.m4128598.HC4(1,2));
calcium_epoch{6}.HC5 = calcium{6}(:,mazes.m4128598.HC5(1,1):mazes.m4128598.HC5(1,2));
calcium_epoch{6}.HC6 = calcium{6}(:,mazes.m4128598.HC6(1,1):mazes.m4128598.HC6(1,2));
calcium_epoch{6}.EZM = calcium{6}(:,mazes.m4128598.EZM(1,1):mazes.m4128598.EZM(1,2));
calcium_epoch{6}.EPM = calcium{6}(:,mazes.m4128598.EPM(1,1):mazes.m4128598.EPM(1,2));
calcium_epoch{6}.XM  = calcium{6}(:,mazes.m4128598.XM(1,1):mazes.m4128598.XM(1,2));

%EPM arms
calcium_epoch{6}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128598,1);           calcium_epoch{6}.EPM_open_left  = [calcium_epoch{6}.EPM_open_left      calcium{6}(:,EPM.open.left.m4128598(i,1):EPM.open.left.m4128598(i,2))]; end
calcium_epoch{6}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128598,1);          calcium_epoch{6}.EPM_open_right  = [calcium_epoch{6}.EPM_open_right    calcium{6}(:,EPM.open.right.m4128598(i,1):EPM.open.right.m4128598(i,2))]; end
calcium_epoch{6}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128598,1);          calcium_epoch{6}.EPM_closed_top  = [calcium_epoch{6}.EPM_closed_top    calcium{6}(:,EPM.closed.top.m4128598(i,1):EPM.closed.top.m4128598(i,2))]; end
calcium_epoch{6}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128598,1);       calcium_epoch{6}.EPM_closed_bottom  = [calcium_epoch{6}.EPM_closed_bottom    calcium{6}(:,EPM.closed.bottom.m4128598(i,1):EPM.closed.bottom.m4128598(i,2))]; end

%EZM arms
calcium_epoch{6}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128598,1);               calcium_epoch{6}.EZM_open_left  = [calcium_epoch{6}.EZM_open_left                           calcium{6}(:,EZM.open.left.m4128598(i,1):EZM.open.left.m4128598(i,2))]; end
calcium_epoch{6}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128598,1);              calcium_epoch{6}.EZM_open_right  = [calcium_epoch{6}.EZM_open_right                         calcium{6}(:,EZM.open.right.m4128598(i,1):EZM.open.right.m4128598(i,2))]; end
calcium_epoch{6}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128598,1);     calcium_epoch{6}.EZM_closed_topfromedge  = [calcium_epoch{6}.EZM_closed_topfromedge         calcium{6}(:,EZM.closed.top.fromedge.m4128598(i,1):EZM.closed.top.fromedge.m4128598(i,2))]; end
calcium_epoch{6}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128598,1);     calcium_epoch{6}.EZM_closed_topfromopen  = [calcium_epoch{6}.EZM_closed_topfromopen         calcium{6}(:,EZM.closed.top.fromopen.m4128598(i,1):EZM.closed.top.fromopen.m4128598(i,2))]; end
calcium_epoch{6}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128598,1);  calcium_epoch{6}.EZM_closed_bottomfromedge  = [calcium_epoch{6}.EZM_closed_bottomfromedge   calcium{6}(:,EZM.closed.bottom.fromedge.m4128598(i,1):EZM.closed.bottom.fromedge.m4128598(i,2))]; end
calcium_epoch{6}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128598,1);  calcium_epoch{6}.EZM_closed_bottomfromopen  = [calcium_epoch{6}.EZM_closed_bottomfromopen   calcium{6}(:,EZM.closed.bottom.fromopen.m4128598(i,1):EZM.closed.bottom.fromopen.m4128598(i,2))]; end

%XM arms
calcium_epoch{6}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128598,1);     calcium_epoch{6}.XM_longarm_top  = [calcium_epoch{6}.XM_longarm_top         calcium{6}(:,XM.Longarm.top.m4128598(i,1):XM.Longarm.top.m4128598(i,2))]; end
calcium_epoch{6}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128598,1);  calcium_epoch{6}.XM_longarm_bottom  = [calcium_epoch{6}.XM_longarm_bottom   calcium{6}(:,XM.Longarm.bottom.m4128598(i,1):XM.Longarm.bottom.m4128598(i,2))]; end
calcium_epoch{6}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128598,1);        calcium_epoch{6}.XM_shortarm  = [calcium_epoch{6}.XM_shortarm               calcium{6}(:,XM.shortarm.m4128598(i,1):XM.shortarm.m4128598(i,2))]; end





raster_epoch{6}.HC1 = inscopix{6}(:,mazes.m4128598.HC1(1,1):mazes.m4128598.HC1(1,2));
raster_epoch{6}.HC2 = inscopix{6}(:,mazes.m4128598.HC2(1,1):mazes.m4128598.HC2(1,2));
raster_epoch{6}.HC3 = inscopix{6}(:,mazes.m4128598.HC3(1,1):mazes.m4128598.HC3(1,2));
raster_epoch{6}.HC4 = inscopix{6}(:,mazes.m4128598.HC4(1,1):mazes.m4128598.HC4(1,2));
raster_epoch{6}.HC5 = inscopix{6}(:,mazes.m4128598.HC5(1,1):mazes.m4128598.HC5(1,2));
raster_epoch{6}.HC6 = inscopix{6}(:,mazes.m4128598.HC6(1,1):mazes.m4128598.HC6(1,2));
raster_epoch{6}.EZM = inscopix{6}(:,mazes.m4128598.EZM(1,1):mazes.m4128598.EZM(1,2));
raster_epoch{6}.EPM = inscopix{6}(:,mazes.m4128598.EPM(1,1):mazes.m4128598.EPM(1,2));
raster_epoch{6}.XM  = inscopix{6}(:,mazes.m4128598.XM(1,1):mazes.m4128598.XM(1,2));


%EPM arms
raster_epoch{6}.EPM_open_left  = [];           for i = 1:size(EPM.open.left.m4128598,1);           raster_epoch{6}.EPM_open_left  = [raster_epoch{6}.EPM_open_left      inscopix{6}(:,EPM.open.left.m4128598(i,1):EPM.open.left.m4128598(i,2))]; end
raster_epoch{6}.EPM_open_right = [];           for i = 1:size(EPM.open.right.m4128598,1);          raster_epoch{6}.EPM_open_right  = [raster_epoch{6}.EPM_open_right    inscopix{6}(:,EPM.open.right.m4128598(i,1):EPM.open.right.m4128598(i,2))]; end
raster_epoch{6}.EPM_closed_top = [];           for i = 1:size(EPM.closed.top.m4128598,1);          raster_epoch{6}.EPM_closed_top  = [raster_epoch{6}.EPM_closed_top    inscopix{6}(:,EPM.closed.top.m4128598(i,1):EPM.closed.top.m4128598(i,2))]; end
raster_epoch{6}.EPM_closed_bottom = [];        for i = 1:size(EPM.closed.bottom.m4128598,1);       raster_epoch{6}.EPM_closed_bottom  = [raster_epoch{6}.EPM_closed_bottom    inscopix{6}(:,EPM.closed.bottom.m4128598(i,1):EPM.closed.bottom.m4128598(i,2))]; end

%EZM arms
raster_epoch{6}.EZM_open_left  = [];           for i = 1:size(EZM.open.left.m4128598,1);               raster_epoch{6}.EZM_open_left  = [raster_epoch{6}.EZM_open_left                           inscopix{6}(:,EZM.open.left.m4128598(i,1):EZM.open.left.m4128598(i,2))]; end
raster_epoch{6}.EZM_open_right = [];           for i = 1:size(EZM.open.right.m4128598,1);              raster_epoch{6}.EZM_open_right  = [raster_epoch{6}.EZM_open_right                         inscopix{6}(:,EZM.open.right.m4128598(i,1):EZM.open.right.m4128598(i,2))]; end
raster_epoch{6}.EZM_closed_topfromedge = [];   for i = 1:size(EZM.closed.top.fromedge.m4128598,1);     raster_epoch{6}.EZM_closed_topfromedge  = [raster_epoch{6}.EZM_closed_topfromedge         inscopix{6}(:,EZM.closed.top.fromedge.m4128598(i,1):EZM.closed.top.fromedge.m4128598(i,2))]; end
raster_epoch{6}.EZM_closed_topfromopen = [];   for i = 1:size(EZM.closed.top.fromopen.m4128598,1);     raster_epoch{6}.EZM_closed_topfromopen  = [raster_epoch{6}.EZM_closed_topfromopen         inscopix{6}(:,EZM.closed.top.fromopen.m4128598(i,1):EZM.closed.top.fromopen.m4128598(i,2))]; end
raster_epoch{6}.EZM_closed_bottomfromedge = [];for i = 1:size(EZM.closed.bottom.fromedge.m4128598,1);  raster_epoch{6}.EZM_closed_bottomfromedge  = [raster_epoch{6}.EZM_closed_bottomfromedge   inscopix{6}(:,EZM.closed.bottom.fromedge.m4128598(i,1):EZM.closed.bottom.fromedge.m4128598(i,2))]; end
raster_epoch{6}.EZM_closed_bottomfromopen = [];for i = 1:size(EZM.closed.bottom.fromopen.m4128598,1);  raster_epoch{6}.EZM_closed_bottomfromopen  = [raster_epoch{6}.EZM_closed_bottomfromopen   inscopix{6}(:,EZM.closed.bottom.fromopen.m4128598(i,1):EZM.closed.bottom.fromopen.m4128598(i,2))]; end

%XM arms
raster_epoch{6}.XM_longarm_top  = [];   for i = 1:size(XM.Longarm.top.m4128598,1);     raster_epoch{6}.XM_longarm_top  = [raster_epoch{6}.XM_longarm_top         inscopix{6}(:,XM.Longarm.top.m4128598(i,1):XM.Longarm.top.m4128598(i,2))]; end
raster_epoch{6}.XM_longarm_bottom = []; for i = 1:size(XM.Longarm.bottom.m4128598,1);  raster_epoch{6}.XM_longarm_bottom  = [raster_epoch{6}.XM_longarm_bottom   inscopix{6}(:,XM.Longarm.bottom.m4128598(i,1):XM.Longarm.bottom.m4128598(i,2))]; end
raster_epoch{6}.XM_shortarm = [];       for i = 1:size(XM.shortarm.m4128598,1);        raster_epoch{6}.XM_shortarm  = [raster_epoch{6}.XM_shortarm               inscopix{6}(:,XM.shortarm.m4128598(i,1):XM.shortarm.m4128598(i,2))]; end



%now we have cell/structure arrays consisting of calcium traces or raster
%activity for each epoch for each mouse

%1. compare activity
for i = 1:numel (calcium_epoch)
    epoch_mean_calcium(i,1) = mean(calcium_epoch{i}.HC1(:));
    epoch_mean_calcium(i,2) = mean(calcium_epoch{i}.HC2(:));
    epoch_mean_calcium(i,3) = mean(calcium_epoch{i}.HC3(:));
    epoch_mean_calcium(i,4) = mean(calcium_epoch{i}.HC4(:));
    epoch_mean_calcium(i,5) = mean(calcium_epoch{i}.HC5(:));
    epoch_mean_calcium(i,6) = mean(calcium_epoch{i}.HC6(:));
    epoch_mean_calcium(i,7) = mean(calcium_epoch{i}.EZM(:));
    epoch_mean_calcium(i,8) = mean(calcium_epoch{i}.EPM(:));
    epoch_mean_calcium(i,9) = mean(calcium_epoch{i}.XM(:));  
    %arm specific vectors
    epoch_mean_calcium(i,10) = mean(calcium_epoch{i}.EZM_open_left(:));  
    epoch_mean_calcium(i,11) = mean(calcium_epoch{i}.EZM_open_right(:));  
    epoch_mean_calcium(i,12) = mean(calcium_epoch{i}.EZM_closed_topfromedge(:));  
    epoch_mean_calcium(i,13) = mean(calcium_epoch{i}.EZM_closed_bottomfromedge(:));   
    epoch_mean_calcium(i,14) = mean(calcium_epoch{i}.EZM_closed_topfromopen(:));  
    epoch_mean_calcium(i,15) = mean(calcium_epoch{i}.EZM_closed_bottomfromopen(:)); 
    
    epoch_mean_calcium(i,16) = mean(calcium_epoch{i}.EPM_open_left(:));  
    epoch_mean_calcium(i,17) = mean(calcium_epoch{i}.EPM_open_right(:));  
    epoch_mean_calcium(i,18) = mean(calcium_epoch{i}.EPM_closed_top(:));  
    epoch_mean_calcium(i,19) = mean(calcium_epoch{i}.EPM_closed_bottom(:));      

    epoch_mean_calcium(i,20) = mean(calcium_epoch{i}.XM_longarm_top(:));  
    epoch_mean_calcium(i,21) = mean(calcium_epoch{i}.XM_longarm_bottom(:));  
    epoch_mean_calcium(i,22) = mean(calcium_epoch{i}.XM_shortarm(:));       
    
end

%zscore event though some arms never explored
clear tmp tmp2 tmp3 
for i = 1:6
tmp = find(isfinite(epoch_mean_calcium(i,:)))
tmp2 = zscore(epoch_mean_calcium(i,tmp)')';
for j = 1:numel(tmp)
    tmp3(i,tmp(j)) = tmp2(j);
end
end
tmp4 = find(isnan(epoch_mean_calcium))
tmp3(tmp4) = nan;
figure; imagesc((tmp3))               %image is zscored over time, but arranged HC1-6, then EZM, EPM, XC, which clearly shows a time dependent effect overlaid on a environment effect

mean(tmp3,'omitnan')
std(epoch_mean_calcium,'omitnan')./(size(epoch_mean_calcium,1))^0.5


for i = 1:numel (raster_epoch)
    epoch_mean_raster(i,1) = mean(raster_epoch{i}.HC1(:));
    epoch_mean_raster(i,2) = mean(raster_epoch{i}.HC2(:));
    epoch_mean_raster(i,3) = mean(raster_epoch{i}.HC3(:));
    epoch_mean_raster(i,4) = mean(raster_epoch{i}.HC4(:));
    epoch_mean_raster(i,5) = mean(raster_epoch{i}.HC5(:));
    epoch_mean_raster(i,6) = mean(raster_epoch{i}.HC6(:));
    epoch_mean_raster(i,7) = mean(raster_epoch{i}.EZM(:));
    epoch_mean_raster(i,8) = mean(raster_epoch{i}.EPM(:));
    epoch_mean_raster(i,9) = mean(raster_epoch{i}.XM(:));  
    %arm specific vectors
    epoch_mean_raster(i,10) = mean(raster_epoch{i}.EZM_open_left(:));  
    epoch_mean_raster(i,11) = mean(raster_epoch{i}.EZM_open_right(:));  
    epoch_mean_raster(i,12) = mean(raster_epoch{i}.EZM_closed_topfromedge(:));  
    epoch_mean_raster(i,13) = mean(raster_epoch{i}.EZM_closed_bottomfromedge(:));   
    epoch_mean_raster(i,14) = mean(raster_epoch{i}.EZM_closed_topfromopen(:));  
    epoch_mean_raster(i,15) = mean(raster_epoch{i}.EZM_closed_bottomfromopen(:)); 
    
    epoch_mean_raster(i,16) = mean(raster_epoch{i}.EPM_open_left(:));  
    epoch_mean_raster(i,17) = mean(raster_epoch{i}.EPM_open_right(:));  
    epoch_mean_raster(i,18) = mean(raster_epoch{i}.EPM_closed_top(:));  
    epoch_mean_raster(i,19) = mean(raster_epoch{i}.EPM_closed_bottom(:));      

    epoch_mean_raster(i,20) = mean(raster_epoch{i}.XM_longarm_top(:));  
    epoch_mean_raster(i,21) = mean(raster_epoch{i}.XM_longarm_bottom(:));  
    epoch_mean_raster(i,22) = mean(raster_epoch{i}.XM_shortarm(:));      
    
end


%zscore event though some arms never explored
clear tmp tmp2 tmp3 
for i = 1:6
tmp = find(isfinite(epoch_mean_raster(i,:)))
tmp2 = zscore(epoch_mean_raster(i,tmp)')';
for j = 1:numel(tmp)
    tmp3(i,tmp(j)) = tmp2(j);
end
end
tmp4 = find(isnan(epoch_mean_raster))
tmp3(tmp4) = nan;
figure; imagesc((tmp3))               %image is zscored over time, but arranged HC1-6, then EZM, EPM, XC, which clearly shows a time dependent effect overlaid on a environment effect
xlabel('epoch')
mean(tmp3,'omitnan')
std(epoch_mean_raster,'omitnan')./(size(epoch_mean_raster,1))^0.5
figure; plot(mean(tmp3,'omitnan'))





% now compare distribution of activity on an individual cell basis
% (concatenated across all datasets)
clear tmp epoch_distro_calcium
for j = 1:22; tmp{1,j} = []; end
for i = 1:numel (calcium_epoch)
    tmp{1} = [tmp{1}; (mean(calcium_epoch{i}.HC1(:,:)')')];
    tmp{2} = [tmp{2}; (mean(calcium_epoch{i}.HC2(:,:)')')];
    tmp{3} = [tmp{3}; (mean(calcium_epoch{i}.HC3(:,:)')')];
    tmp{4} = [tmp{4}; (mean(calcium_epoch{i}.HC4(:,:)')')];
    tmp{5} = [tmp{5}; (mean(calcium_epoch{i}.HC5(:,:)')')];
    tmp{6} = [tmp{6}; (mean(calcium_epoch{i}.HC6(:,:)')')];
    tmp{7} = [tmp{7}; (mean(calcium_epoch{i}.EZM(:,:)')')];
    tmp{8} = [tmp{8}; (mean(calcium_epoch{i}.EPM(:,:)')')];
    tmp{9} = [tmp{9}; (mean(calcium_epoch{i}.XM(:,:)')')];
    
    %arm specific vectors
    %have to insert placeholder if mouse doesnt explore arm
    cells = size(calcium_epoch{i}.HC1,1); placeholder = nan(cells,1);
    if isempty (calcium_epoch{i}.EZM_open_left) == 0;                                tmp{10} = [tmp{10}; (mean(calcium_epoch{i}.EZM_open_left(:,:)')')];                else tmp{10} = [tmp{10}; placeholder]; end
    if isempty (calcium_epoch{i}.EZM_open_right) == 0;                               tmp{11} = [tmp{11}; (mean(calcium_epoch{i}.EZM_open_right(:,:)')')];               else tmp{11} = [tmp{11}; placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_topfromedge) == 0;                       tmp{12} = [tmp{12}; (mean(calcium_epoch{i}.EZM_closed_topfromedge(:,:)')')];       else tmp{12} = [tmp{12}; placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_bottomfromedge) == 0;                    tmp{13} = [tmp{13}; (mean(calcium_epoch{i}.EZM_closed_bottomfromedge(:,:)')')];    else tmp{13} = [tmp{13}; placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_topfromopen) == 0;                       tmp{14} = [tmp{14}; (mean(calcium_epoch{i}.EZM_closed_topfromopen(:,:)')')];       else tmp{14} = [tmp{14}; placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_bottomfromopen) == 0;                    tmp{15} = [tmp{15}; (mean(calcium_epoch{i}.EZM_closed_bottomfromopen(:,:)')')];    else tmp{15} = [tmp{15}; placeholder]; end
    
    if isempty (calcium_epoch{i}.EPM_open_left) == 0;                                tmp{16} = [tmp{16}; (mean(calcium_epoch{i}.EPM_open_left(:,:)')')];                else tmp{16} = [tmp{16}; placeholder]; end
    if isempty (calcium_epoch{i}.EPM_open_right) == 0;                               tmp{17} = [tmp{17}; (mean(calcium_epoch{i}.EPM_open_right(:,:)')')];               else tmp{17} = [tmp{17}; placeholder]; end
    if isempty (calcium_epoch{i}.EPM_closed_top) == 0;                               tmp{18} = [tmp{18}; (mean(calcium_epoch{i}.EPM_closed_top(:,:)')')];               else tmp{18} = [tmp{18}; placeholder]; end
    if isempty (calcium_epoch{i}.EPM_closed_bottom) == 0;                            tmp{19} = [tmp{19}; (mean(calcium_epoch{i}.EPM_closed_bottom(:,:)')')];            else tmp{19} = [tmp{19}; placeholder]; end

    if isempty (calcium_epoch{i}.XM_longarm_top) == 0;                               tmp{20} = [tmp{20}; (mean(calcium_epoch{i}.XM_longarm_top(:,:)')')];               else tmp{20} = [tmp{20}; placeholder]; end
    if isempty (calcium_epoch{i}.XM_longarm_bottom) == 0;                            tmp{21} = [tmp{21}; (mean(calcium_epoch{i}.XM_longarm_bottom(:,:)')')];            else tmp{21} = [tmp{21}; placeholder]; end
    if isempty (calcium_epoch{i}.XM_shortarm) == 0;                                  tmp{22} = [tmp{22}; (mean(calcium_epoch{i}.XM_shortarm(:,:)')')];                  else tmp{22} = [tmp{22}; placeholder]; end  
end
epoch_distro_calcium = []
for i = 1:22;     epoch_distro_calcium(:,i) = tmp{i}; end



%zscore event though some arms never explored
clear tmp tmp2 tmp3 
for i = 1:size(epoch_distro_calcium,1)
tmp = find(isfinite(epoch_distro_calcium(i,:)));
tmp2 = zscore(epoch_distro_calcium(i,tmp)')';
for j = 1:numel(tmp)
    tmp3(i,tmp(j)) = tmp2(j);
end
end
tmp4 = find(isnan(epoch_distro_calcium))
tmp3(tmp4) = nan;
[a b] = sort(mean(tmp3(:,1:6)')');
figure; imagesc(tmp3(b,:)); caxis([-0.2 0.7]); colormap(brewermap([],"OrRd"))               %image is zscored over time, but arranged HC1-6, then EZM, EPM, XC, which clearly shows a time dependent effect overlaid on a environment effect


[a b] = sort(mean(tmp3(:,1:6)')');
imagesc(tmp3(b,:))
correlations_calcium = (corr(tmp3,'rows','pairwise')); for i = 1:22; correlations_calcium(i,i) = nan; end
figure; imagesc(correlations_calcium); caxis([-0.2 0.4]); colormap(brewermap([],"OrRd"))

clear tmp
for i = 1
    tmp(1,i) = mean(mean(correlations_calcium(10:11,10:11),'omitnan'),'omitnan'); %ezm open vs ezm open
    tmp(2,i) = mean(mean(correlations_calcium(16:17,16:17),'omitnan'),'omitnan'); %epm opne vs epm open    
    tmp(3,i) = mean(mean(correlations_calcium(10:11,[12:15 18:19]),'omitnan'),'omitnan'); %ezm open vs ezm + epm closed
    tmp(4,i) = mean(mean(correlations_calcium(16:17,[12:15 18:19],i),'omitnan'),'omitnan'); %epm open vs epm + epm closed    
    tmp(5,i) = mean(mean(correlations_calcium(10:11,16:17),'omitnan'),'omitnan'); %ezm open vs epm open
    tmp(6,i) = mean(mean(correlations_calcium([10:11, 16:17],20:22),'omitnan'),'omitnan'); %ezm open  Epm open vs TM
    tmp(7,i) = mean(mean(correlations_calcium([12:15, 18:19],20:22),'omitnan'),'omitnan'); %ezm open  Epm open vs TM 

    tmp(8,i) = mean(mean(correlations_calcium([1:6], 7:22),'omitnan'),'omitnan'); %HC vs all other contexts 

    tmp(9,i) = mean(mean(correlations_calcium([1:6], 1:6),'omitnan'),'omitnan'); %HC vs HC
    tmp(10,i)= mean(mean(correlations_calcium([10:15], 10:15),'omitnan'),'omitnan'); %EZM vs EZM
    tmp(11,i)= mean(mean(correlations_calcium([16:19], 16:19),'omitnan'),'omitnan'); %EPM vs EPM   
    tmp(12,i) = mean(mean(correlations_calcium([19:22], 20:22),'omitnan'),'omitnan'); %XM vs XM

    tmp(13,i) = mean(mean(correlations_calcium([1:6], 10:15),'omitnan'),'omitnan'); %HC vs EZM (broke down by location and pooled)
    tmp(14,i) = mean(mean(correlations_calcium([1:6], 16:19),'omitnan'),'omitnan'); %HC vs EPM (broke down by location and pooled)   
    tmp(15,i) = mean(mean(correlations_calcium([1:6], 20:22),'omitnan'),'omitnan'); %HC vs XM  (broke down by location and pooled)

    tmp(16,i) = mean(mean(correlations_calcium(7, 8),'omitnan'),'omitnan'); %EZM vs EPM all frames
    tmp(17,i) = mean(mean(correlations_calcium(7, 9),'omitnan'),'omitnan'); %EZM vs XM all frames 
    tmp(18,i) = mean(mean(correlations_calcium(8, 9),'omitnan'),'omitnan'); %EPM vs XM all frames

    tmp(19,i) = mean(mean(correlations_calcium(10:15, 16:19),'omitnan'),'omitnan'); %EZM vs EPM (broke down by location)
    tmp(20,i) = mean(mean(correlations_calcium(10:15, 20:22),'omitnan'),'omitnan'); %EZM vs XM (broke down by location)
    tmp(21,i) = mean(mean(correlations_calcium(16:19, 20:22),'omitnan'),'omitnan'); %EPM vs XM (broke down by location)

    tmp(22,i) = mean(mean(correlations_calcium(7, 16:19),'omitnan'),'omitnan'); %EZM vs EPM (all vs broke down by location)
    tmp(23,i) = mean(mean(correlations_calcium(7, 20:22),'omitnan'),'omitnan'); %EZM vs XM (all vs broke down by location)
    tmp(24,i) = mean(mean(correlations_calcium(8, 20:22),'omitnan'),'omitnan'); %EPM vs XM (all vs broke down by location)
end













%now analyze on mouse by mouse basis

%calcium by mouse


clear epoch_mean_calcium_bymouse
for i = 1:numel (raster_epoch)
    epoch_mean_calcium_bymouse{i}(:,1) = mean(calcium_epoch{i}.HC1')';
    epoch_mean_calcium_bymouse{i}(:,2) = mean(calcium_epoch{i}.HC2')';
    epoch_mean_calcium_bymouse{i}(:,3) = mean(calcium_epoch{i}.HC3')';
    epoch_mean_calcium_bymouse{i}(:,4) = mean(calcium_epoch{i}.HC4')';
    epoch_mean_calcium_bymouse{i}(:,5) = mean(calcium_epoch{i}.HC5')';
    epoch_mean_calcium_bymouse{i}(:,6) = mean(calcium_epoch{i}.HC6')';
    epoch_mean_calcium_bymouse{i}(:,7) = mean(calcium_epoch{i}.EZM')';
    epoch_mean_calcium_bymouse{i}(:,8) = mean(calcium_epoch{i}.EPM')';
    epoch_mean_calcium_bymouse{i}(:,9) = mean(calcium_epoch{i}.XM')';  
    %arm specific vectors
    epoch_mean_calcium_bymouse{i}(:,10) = mean(calcium_epoch{i}.EZM_open_left')';  
    epoch_mean_calcium_bymouse{i}(:,11) = mean(calcium_epoch{i}.EZM_open_right')';  
    epoch_mean_calcium_bymouse{i}(:,12) = mean(calcium_epoch{i}.EZM_closed_topfromedge')';  
    epoch_mean_calcium_bymouse{i}(:,13) = mean(calcium_epoch{i}.EZM_closed_bottomfromedge')';   
    epoch_mean_calcium_bymouse{i}(:,14) = mean(calcium_epoch{i}.EZM_closed_topfromopen')';  
    epoch_mean_calcium_bymouse{i}(:,15) = mean(calcium_epoch{i}.EZM_closed_bottomfromopen')'; 
    
    epoch_mean_calcium_bymouse{i}(:,16) = mean(calcium_epoch{i}.EPM_open_left')';  
    epoch_mean_calcium_bymouse{i}(:,17) = mean(calcium_epoch{i}.EPM_open_right')';  
    epoch_mean_calcium_bymouse{i}(:,18) = mean(calcium_epoch{i}.EPM_closed_top')';  
    epoch_mean_calcium_bymouse{i}(:,19) = mean(calcium_epoch{i}.EPM_closed_bottom')';      

    epoch_mean_calcium_bymouse{i}(:,20) = mean(calcium_epoch{i}.XM_longarm_top')';  
    epoch_mean_calcium_bymouse{i}(:,21) = mean(calcium_epoch{i}.XM_longarm_bottom')';  
    epoch_mean_calcium_bymouse{i}(:,22) = mean(calcium_epoch{i}.XM_shortarm')';      
    
end

clear tmp
for i = 1:numel(epoch_mean_calcium_bymouse)
    tmp(:,:,i) = corr(epoch_mean_calcium_bymouse{i},'rows','pairwise');
end
for i = 1:size(tmp,1)
    tmp(i,i,:) = nan;
end
epoch_calcium_bymouse = tmp;
figure; imagesc(mean(tmp,3,'omitnan')); caxis([0 0.8]); colormap(brewermap([],"OrRd"))


%now average open arm correlations vs all other arms
%EZM 1 - 10
%EZM 2 - 11
%EPM 1 - 16
%EPM 2 - 17
%TMaze 1- 20
%Tmaze 2- 21
%Tmaze 3- 22

%EZM closed 12-15
%EPM closed 18-19
clear tmp
for i = 1: size(epoch_calcium_bymouse,3)
    tmp(1,i) = mean(mean(epoch_calcium_bymouse(10:11,10:11,i),'omitnan'),'omitnan'); %ezm open vs ezm open
    tmp(2,i) = mean(mean(epoch_calcium_bymouse(16:17,16:17,i),'omitnan'),'omitnan'); %epm opne vs epm open    
    tmp(3,i) = mean(mean(epoch_calcium_bymouse(10:11,[12:15 18:19],i),'omitnan'),'omitnan'); %ezm open vs ezm + epm closed
    tmp(4,i) = mean(mean(epoch_calcium_bymouse(16:17,[12:15 18:19],i),'omitnan'),'omitnan'); %epm open vs epm + epm closed    
    tmp(5,i) = mean(mean(epoch_calcium_bymouse(10:11,16:17,i),'omitnan'),'omitnan'); %ezm open vs epm open
    tmp(6,i) = mean(mean(epoch_calcium_bymouse([10:11, 16:17],20:22,i),'omitnan'),'omitnan'); %ezm open  Epm open vs TM
    tmp(7,i) = mean(mean(epoch_calcium_bymouse([12:15, 18:19],20:22,i),'omitnan'),'omitnan'); %ezm open  Epm open vs TM 

    tmp(8,i) = mean(mean(epoch_calcium_bymouse([1:6], 7:22,i),'omitnan'),'omitnan'); %HC vs all other contexts 

    tmp(9,i) = mean(mean(epoch_calcium_bymouse([1:6], 1:6,i),'omitnan'),'omitnan'); %HC vs HC
    tmp(10,i)= mean(mean(epoch_calcium_bymouse([10:15], 10:15,i),'omitnan'),'omitnan'); %EZM vs EZM
    tmp(11,i)= mean(mean(epoch_calcium_bymouse([16:19], 16:19,i),'omitnan'),'omitnan'); %EPM vs EPM   
    tmp(12,i) = mean(mean(epoch_calcium_bymouse([19:22], 20:22,i),'omitnan'),'omitnan'); %XM vs XM

    tmp(13,i) = mean(mean(epoch_calcium_bymouse([1:6], 10:15,i),'omitnan'),'omitnan'); %HC vs EZM (broke down by location and pooled)
    tmp(14,i) = mean(mean(epoch_calcium_bymouse([1:6], 16:19,i),'omitnan'),'omitnan'); %HC vs EPM (broke down by location and pooled)   
    tmp(15,i) = mean(mean(epoch_calcium_bymouse([1:6], 20:22,i),'omitnan'),'omitnan'); %HC vs XM  (broke down by location and pooled)

    tmp(16,i) = mean(mean(epoch_calcium_bymouse(7, 8,i),'omitnan'),'omitnan'); %EZM vs EPM all frames
    tmp(17,i) = mean(mean(epoch_calcium_bymouse(7, 9,i),'omitnan'),'omitnan'); %EZM vs XM all frames 
    tmp(18,i) = mean(mean(epoch_calcium_bymouse(8, 9,i),'omitnan'),'omitnan'); %EPM vs XM all frames

    tmp(19,i) = mean(mean(epoch_calcium_bymouse(10:15, 16:19,i),'omitnan'),'omitnan'); %EZM vs EPM (broke down by location)
    tmp(20,i) = mean(mean(epoch_calcium_bymouse(10:15, 20:22,i),'omitnan'),'omitnan'); %EZM vs XM (broke down by location)
    tmp(21,i) = mean(mean(epoch_calcium_bymouse(16:19, 20:22,i),'omitnan'),'omitnan'); %EPM vs XM (broke down by location)

    tmp(22,i) = mean(mean(epoch_calcium_bymouse(7, 16:19,i),'omitnan'),'omitnan'); %EZM vs EPM (all vs broke down by location)
    tmp(23,i) = mean(mean(epoch_calcium_bymouse(7, 20:22,i),'omitnan'),'omitnan'); %EZM vs XM (all vs broke down by location)
    tmp(24,i) = mean(mean(epoch_calcium_bymouse(8, 20:22,i),'omitnan'),'omitnan'); %EPM vs XM (all vs broke down by location)
end

%compare ezm open vs epm open similarity to the similarity between ezm open
%and ezm open vs (ezm + epm)closed or EPM open vs (ezm + epm) closed
figure; scatter(tmp(5,:), tmp(3,:),'.'); hold on;  scatter(tmp(5,:), tmp(4,:),'.'); hold on; line([0 1], [0 1])
[n p] = ttest2(tmp(5,:), tmp(3,:))
[n p] = ttest2(tmp(5,:), tmp(4,:))
mean(tmp(5,:)), std(tmp(5,:))./(6^0.5)
mean(tmp(3,:)), std(tmp(3,:))./(6^0.5)
mean(tmp(4,:)), std(tmp(4,:))./(6^0.5)

%compare ezm open vs ezm open or epm open vs epm open (same open arm) similarity to the similarity between ezm open
%or ezm open vs (ezm + epm)closed
figure; scatter(tmp(1,:), tmp(3,:),'.'); hold on; scatter(tmp(2,:), tmp(4,:),'.'); hold on; line([0 1], [0 1])
[n p] = ttest2(tmp(1,:), tmp(3,:))
[n p] = ttest2(tmp(2,:), tmp(4,:))
mean(tmp(3,:)), std(tmp(3,:))./(6^0.5)
mean(tmp(2,:)), std(tmp(2,:))./(6^0.5)
mean(tmp(4,:)), std(tmp(4,:))./(6^0.5)


%compare ezm + epm open arms or ezm + epm closed arms similarity to similarity between EZM (or EPM) open arm  vs
%TMaze
figure; scatter(tmp(5,:), tmp(6,:),'.'); hold on; scatter(tmp(5,:), tmp(7,:),'.'); hold on; line([0 1], [0 1])
[n p] = ttest2(tmp(5,:), tmp(6,:))
[n p] = ttest2(tmp(5,:), tmp(7,:))
mean(tmp(6,:)), std(tmp(6,:))./(6^0.5)
mean(tmp(5,:)), std(tmp(5,:))./(6^0.5)
mean(tmp(7,:)), std(tmp(7,:))./(6^0.5)







%%


%calculate modulation index for 
%EZM open arms vs preceding Home cage (1), 
%EZM closed arms vs preceding home cage (1), 
%EPM open arms vs preceding homecage(3)
%EPM closed arms vs preceding home cage (3)
%tmaze vs preceding home cage (5)

%HC1 vs HC2
%HC3 v HC4
%hc5 v HC6

%HC1,2 vs EZM
%HC3,4 vs EPM
%HC5,6 vs TM

%EZM all vs EPM all
%EZM all vs TM all
%EPM vs TM all

%EZM Open vs Closed
%EPM Open vs Closed
%TM short vs long1,2
%TM long1 vs TMshortlong2
%TM long2 vs TMshortlong1

clear tmpA
clear tmpB
iterations = 200
for i = 1:numel(calcium_epoch)

    
    i
    tmpA = [calcium_epoch{i}.HC1]; %HC1
    tmpB = [calcium_epoch{i}.HC2]; %HC2
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HC12, Cells_B{i}.HC12, dist_A{i}.HC12, dist_B{i}.HC12] = ActivityModulationB([tmpA tmpB], A, B, iterations);

    tmpA = [calcium_epoch{i}.HC3]; %HC3
    tmpB = [calcium_epoch{i}.HC4]; %HC4
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HC34, Cells_B{i}.HC34, dist_A{i}.HC34, dist_B{i}.HC34] = ActivityModulationB([tmpA tmpB], A, B, iterations);
    
    tmpA = [calcium_epoch{i}.HC5]; %HC5
    tmpB = [calcium_epoch{i}.HC6]; %HC6
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HC56, Cells_B{i}.HC56, dist_A{i}.HC56, dist_B{i}.HC56] = ActivityModulationB([tmpA tmpB], A, B, iterations);
    
    tmpA = [calcium_epoch{i}.EZM]; %EZM
    tmpB = [calcium_epoch{i}.HC1 calcium_epoch{i}.HC2]; %HC1 & 2
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HCvEZM, Cells_B{i}.HCvEZM, dist_A{i}.HCvEZM, dist_B{i}.HCvEZM] = ActivityModulationB([tmpA tmpB], A, B, iterations);
        
    tmpA = [calcium_epoch{i}.EPM]; %EPM
    tmpB = [calcium_epoch{i}.HC3 calcium_epoch{i}.HC4]; %HC3 &4
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HCvEPM, Cells_B{i}.HCvEPM, dist_A{i}.HCvEPM, dist_B{i}.HCvEPM] = ActivityModulationB([tmpA tmpB], A, B, iterations);
          
    tmpA = [calcium_epoch{i}.XM]; %TM
    tmpB = [calcium_epoch{i}.HC5 calcium_epoch{i}.HC6]; %HC5 &6
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HCvXM, Cells_B{i}.HCvXM, dist_A{i}.HCvXM, dist_B{i}.HCvXM] = ActivityModulationB([tmpA tmpB], A, B, iterations);
           

    
    tmpA = [calcium_epoch{i}.EZM]; %EZM
    tmpB = [calcium_epoch{i}.EPM]; %EPM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EZMvsEPM, Cells_B{i}.EZMvsEPM, dist_A{i}.EZMvsEPM, dist_B{i}.EZMvsEPM] = ActivityModulationB([tmpA tmpB], A, B, iterations);    
    
    tmpA = [calcium_epoch{i}.EZM]; %EZM
    tmpB = [calcium_epoch{i}.XM]; %TM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EZMvsXM, Cells_B{i}.EZMvsXM, dist_A{i}.EZMvsXM, dist_B{i}.EZMvsXM] = ActivityModulationB([tmpA tmpB], A, B, iterations);    
        
    tmpA = [calcium_epoch{i}.EPM]; %EPM
    tmpB = [calcium_epoch{i}.XM]; %TM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EPMvsXM, Cells_B{i}.EPMvsXM, dist_A{i}.EPMvsXM, dist_B{i}.EPMvsXM] = ActivityModulationB([tmpA tmpB], A, B, iterations);    
      
    
    
    
    %Modulation within EZM
    tmpA = [calcium_epoch{i}.EZM_open_right calcium_epoch{i}.EZM_open_left]; %EZM Open
    tmpB = [calcium_epoch{i}.EZM_closed_topfromedge calcium_epoch{i}.EZM_closed_topfromopen calcium_epoch{i}.EZM_closed_bottomfromedge calcium_epoch{i}.EZM_closed_bottomfromopen]; %EZM Closed
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EZMOpenClosed, Cells_B{i}.EZMOpenClosed, dist_A{i}.EZMOpenClosed, dist_B{i}.EZMOpenClosed] = ActivityModulationB([tmpA tmpB], A, B, iterations); 
    
    %modulation within EPM
    tmpA = [calcium_epoch{i}.EPM_open_left calcium_epoch{i}.EPM_open_right]; %EPM Open
    tmpB = [calcium_epoch{i}.EPM_closed_top calcium_epoch{i}.EPM_closed_bottom]; %EPM Closed
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.EPMopenClosed, Cells_B{i}.EPMopenClosed, dist_A{i}.EPMopenClosed, dist_B{i}.EPMopenClosed] = ActivityModulationB([tmpA tmpB], A, B,iterations);    

    %modulation within TMaze
    tmpA = [calcium_epoch{i}.XM_longarm_top calcium_epoch{i}.XM_longarm_bottom ]; %Tmaze long arm
    tmpB = [calcium_epoch{i}.XM_shortarm]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.TmazeLongShort, Cells_B{i}.TmazeLongShort, dist_A{i}.TmazeLongShort, dist_B{i}.TmazeLongShort] = ActivityModulationB([tmpA tmpB], A, B,iterations);  

    %modulation within TMaze
    tmpA = [calcium_epoch{i}.XM_longarm_top  ]; %Tmaze long arm
    tmpB = [calcium_epoch{i}.XM_shortarm calcium_epoch{i}.XM_longarm_bottom]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.TmazeLong1Short, Cells_B{i}.TmazeLong1Short, dist_A{i}.TmazeLong1Short, dist_B{i}.TmazeLong1Short] = ActivityModulationB([tmpA tmpB], A, B,iterations);  

        %modulation within TMaze
    tmpA = [calcium_epoch{i}.XM_longarm_bottom ]; %Tmaze long arm
    tmpB = [calcium_epoch{i}.XM_shortarm calcium_epoch{i}.XM_longarm_top]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.TmazeLong2Short, Cells_B{i}.TmazeLong2Short, dist_A{i}.TmazeLong2Short, dist_B{i}.TmazeLong2Short] = ActivityModulationB([tmpA tmpB], A, B,iterations);  

end





%All Mice

%1. HC 1v2 2. HC 3v4 3. HC 5v6
%4 HC1,2 vs EZM 5. HC3,4 vs EPM 6. HC5,6 vs TM
%7 EZM vs EPM 8 EZM vs TM 9 EPM vs TM
%10 EZM Open vs EZM Closed 11 EPM Open vs EPM Closed
%12 TM long vs short 13. TM long 1 vs shortlong 14. TM long2 vs shortlong

k = 1
Anxiety_mod_calcium = [];
for i = 1:numel(Cells_A); 
    tmp = [Cells_A{i}.HC12(:,4) Cells_A{i}.HC34(:,4) Cells_A{i}.HC56(:,4)... 
        Cells_A{i}.HCvEZM(:,4) Cells_A{i}.HCvEPM(:,4) Cells_A{i}.HCvXM(:,4) ...
        Cells_A{i}.EZMvsEPM(:,4) Cells_A{i}.EZMvsXM(:,4) Cells_A{i}.EPMvsXM(:,4)...
        Cells_A{i}.EZMOpenClosed(:,4) Cells_A{i}.EPMopenClosed(:,4) ...
        Cells_A{i}.TmazeLongShort(:,4) Cells_A{i}.TmazeLong1Short(:,4) Cells_A{i}.TmazeLong2Short(:,4)];    
    Anxiety_mod_calcium = [Anxiety_mod_calcium ; [tmp repmat(k, numel(Cells_A{i}.HC12(:,4)), 1)]];

    k = k+1;
end
tmp = corr(Anxiety_mod_calcium,'rows','pairwise')
for i = 1:size(tmp,2); tmp(i,i) = nan; end
figure; imagesc((tmp(1:14,1:14)))

%1. HC 1v2 2. HC 3v4 3. HC 5v6
%4 HC1,2 vs EZM 5. HC3,4 vs EPM 6. HC5,6 vs TM
%7 EZM vs EPM 8 EZM vs TM 9 EPM vs TM
%10 EZM Open vs EZM Closed 11 EPM Open vs EPM Closed
%12 TM long vs short 13. TM long 1 vs shortlong 14. TM long2 vs shortlong

mean(mean(tmp(1:3,1:3), 'omitnan'),'omitnan') %similarity between HCHCHC
mean(mean(tmp(4:6,4:6), 'omitnan'),'omitnan') %similarity between context specific cahnges from home cage
mean(mean(tmp(10:11,10:11), 'omitnan'),'omitnan') %EZM Open/Closed vs EPM open/closed
mean(mean(tmp(10:11,1:3), 'omitnan'),'omitnan') %EZM Open/Closed vs HC
mean(mean(tmp(10:11,12:14), 'omitnan'),'omitnan') %EZM Open/Closed vs TM



xx = linspace(0,1,10)
space = [0 0.10]

figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,7),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,8),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,9),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,10),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,7), Anxiety_mod_calcium (:,8),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,7), Anxiety_mod_calcium (:,9),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_calcium (:,7), Anxiety_mod_calcium (:,10),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)


corr(Anxiety_mod_calcium (:,1), Anxiety_mod_calcium (:,2))
corr(Anxiety_mod_calcium (:,1), Anxiety_mod_calcium (:,3))
corr(Anxiety_mod_calcium (:,1), Anxiety_mod_calcium (:,5))
corr(Anxiety_mod_calcium (:,5), Anxiety_mod_calcium (:,6))
corr(Anxiety_mod_calcium (:,5), Anxiety_mod_calcium (:,7))
corr(Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,7)) %EZM open/closed vs EPM Open vs Closed
corr(Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,8)) %EZM Open vs Closed vs Tmaze long vs short
corr(Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,9)) %EZM Open vs Closed vs Tmaze long vs short
corr(Anxiety_mod_calcium (:,6), Anxiety_mod_calcium (:,10)) %EZM Open vs Closed vs Tmaze long vs short
corr(Anxiety_mod_calcium (:,7), Anxiety_mod_calcium (:,8)) %EPM Open vs Closed vs Tmaze Long vs Short
corr(Anxiety_mod_calcium (:,7), Anxiety_mod_calcium (:,9)) %EPM Open vs Closed vs Tmaze Long vs Short
corr(Anxiety_mod_calcium (:,7), Anxiety_mod_calcium (:,10)) %EPM Open vs Closed vs Tmaze Long vs Short



%now run same analysis on a mouse by mouse basis

clear Anxiety_mod_calcium_bymouse
for i = 1:6

    tmp = find(Anxiety_mod_calcium(:,15) == i);
    tmp2 = find(Anxiety_mod_calcium(:,15) == i);
    Anxiety_mod_calcium_bymouse(:,:,i) = corr(Anxiety_mod_calcium(tmp,:), Anxiety_mod_calcium(tmp2,:),'rows','pairwise');
end

for i = 1:size(Anxiety_mod_calcium_bymouse,1)
    Anxiety_mod_calcium_bymouse(i,i,:) = nan;
end

clear tmp
for i = 1:6
tmp (1,i) = mean(mean(Anxiety_mod_calcium_bymouse(1:3,1:3,i), 'omitnan'),'omitnan'); %similarity between HCHCHC
tmp (2,i) =mean(mean(Anxiety_mod_calcium_bymouse(4:6,4:6,i), 'omitnan'),'omitnan'); %similarity between context specific cahnges from home cage
tmp (3,i) =mean(mean(Anxiety_mod_calcium_bymouse(10:11,10:11,i), 'omitnan'),'omitnan'); %EZM Open/Closed vs EPM open/closed
tmp (4,i) =mean(mean(Anxiety_mod_calcium_bymouse(10:11,1:3,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs HC
tmp (5,i)  =mean(mean(Anxiety_mod_calcium_bymouse(7:8,9,i), 'omitnan'),'omitnan'); %EZM vs EPM, EZM vs TM
tmp(6,i) =mean(mean(Anxiety_mod_calcium_bymouse(10:11,12,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs TM 1 (short vs longs) %% will disregard this and focus on longs vs shortlong
tmp(7,i) =mean(mean(Anxiety_mod_calcium_bymouse(10:11,13,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs TM 2
tmp(8,i) =mean(mean(Anxiety_mod_calcium_bymouse(10:11,14,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs TM 3
end


(tmp(1,:))
(tmp(2,:))
(tmp(3,:))
(tmp(4,:))
(tmp(5,:))
(tmp(6,:))
(tmp(7,:))
(tmp(8,:))

mean([tmp(7,:); tmp(8,:)])






%now analyze on a mouse by mouse basis (old version)

clear answers
for i = 1:6

    tmp = find(Anxiety_mod(:,11) == i);
    tmp2 = find(Anxiety_mod(:,11) == i);
    answers.EZMEPM(i) = corr(Anxiety_mod(tmp,6), Anxiety_mod(tmp2,7),'rows','pairwise');
    answers.EZMTMaze(i) = mean([corr(Anxiety_mod(tmp,6), Anxiety_mod(tmp2,8),'rows','pairwise') corr(Anxiety_mod(tmp,6), Anxiety_mod(tmp2,9),'rows','pairwise') corr(Anxiety_mod(tmp,6), Anxiety_mod(tmp2,10),'rows','pairwise')]);
    answers.EPMTMaze(i) = mean([corr(Anxiety_mod(tmp,7), Anxiety_mod(tmp2,8),'rows','pairwise') corr(Anxiety_mod(tmp,7), Anxiety_mod(tmp2,9),'rows','pairwise') corr(Anxiety_mod(tmp,7), Anxiety_mod(tmp2,10),'rows','pairwise')]);
end


[n p] = signrank(answers.EZMEPM', answers.EZMTMaze' )
[n p] = signrank(answers.EZMEPM', answers.EPMTMaze' )
[n p] = signrank(answers.EZMEPM', mean ([answers.EPMTMaze; answers.EZMTMaze ])' )

mean(mean ([answers.EPMTMaze; answers.EZMTMaze ])'), std(mean([answers.EPMTMaze; answers.EZMTMaze ]))'./(6^0.5)
mean(mean (answers.EZMEPM')), std(answers.EZMEPM')./(6^0.5)


figure;scatter(answers.EZMEPM', mean ([answers.EPMTMaze; answers.EZMTMaze ])' ,'.'); hold on; line([-0.1 0.7],[-0.1 0.7])










%%

% what is the angle of ensemble vectors (context vs anxiety ---- is it
% orthogonal??)

%will compare
%1. HC vs EZM
%2. HC vs TPM
%3. HC vs TM
%4. EZM Open vs closed
%5. EPM Open vs Closed



%1. HC 1v2 2. HC 3v4 3. HC 5v6
%4 HC1,2 vs EZM 5. HC3,4 vs EPM 6. HC5,6 vs TM
%7 EZM vs EPM 8 EZM vs TM 9 EPM vs TM
%10 EZM Open vs EZM Closed 11 EPM Open vs EPM Closed
%12 TM long vs short 13. TM long 1 vs shortlong 14. TM long2 vs shortlong






for i = 1:6
for p = 1:14
    for pp = 1:14
    tmp = find(Anxiety_mod_calcium(:,15) == i);
    tmp2 = find(Anxiety_mod_calcium(:,15) == i);
    
    [Anx_cossim_calcium(p,pp,i) theta(p,pp,i)]= cossim(Anxiety_mod_calcium(tmp,p)'-0.5, Anxiety_mod_calcium(tmp2,pp)'-0.5,1);
    %have to center at zero
 
    end
end
end
%now calculate meaningcful cossine similarities

%1. HC vs EZM
%2. HC vs TPM
%3. HC vs TM
%4. EZM Open vs closed
%5. EPM Open vs Closed
small_cossim_calcium = Anx_cossim_calcium([4:6 10:11],[4:6 10:11],:);
small_cossim_calcium = Anx_cossim_calcium([4:6 10:11],[4:6 10:11],:);
figure; imagesc(mean(small_cossim_calcium,3))
for i = 1:5; small_cossim_calcium(i,i,:) = nan; end

clear tmp
for i = 1:6
tmp(1,i) = mean(mean(small_cossim_calcium(1:3, 1:3,i),'omitnan'), 'omitnan');
tmp(2,i) = mean(mean(small_cossim_calcium(1:3, 4:5,i),'omitnan'), 'omitnan');
tmp(3,i) = mean(mean(small_cossim_calcium(4:5, 4:5,i),'omitnan'), 'omitnan');
end








%%
%now analyze on binary data

clear tmp epoch_distro_raster
for j = 1:22; tmp{1,j} = []; end
for i = 1:numel (raster_epoch)
    tmp{1} = [tmp{1}; (mean(raster_epoch{i}.HC1(:,:)')')];
    tmp{2} = [tmp{2}; (mean(raster_epoch{i}.HC2(:,:)')')];
    tmp{3} = [tmp{3}; (mean(raster_epoch{i}.HC3(:,:)')')];
    tmp{4} = [tmp{4}; (mean(raster_epoch{i}.HC4(:,:)')')];
    tmp{5} = [tmp{5}; (mean(raster_epoch{i}.HC5(:,:)')')];
    tmp{6} = [tmp{6}; (mean(raster_epoch{i}.HC6(:,:)')')];
    tmp{7} = [tmp{7}; (mean(raster_epoch{i}.EZM(:,:)')')];
    tmp{8} = [tmp{8}; (mean(raster_epoch{i}.EPM(:,:)')')];
    tmp{9} = [tmp{9}; (mean(raster_epoch{i}.XM(:,:)')')];
    
    %arm specific vectors
    %have to insert placeholder if mouse doesnt explore arm
    cells = size(raster_epoch{i}.HC1,1); placeholder = nan(cells,1);
    if isempty (raster_epoch{i}.EZM_open_left) == 0;                                tmp{10} = [tmp{10}; (mean(raster_epoch{i}.EZM_open_left(:,:)')')];                else tmp{10} = [tmp{10}; placeholder]; end
    if isempty (raster_epoch{i}.EZM_open_right) == 0;                               tmp{11} = [tmp{11}; (mean(raster_epoch{i}.EZM_open_right(:,:)')')];               else tmp{11} = [tmp{11}; placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_topfromedge) == 0;                       tmp{12} = [tmp{12}; (mean(raster_epoch{i}.EZM_closed_topfromedge(:,:)')')];       else tmp{12} = [tmp{12}; placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_bottomfromedge) == 0;                    tmp{13} = [tmp{13}; (mean(raster_epoch{i}.EZM_closed_bottomfromedge(:,:)')')];    else tmp{13} = [tmp{13}; placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_topfromopen) == 0;                       tmp{14} = [tmp{14}; (mean(raster_epoch{i}.EZM_closed_topfromopen(:,:)')')];       else tmp{14} = [tmp{14}; placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_bottomfromopen) == 0;                    tmp{15} = [tmp{15}; (mean(raster_epoch{i}.EZM_closed_bottomfromopen(:,:)')')];    else tmp{15} = [tmp{15}; placeholder]; end
    
    if isempty (raster_epoch{i}.EPM_open_left) == 0;                                tmp{16} = [tmp{16}; (mean(raster_epoch{i}.EPM_open_left(:,:)')')];                else tmp{16} = [tmp{16}; placeholder]; end
    if isempty (raster_epoch{i}.EPM_open_right) == 0;                               tmp{17} = [tmp{17}; (mean(raster_epoch{i}.EPM_open_right(:,:)')')];               else tmp{17} = [tmp{17}; placeholder]; end
    if isempty (raster_epoch{i}.EPM_closed_top) == 0;                               tmp{18} = [tmp{18}; (mean(raster_epoch{i}.EPM_closed_top(:,:)')')];               else tmp{18} = [tmp{18}; placeholder]; end
    if isempty (raster_epoch{i}.EPM_closed_bottom) == 0;                            tmp{19} = [tmp{19}; (mean(raster_epoch{i}.EPM_closed_bottom(:,:)')')];            else tmp{19} = [tmp{19}; placeholder]; end

    if isempty (raster_epoch{i}.XM_longarm_top) == 0;                               tmp{20} = [tmp{20}; (mean(raster_epoch{i}.XM_longarm_top(:,:)')')];               else tmp{20} = [tmp{20}; placeholder]; end
    if isempty (raster_epoch{i}.XM_longarm_bottom) == 0;                            tmp{21} = [tmp{21}; (mean(raster_epoch{i}.XM_longarm_bottom(:,:)')')];            else tmp{21} = [tmp{21}; placeholder]; end
    if isempty (raster_epoch{i}.XM_shortarm) == 0;                                  tmp{22} = [tmp{22}; (mean(raster_epoch{i}.XM_shortarm(:,:)')')];                  else tmp{22} = [tmp{22}; placeholder]; end      
end
for i = 1:22;     epoch_distro_raster(:,i) = tmp{i}; end


%zscore event though some arms never explored
clear tmp tmp2 tmp3 
for i = 1:size(epoch_distro_raster,1)
tmp = find(isfinite(epoch_distro_raster(i,:)));
tmp2 = zscore(epoch_distro_raster(i,tmp)')';
for j = 1:numel(tmp)
    tmp3(i,tmp(j)) = tmp2(j);
end
end
tmp4 = find(isnan(epoch_distro_raster))
tmp3(tmp4) = nan;
[a b] = sort(mean(tmp3(:,1:6)')');
figure; imagesc(tmp3(b,:)); caxis([0 0.7]); colormap(brewermap([],"OrRd"))               %image is zscored over time, but arranged HC1-6, then EZM, EPM, XC, which clearly shows a time dependent effect overlaid on a environment effect
       

correlations_raster = (corr(tmp3,'rows','pairwise')); for i = 1:22; correlations_raster(i,i) = nan; end
figure; imagesc(correlations_raster)
caxis([-0.2 0.4]); colormap(brewermap([],"OrRd"))





clear tmp
for i = 1
    tmp(1,i) = mean(mean(correlations_raster(10:11,10:11),'omitnan'),'omitnan'); %ezm open vs ezm open
    tmp(2,i) = mean(mean(correlations_raster(16:17,16:17),'omitnan'),'omitnan'); %epm opne vs epm open    
    tmp(3,i) = mean(mean(correlations_raster(10:11,[12:15 18:19]),'omitnan'),'omitnan'); %ezm open vs ezm + epm closed
    tmp(4,i) = mean(mean(correlations_raster(16:17,[12:15 18:19],i),'omitnan'),'omitnan'); %epm open vs epm + epm closed    
    tmp(5,i) = mean(mean(correlations_raster(10:11,16:17),'omitnan'),'omitnan'); %ezm open vs epm open
    tmp(6,i) = mean(mean(correlations_raster([10:11, 16:17],20:22),'omitnan'),'omitnan'); %ezm open  Epm open vs TM
    tmp(7,i) = mean(mean(correlations_raster([12:15, 18:19],20:22),'omitnan'),'omitnan'); %ezm open  Epm open vs TM 

    tmp(8,i) = mean(mean(correlations_raster([1:6], 7:22),'omitnan'),'omitnan'); %HC vs all other contexts 

    tmp(9,i) = mean(mean(correlations_raster([1:6], 1:6),'omitnan'),'omitnan'); %HC vs HC
    tmp(10,i)= mean(mean(correlations_raster([10:15], 10:15),'omitnan'),'omitnan'); %EZM vs EZM
    tmp(11,i)= mean(mean(correlations_raster([16:19], 16:19),'omitnan'),'omitnan'); %EPM vs EPM   
    tmp(12,i) = mean(mean(correlations_raster([19:22], 20:22),'omitnan'),'omitnan'); %XM vs XM

    tmp(13,i) = mean(mean(correlations_raster([1:6], 10:15),'omitnan'),'omitnan'); %HC vs EZM (broke down by location and pooled)
    tmp(14,i) = mean(mean(correlations_raster([1:6], 16:19),'omitnan'),'omitnan'); %HC vs EPM (broke down by location and pooled)   
    tmp(15,i) = mean(mean(correlations_raster([1:6], 20:22),'omitnan'),'omitnan'); %HC vs XM  (broke down by location and pooled)

    tmp(16,i) = mean(mean(correlations_raster(7, 8),'omitnan'),'omitnan'); %EZM vs EPM all frames
    tmp(17,i) = mean(mean(correlations_raster(7, 9),'omitnan'),'omitnan'); %EZM vs XM all frames 
    tmp(18,i) = mean(mean(correlations_raster(8, 9),'omitnan'),'omitnan'); %EPM vs XM all frames

    tmp(19,i) = mean(mean(correlations_raster(10:15, 16:19),'omitnan'),'omitnan'); %EZM vs EPM (broke down by location)
    tmp(20,i) = mean(mean(correlations_raster(10:15, 20:22),'omitnan'),'omitnan'); %EZM vs XM (broke down by location)
    tmp(21,i) = mean(mean(correlations_raster(16:19, 20:22),'omitnan'),'omitnan'); %EPM vs XM (broke down by location)

    tmp(22,i) = mean(mean(correlations_raster(7, 16:19),'omitnan'),'omitnan'); %EZM vs EPM (all vs broke down by location)
    tmp(23,i) = mean(mean(correlations_raster(7, 20:22),'omitnan'),'omitnan'); %EZM vs XM (all vs broke down by location)
    tmp(24,i) = mean(mean(correlations_raster(8, 20:22),'omitnan'),'omitnan'); %EPM vs XM (all vs broke down by location)
end



%rasters by mouse
clear epoch_mean_raster_bymouse
for i = 1:numel (raster_epoch)
    epoch_mean_raster_bymouse{i}(:,1) = mean(raster_epoch{i}.HC1')';
    epoch_mean_raster_bymouse{i}(:,2) = mean(raster_epoch{i}.HC2')';
    epoch_mean_raster_bymouse{i}(:,3) = mean(raster_epoch{i}.HC3')';
    epoch_mean_raster_bymouse{i}(:,4) = mean(raster_epoch{i}.HC4')';
    epoch_mean_raster_bymouse{i}(:,5) = mean(raster_epoch{i}.HC5')';
    epoch_mean_raster_bymouse{i}(:,6) = mean(raster_epoch{i}.HC6')';
    epoch_mean_raster_bymouse{i}(:,7) = mean(raster_epoch{i}.EZM')';
    epoch_mean_raster_bymouse{i}(:,8) = mean(raster_epoch{i}.EPM')';
    epoch_mean_raster_bymouse{i}(:,9) = mean(raster_epoch{i}.XM')';  
    %arm specific vectors
    epoch_mean_raster_bymouse{i}(:,10) = mean(raster_epoch{i}.EZM_open_left')';  
    epoch_mean_raster_bymouse{i}(:,11) = mean(raster_epoch{i}.EZM_open_right')';  
    epoch_mean_raster_bymouse{i}(:,12) = mean(raster_epoch{i}.EZM_closed_topfromedge')';  
    epoch_mean_raster_bymouse{i}(:,13) = mean(raster_epoch{i}.EZM_closed_bottomfromedge')';   
    epoch_mean_raster_bymouse{i}(:,14) = mean(raster_epoch{i}.EZM_closed_topfromopen')';  
    epoch_mean_raster_bymouse{i}(:,15) = mean(raster_epoch{i}.EZM_closed_bottomfromopen')'; 
    
    epoch_mean_raster_bymouse{i}(:,16) = mean(raster_epoch{i}.EPM_open_left')';  
    epoch_mean_raster_bymouse{i}(:,17) = mean(raster_epoch{i}.EPM_open_right')';  
    epoch_mean_raster_bymouse{i}(:,18) = mean(raster_epoch{i}.EPM_closed_top')';  
    epoch_mean_raster_bymouse{i}(:,19) = mean(raster_epoch{i}.EPM_closed_bottom')';      

    epoch_mean_raster_bymouse{i}(:,20) = mean(raster_epoch{i}.XM_longarm_top')';  
    epoch_mean_raster_bymouse{i}(:,21) = mean(raster_epoch{i}.XM_longarm_bottom')';  
    epoch_mean_raster_bymouse{i}(:,22) = mean(raster_epoch{i}.XM_shortarm')';      
    
end

clear tmp
for i = 1:numel(epoch_mean_raster_bymouse)
    tmp(:,:,i) = corr(epoch_mean_raster_bymouse{i},'rows','pairwise');
end
for i = 1:size(tmp,1)
    tmp(i,i,:) = nan;
end
epoch_raster_bymouse = tmp;
figure; imagesc(mean(tmp,3,'omitnan')); caxis([0 0.8]); colormap(brewermap([],"OrRd"))




%now average open arm correlations vs all other arms
%EZM 1 - 10
%EZM 2 - 11
%EPM 1 - 16
%EPM 2 - 17
%TMaze 1- 20
%Tmaze 2- 21
%Tmaze 3- 22

%EZM closed 12-15
%EPM closed 18-19
clear tmp
for i = 1: size(epoch_raster_bymouse,3)
    tmp(1,i) = mean(mean(epoch_raster_bymouse(10:11,10:11,i),'omitnan'),'omitnan'); %ezm open vs ezm open
    tmp(2,i) = mean(mean(epoch_raster_bymouse(16:17,16:17,i),'omitnan'),'omitnan'); %epm opne vs epm open    
    %tmp(3,i) = mean(mean(epoch_raster_bymouse(10:11,[12:15 18:19],i),'omitnan'),'omitnan'); %ezm open vs ezm + epm closed
    %tmp(4,i) = mean(mean(epoch_raster_bymouse(16:17,[12:15 18:19],i),'omitnan'),'omitnan'); %epm open vs epm + epm closed    
    tmp(3,i) = mean(mean(epoch_raster_bymouse(10:11,[12:15],i),'omitnan'),'omitnan'); %ezm open vs ezm closed
    tmp(4,i) = mean(mean(epoch_raster_bymouse(16:17,[18:19],i),'omitnan'),'omitnan'); %epm open vs epm closed  
    
    tmp(5,i) = mean(mean(epoch_raster_bymouse(10:11,16:17,i),'omitnan'),'omitnan'); %ezm open vs epm open
    tmp(6,i) = mean(mean(epoch_raster_bymouse([10:11, 16:17],20:22,i),'omitnan'),'omitnan'); %ezm open  Epm open vs TM
    tmp(7,i) = mean(mean(epoch_raster_bymouse([12:15, 18:19],20:22,i),'omitnan'),'omitnan'); %ezm closed  Epm closed vs TM 

    tmp(8,i) = mean(mean(epoch_raster_bymouse([1:6], 7:22,i),'omitnan'),'omitnan'); %HC vs all other contexts 

    tmp(9,i) = mean(mean(epoch_raster_bymouse([1:6], 1:6,i),'omitnan'),'omitnan'); %HC vs HC
    tmp(10,i)= mean(mean(epoch_raster_bymouse([10:15], 10:15,i),'omitnan'),'omitnan'); %EZM vs EZM
    tmp(11,i)= mean(mean(epoch_raster_bymouse([16:19], 16:19,i),'omitnan'),'omitnan'); %EPM vs EPM   
    tmp(12,i) = mean(mean(epoch_raster_bymouse([19:22], 20:22,i),'omitnan'),'omitnan'); %XM vs XM

    tmp(13,i) = mean(mean(epoch_raster_bymouse([1:6], 10:15,i),'omitnan'),'omitnan'); %HC vs EZM (broke down by location and pooled)
    tmp(14,i) = mean(mean(epoch_raster_bymouse([1:6], 16:19,i),'omitnan'),'omitnan'); %HC vs EPM (broke down by location and pooled)   
    tmp(15,i) = mean(mean(epoch_raster_bymouse([1:6], 20:22,i),'omitnan'),'omitnan'); %HC vs XM  (broke down by location and pooled)

    tmp(16,i) = mean(mean(epoch_raster_bymouse(7, 8,i),'omitnan'),'omitnan'); %EZM vs EPM all frames
    tmp(17,i) = mean(mean(epoch_raster_bymouse(7, 9,i),'omitnan'),'omitnan'); %EZM vs XM all frames 
    tmp(18,i) = mean(mean(epoch_raster_bymouse(8, 9,i),'omitnan'),'omitnan'); %EPM vs XM all frames

    tmp(19,i) = mean(mean(epoch_raster_bymouse(10:15, 16:19,i),'omitnan'),'omitnan'); %EZM vs EPM (broke down by location)
    tmp(20,i) = mean(mean(epoch_raster_bymouse(10:15, 20:22,i),'omitnan'),'omitnan'); %EZM vs XM (broke down by location)
    tmp(21,i) = mean(mean(epoch_raster_bymouse(16:19, 20:22,i),'omitnan'),'omitnan'); %EPM vs XM (broke down by location)

    tmp(22,i) = mean(mean(epoch_raster_bymouse(7, 16:19,i),'omitnan'),'omitnan'); %EZM vs EPM (all vs broke down by location)
    tmp(23,i) = mean(mean(epoch_raster_bymouse(7, 20:22,i),'omitnan'),'omitnan'); %EZM vs XM (all vs broke down by location)
    tmp(24,i) = mean(mean(epoch_raster_bymouse(8, 20:22,i),'omitnan'),'omitnan'); %EPM vs XM (all vs broke down by location)

    tmp(25,i) = mean(mean(epoch_raster_bymouse(20:21, 20:21,i),'omitnan'),'omitnan'); %XM long v long
    tmp(26,i) = mean(mean(epoch_raster_bymouse(20:21, 22,i),'omitnan'),'omitnan'); %XM long v short
    
    tmp(27,i) = mean(mean(epoch_raster_bymouse(10:11, 18:19,i),'omitnan'),'omitnan'); %EZM Open vs EPM Closed
    tmp(28,i) = mean(mean(epoch_raster_bymouse(16:17, 12:15,i),'omitnan'),'omitnan'); %EPM Open vs EZM Closed

    tmp(29,i) = mean(mean(epoch_raster_bymouse(10:11, 20:21,i),'omitnan'),'omitnan'); %EZM Open vs Tmaze long  
    tmp(30,i) = mean(mean(epoch_raster_bymouse(10:11, 22,i),'omitnan'),'omitnan'); %EZM Open tmaze short
    
    tmp(31,i) = mean(mean(epoch_raster_bymouse(16:17, 20:21,i),'omitnan'),'omitnan'); %EPM Open vs Tmaze long  
    tmp(32,i) = mean(mean(epoch_raster_bymouse(16:17, 22,i),'omitnan'),'omitnan'); %EPM Open tmaze short    

    tmp(33,i) = mean(mean(epoch_raster_bymouse(12:15, 20:21,i),'omitnan'),'omitnan'); %EZM Closed vs Tmaze long  
    tmp(34,i) = mean(mean(epoch_raster_bymouse(12:15, 22,i),'omitnan'),'omitnan'); %EZM Closed tmaze short
    
    tmp(35,i) = mean(mean(epoch_raster_bymouse(18:19, 20:21,i),'omitnan'),'omitnan'); %EPM Closed vs Tmaze long  
    tmp(36,i) = mean(mean(epoch_raster_bymouse(18:19, 22,i),'omitnan'),'omitnan'); %EPM Closed tmaze short    
    
end



figure; scatter(tmp(5,:), tmp(3,:),'.'); hold on;  scatter(tmp(5,:), tmp(4,:),'.'); hold on; line([0 1], [0 1])
[n p] = ttest2(tmp(5,:), tmp(3,:))
[n p] = ttest2(tmp(5,:), tmp(4,:))
mean(tmp(5,:)), std(tmp(5,:))./(6^0.5)
mean(tmp(3,:)), std(tmp(3,:))./(6^0.5)
mean(tmp(4,:)), std(tmp(4,:))./(6^0.5)

figure; scatter(tmp(1,:), tmp(3,:),'.'); hold on; scatter(tmp(2,:), tmp(4,:),'.'); hold on; line([0 1], [0 1])
[n p] = ttest2(tmp(1,:), tmp(3,:))
[n p] = ttest2(tmp(2,:), tmp(4,:))
mean(tmp(1,:),'omitnan'), std(tmp(1,:),'omitnan')./(5^0.5)
mean(tmp(3,:)), std(tmp(3,:))./(6^0.5)
mean(tmp(2,:)), std(tmp(2,:))./(6^0.5)
mean(tmp(4,:)), std(tmp(4,:))./(6^0.5)

figure; scatter(tmp(5,:), tmp(6,:),'.'); hold on; scatter(tmp(5,:), tmp(7,:),'.'); hold on; line([0 1], [0 1])
[n p] = ttest2(tmp(5,:), tmp(6,:))
[n p] = ttest2(tmp(5,:), tmp(7,:))
mean(tmp(5,:),'omitnan'), std(tmp(5,:),'omitnan')./(6^0.5)
mean(tmp(6,:)), std(tmp(6,:))./(6^0.5)
mean(tmp(5,:)), std(tmp(5,:))./(6^0.5)
mean(tmp(7,:)), std(tmp(7,:))./(6^0.5)











%% now calculate by mouse






%calculate modulation index for 
%EZM open arms vs preceding Home cage (1), 
%EZM closed arms vs preceding home cage (1), 
%EPM open arms vs preceding homecage(3)
%EPM closed arms vs preceding home cage (3)
%tmaze vs preceding home cage (5)

%HC1 vs HC2
%HC3 v HC4
%hc5 v HC6

%HC1,2 vs EZM
%HC3,4 vs EPM
%HC5,6 vs TM

%EZM all vs EPM all
%EZM all vs TM all
%EPM vs TM all

%EZM Open vs Closed
%EPM Open vs Closed
%TM short vs long1,2
%TM long1 vs TMshortlong2
%TM long2 vs TMshortlong1



clear tmpA
clear tmpB
clear Cells_A Cells_B dist_A dist_B
iterations = 200
for i = 1:numel(raster_epoch)
    i
    tmpA = [raster_epoch{i}.HC1]; %HC1
    tmpB = [raster_epoch{i}.HC2]; %HC2
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HC12, Cells_B{i}.HC12, dist_A{i}.HC12, dist_B{i}.HC12] = ActivityModulationB([tmpA tmpB], A, B, iterations);

    tmpA = [raster_epoch{i}.HC3]; %HC3
    tmpB = [raster_epoch{i}.HC4]; %HC4
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HC34, Cells_B{i}.HC34, dist_A{i}.HC34, dist_B{i}.HC34] = ActivityModulationB([tmpA tmpB], A, B, iterations);
    
    tmpA = [raster_epoch{i}.HC5]; %HC5
    tmpB = [raster_epoch{i}.HC6]; %HC6
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HC56, Cells_B{i}.HC56, dist_A{i}.HC56, dist_B{i}.HC56] = ActivityModulationB([tmpA tmpB], A, B, iterations);
    
    tmpA = [raster_epoch{i}.EZM]; %EZM
    tmpB = [raster_epoch{i}.HC1 raster_epoch{i}.HC2]; %HC1 & 2
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HCvEZM, Cells_B{i}.HCvEZM, dist_A{i}.HCvEZM, dist_B{i}.HCvEZM] = ActivityModulationB([tmpA tmpB], A, B, iterations);
        
    tmpA = [raster_epoch{i}.EPM]; %EPM
    tmpB = [raster_epoch{i}.HC3 raster_epoch{i}.HC4]; %HC3 &4
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HCvEPM, Cells_B{i}.HCvEPM, dist_A{i}.HCvEPM, dist_B{i}.HCvEPM] = ActivityModulationB([tmpA tmpB], A, B, iterations);
          
    tmpA = [raster_epoch{i}.XM]; %TM
    tmpB = [raster_epoch{i}.HC5 raster_epoch{i}.HC6]; %HC5 &6
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.HCvXM, Cells_B{i}.HCvXM, dist_A{i}.HCvXM, dist_B{i}.HCvXM] = ActivityModulationB([tmpA tmpB], A, B, iterations);
           

    
    tmpA = [raster_epoch{i}.EZM]; %EZM
    tmpB = [raster_epoch{i}.EPM]; %EPM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EZMvsEPM, Cells_B{i}.EZMvsEPM, dist_A{i}.EZMvsEPM, dist_B{i}.EZMvsEPM] = ActivityModulationB([tmpA tmpB], A, B, iterations);    
    
    tmpA = [raster_epoch{i}.EZM]; %EZM
    tmpB = [raster_epoch{i}.XM]; %TM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EZMvsXM, Cells_B{i}.EZMvsXM, dist_A{i}.EZMvsXM, dist_B{i}.EZMvsXM] = ActivityModulationB([tmpA tmpB], A, B, iterations);    
        
    tmpA = [raster_epoch{i}.EPM]; %EPM
    tmpB = [raster_epoch{i}.XM]; %TM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EPMvsXM, Cells_B{i}.EPMvsXM, dist_A{i}.EPMvsXM, dist_B{i}.EPMvsXM] = ActivityModulationB([tmpA tmpB], A, B, iterations);    
      
    
    
    
    %Modulation within EZM
    tmpA = [raster_epoch{i}.EZM_open_right raster_epoch{i}.EZM_open_left]; %EZM Open
    tmpB = [raster_epoch{i}.EZM_closed_topfromedge raster_epoch{i}.EZM_closed_topfromopen raster_epoch{i}.EZM_closed_bottomfromedge raster_epoch{i}.EZM_closed_bottomfromopen]; %EZM Closed
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;
    [Cells_A{i}.EZMOpenClosed, Cells_B{i}.EZMOpenClosed, dist_A{i}.EZMOpenClosed, dist_B{i}.EZMOpenClosed] = ActivityModulationB([tmpA tmpB], A, B, iterations); 
    
    %modulation within EPM
    tmpA = [raster_epoch{i}.EPM_open_left raster_epoch{i}.EPM_open_right]; %EPM Open
    tmpB = [raster_epoch{i}.EPM_closed_top raster_epoch{i}.EPM_closed_bottom]; %EPM Closed
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.EPMopenClosed, Cells_B{i}.EPMopenClosed, dist_A{i}.EPMopenClosed, dist_B{i}.EPMopenClosed] = ActivityModulationB([tmpA tmpB], A, B,iterations);    

    %modulation within TMaze
    tmpA = [raster_epoch{i}.XM_longarm_top raster_epoch{i}.XM_longarm_bottom ]; %Tmaze long arm
    tmpB = [raster_epoch{i}.XM_shortarm]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.TmazeLongShort, Cells_B{i}.TmazeLongShort, dist_A{i}.TmazeLongShort, dist_B{i}.TmazeLongShort] = ActivityModulationB([tmpA tmpB], A, B,iterations);  

    %modulation within TMaze
    tmpA = [raster_epoch{i}.XM_longarm_top  ]; %Tmaze long arm
    tmpB = [raster_epoch{i}.XM_shortarm raster_epoch{i}.XM_longarm_bottom]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.TmazeLong1Short, Cells_B{i}.TmazeLong1Short, dist_A{i}.TmazeLong1Short, dist_B{i}.TmazeLong1Short] = ActivityModulationB([tmpA tmpB], A, B,iterations);  

        %modulation within TMaze
    tmpA = [ raster_epoch{i}.XM_longarm_bottom ]; %Tmaze long arm
    tmpB = [raster_epoch{i}.XM_shortarm raster_epoch{i}.XM_longarm_top]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    B = zeros(1,size(tmpA,2)+size(tmpB,2)); B(end-size(tmpB,2):end) = 1;    
    [Cells_A{i}.TmazeLong2Short, Cells_B{i}.TmazeLong2Short, dist_A{i}.TmazeLong2Short, dist_B{i}.TmazeLong2Short] = ActivityModulationB([tmpA tmpB], A, B,iterations);  


end

%All Mice
k = 1
Anxiety_mod_raster = []; 
%1. HC 1v2 2. HC 3v4 3. HC 5v6
%4 HC1,2 vs EZM 5. HC3,4 vs EPM 6. HC5,6 vs TM
%7 EZM vs EPM 8 EZM vs TM 9 EPM vs TM
%10 EZM Open vs EZM Closed 11 EPM Open vs EPM Closed
%12 TM long vs short 13. TM long 1 vs shortlong 14. TM long2 vs shortlong

for i = 1:numel(Cells_A); 
    tmp = [Cells_A{i}.HC12(:,4) Cells_A{i}.HC34(:,4) Cells_A{i}.HC56(:,4)... 
        Cells_A{i}.HCvEZM(:,4) Cells_A{i}.HCvEPM(:,4) Cells_A{i}.HCvXM(:,4) ...
        Cells_A{i}.EZMvsEPM(:,4) Cells_A{i}.EZMvsXM(:,4) Cells_A{i}.EPMvsXM(:,4)...
        Cells_A{i}.EZMOpenClosed(:,4) Cells_A{i}.EPMopenClosed(:,4) ...
        Cells_A{i}.TmazeLongShort(:,4) Cells_A{i}.TmazeLong1Short(:,4) Cells_A{i}.TmazeLong2Short(:,4)];    
    Anxiety_mod_raster = [Anxiety_mod_raster ; [tmp repmat(k, numel(Cells_A{i}.HC12(:,4)), 1)]];

    k = k+1;
end
tmp = corr(Anxiety_mod_raster,'rows','pairwise')
for i = 1:size(tmp,2); tmp(i,i) = nan; end
figure; imagesc((tmp(1:14,1:14)))

%1. HC 1v2 2. HC 3v4 3. HC 5v6
%4 HC1,2 vs EZM 5. HC3,4 vs EPM 6. HC5,6 vs TM
%7 EZM vs EPM 8 EZM vs TM 9 EPM vs TM
%10 EZM Open vs EZM Closed 11 EPM Open vs EPM Closed
%12 TM long vs short 13. TM long 1 vs shortlong 14. TM long2 vs shortlong

mean(mean(tmp(1:3,1:3), 'omitnan'),'omitnan') %similarity between HCHCHC
mean(mean(tmp(4:6,4:6), 'omitnan'),'omitnan') %similarity between context specific cahnges from home cage
mean(mean(tmp(10:11,10:11), 'omitnan'),'omitnan') %EZM Open/Closed vs EPM open/closed
mean(mean(tmp(10:11,1:3), 'omitnan'),'omitnan') %EZM and EPM Open/Closed vs HC
mean(mean(tmp(10:11,12:14), 'omitnan'),'omitnan') %EZM and EPM Open/Closed vs TM





xx = linspace(0,1,10)
space = [0 0.1]

figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_raster (:,4), Anxiety_mod_raster (:,5),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_raster (:,4), Anxiety_mod_raster (:,6),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_raster (:,5), Anxiety_mod_raster (:,6),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)
figure;imagesc(imgaussfilt(histcounts2 (Anxiety_mod_raster (:,10), Anxiety_mod_raster (:,11),xx,xx,'normalization','probability'),0.8)); colorbar; caxis(space)



%now run same analysis on a mouse by mouse basis


%now analyze on a mouse by mouse basis
clear Anxiety_mod_raster_bymouse
for i = 1:6

    tmp = find(Anxiety_mod_raster(:,15) == i);
    tmp2 = find(Anxiety_mod_raster(:,15) == i);
    Anxiety_mod_raster_bymouse(:,:,i) = corr(Anxiety_mod_raster(tmp,:), Anxiety_mod_raster(tmp2,:),'rows','pairwise');
end

for i = 1:size(Anxiety_mod_raster_bymouse,1)
    Anxiety_mod_raster_bymouse(i,i,:) = nan;
end

clear tmp
for i = 1:6
tmp (1,i) = mean(mean(Anxiety_mod_raster_bymouse(1:3,1:3,i), 'omitnan'),'omitnan'); %similarity between HCHCHC
tmp (2,i) =mean(mean(Anxiety_mod_raster_bymouse(4:6,4:6,i), 'omitnan'),'omitnan'); %similarity between context specific cahnges from home cage
tmp (3,i) =mean(mean(Anxiety_mod_raster_bymouse(10:11,10:11,i), 'omitnan'),'omitnan'); %EZM Open/Closed vs EPM open/closed
tmp (4,i) =mean(mean(Anxiety_mod_raster_bymouse(10:11,1:3,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs HC
tmp (5,i)  =mean(mean(Anxiety_mod_raster_bymouse(7:8,9,i), 'omitnan'),'omitnan'); %EZM vs EPM, EZM vs TM
tmp(6,i) =mean(mean(Anxiety_mod_raster_bymouse(10:11,12,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs TM 1 (short vs longs) %% will disregard this and focus on longs vs shortlong
tmp(7,i) =mean(mean(Anxiety_mod_raster_bymouse(10:11,13,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs TM 2
tmp(8,i) =mean(mean(Anxiety_mod_raster_bymouse(10:11,14,i), 'omitnan'),'omitnan'); %EZM and EPM Open/Closed vs TM 3
end


(tmp(1,:))
(tmp(2,:))
(tmp(3,:))
(tmp(4,:))
(tmp(5,:))
(tmp(6,:))
(tmp(7,:))
(tmp(8,:))











% what is the angle of ensemble vectors (context vs anxiety ---- is it
% orthogonal??)

%will compare
%1. HC vs EZM
%2. HC vs TPM
%3. HC vs TM
%4. EZM Open vs closed
%5. EPM Open vs Closed



%1. HC 1v2 2. HC 3v4 3. HC 5v6
%4 HC1,2 vs EZM 5. HC3,4 vs EPM 6. HC5,6 vs TM
%7 EZM vs EPM 8 EZM vs TM 9 EPM vs TM
%10 EZM Open vs EZM Closed 11 EPM Open vs EPM Closed
%12 TM long vs short 13. TM long 1 vs shortlong 14. TM long2 vs shortlong






for i = 1:6
for p = 1:14
    for pp = 1:14
    tmp = find(Anxiety_mod_raster(:,15) == i);
    tmp2 = find(Anxiety_mod_raster(:,15) == i);
    
    [Anx_cossim_raster(p,pp,i) theta(p,pp,i)]= cossim(Anxiety_mod_raster(tmp,p)'-0.5, Anxiety_mod_raster(tmp2,pp)'-0.5,1);
    [Anx_cossim_raster_shuf(p,pp,i) theta(p,pp,i)]= cossim(Anxiety_mod_raster(tmp,p)'-0.5, circ_shuf(Anxiety_mod_raster(tmp2,pp)', 30)-0.5,1);
    %have to center at zero
 
    end
end
end

for i = 1:14, Anx_cossim_raster(i,i,:) = nan; Anx_cossim_raster_shuf(i,i,:) = nan; end

clear tmp
for i = 1:6
tmp(1,i) = mean(mean(Anx_cossim_raster(1:3, 1:3,i),'omitnan'), 'omitnan'); %HC v HC
tmp(2,i) = mean(mean(Anx_cossim_raster(1:3, 4,i),'omitnan'), 'omitnan'); %EZM v HC
tmp(3,i) = mean(mean(Anx_cossim_raster(1:3, 5,i),'omitnan'), 'omitnan');%EPM v HC
tmp(4,i) = mean(mean(Anx_cossim_raster(1:3, 6,i),'omitnan'), 'omitnan');%TM v HC

tmp(5,i) = mean(mean(Anx_cossim_raster(4, 5,i),'omitnan'), 'omitnan');%EZM vs EPM (vs HC)
tmp(6,i) = mean(mean(Anx_cossim_raster(4, 6,i),'omitnan'), 'omitnan');%EZM v TM   (vs HC)
tmp(7,i) = mean(mean(Anx_cossim_raster(5, 6,i),'omitnan'), 'omitnan');%EPM v TM   (vs HC)

tmp(8,i) = mean(mean(Anx_cossim_raster(7, 8,i),'omitnan'), 'omitnan');%EZM/EPM v EZM/TM
tmp(9,i) = mean(mean(Anx_cossim_raster(8, 9,i),'omitnan'), 'omitnan');%EZM/TM v EPM/TM

tmp(10,i)= mean(mean(Anx_cossim_raster(10, 11,i),'omitnan'), 'omitnan');%EZM OPen vs EPM OPen
tmp(11,i)= mean(mean(Anx_cossim_raster(10, 12,i),'omitnan'), 'omitnan');%EZM OPen vs Tmaze SvL
tmp(12,i)= mean(mean(Anx_cossim_raster(10, 13,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L1Others
tmp(13,i)= mean(mean(Anx_cossim_raster(10, 14,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L2Others
tmp(14,i)= mean(mean(Anx_cossim_raster(11, 12,i),'omitnan'), 'omitnan');%EPM OPen vs Tmaze SvL
tmp(15,i)= mean(mean(Anx_cossim_raster(11, 13,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L1Others
tmp(16,i)= mean(mean(Anx_cossim_raster(11, 14,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L2Others

%anxiety vs context
tmp(17,i)= mean(mean(Anx_cossim_raster(10, 4,i),'omitnan'), 'omitnan');%EZM OPen vs EZM/HC
tmp(18,i)= mean(mean(Anx_cossim_raster(10, 5,i),'omitnan'), 'omitnan');%EZM OPen vs EPM/HC
tmp(19,i)= mean(mean(Anx_cossim_raster(10, 6,i),'omitnan'), 'omitnan');%EZM OPen vs TM/HC

tmp(20,i)= mean(mean(Anx_cossim_raster(11, 4,i),'omitnan'), 'omitnan');%EPM OPen vs EZM/HC
tmp(21,i)= mean(mean(Anx_cossim_raster(11, 5,i),'omitnan'), 'omitnan');%EPM OPen vs EPM/HC
tmp(22,i)= mean(mean(Anx_cossim_raster(11, 6,i),'omitnan'), 'omitnan');%EPM OPen vs TM/HC
end


clear tmpshuf
for i = 1:6
tmpshuf(1,i) = mean(mean(Anx_cossim_raster_shuf(1:3, 1:3,i),'omitnan'), 'omitnan'); %HC v HC
tmpshuf(2,i) = mean(mean(Anx_cossim_raster_shuf(1:3, 4,i),'omitnan'), 'omitnan'); %EZM v HC
tmpshuf(3,i) = mean(mean(Anx_cossim_raster_shuf(1:3, 5,i),'omitnan'), 'omitnan');%EPM v HC
tmpshuf(4,i) = mean(mean(Anx_cossim_raster_shuf(1:3, 6,i),'omitnan'), 'omitnan');%TM v HC

tmpshuf(5,i) = mean(mean(Anx_cossim_raster_shuf(4, 5,i),'omitnan'), 'omitnan');%EZM vs EPM (vs HC)
tmpshuf(6,i) = mean(mean(Anx_cossim_raster_shuf(4, 6,i),'omitnan'), 'omitnan');%EZM v TM   (vs HC)
tmpshuf(7,i) = mean(mean(Anx_cossim_raster_shuf(5, 6,i),'omitnan'), 'omitnan');%EPM v TM   (vs HC)

tmpshuf(8,i) = mean(mean(Anx_cossim_raster_shuf(7, 8,i),'omitnan'), 'omitnan');%EZM/EPM v EZM/TM
tmpshuf(9,i) = mean(mean(Anx_cossim_raster_shuf(8, 9,i),'omitnan'), 'omitnan');%EZM/TM v EPM/TM

tmpshuf(10,i)= mean(mean(Anx_cossim_raster_shuf(10, 11,i),'omitnan'), 'omitnan');%EZM OPen vs EPM OPen
tmpshuf(11,i)= mean(mean(Anx_cossim_raster_shuf(10, 12,i),'omitnan'), 'omitnan');%EZM OPen vs Tmaze SvL
tmpshuf(12,i)= mean(mean(Anx_cossim_raster_shuf(10, 13,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L1Others
tmpshuf(13,i)= mean(mean(Anx_cossim_raster_shuf(10, 14,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L2Others
tmpshuf(14,i)= mean(mean(Anx_cossim_raster_shuf(11, 12,i),'omitnan'), 'omitnan');%EPM OPen vs Tmaze SvL
tmpshuf(15,i)= mean(mean(Anx_cossim_raster_shuf(11, 13,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L1Others
tmpshuf(16,i)= mean(mean(Anx_cossim_raster_shuf(11, 14,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L2Others

%anxiety vs context
tmpshuf(17,i)= mean(mean(Anx_cossim_raster_shuf(10, 4,i),'omitnan'), 'omitnan');%EZM OPen vs EZM/HC
tmpshuf(18,i)= mean(mean(Anx_cossim_raster_shuf(10, 5,i),'omitnan'), 'omitnan');%EZM OPen vs EPM/HC
tmpshuf(19,i)= mean(mean(Anx_cossim_raster_shuf(10, 6,i),'omitnan'), 'omitnan');%EZM OPen vs TM/HC

tmpshuf(20,i)= mean(mean(Anx_cossim_raster_shuf(11, 4,i),'omitnan'), 'omitnan');%EPM OPen vs EZM/HC
tmpshuf(21,i)= mean(mean(Anx_cossim_raster_shuf(11, 5,i),'omitnan'), 'omitnan');%EPM OPen vs EPM/HC
tmpshuf(22,i)= mean(mean(Anx_cossim_raster_shuf(11, 6,i),'omitnan'), 'omitnan');%EPM OPen vs TM/HC
end


space = ([-0.1, 0.8])
figure; imagesc(mean(Anx_cossim_raster,3))
colormap(brewermap([],"OrRd")); caxis(space)
figure; imagesc(mean(Anx_cossim_raster_shuf,3))
colormap(brewermap([],"OrRd")); caxis(space)

figure; imagesc(mean(Anx_cossim_raster - Anx_cossim_raster_shuf,3))
colormap(brewermap([],"OrRd")); caxis([-0.2 0.7])

%now calculate most meaningcful cossine similarities

%1. HC vs EZM
%2. HC vs TPM
%3. HC vs TM
%4. EZM Open vs closed
%5. EPM Open vs Closed
small_cossim_raster = Anx_cossim_raster([4:6 10:11],[4:6 10:11],:);
figure; imagesc(mean(small_cossim_raster,3))
for i = 1:5; small_cossim_raster(i,i,:) = nan; end

clear tmp
for i = 1:6
tmp(1,i) = mean(mean(small_cossim_raster(1:3, 1:3,i),'omitnan'), 'omitnan');
tmp(2,i) = mean(mean(small_cossim_raster(1:3, 4:5,i),'omitnan'), 'omitnan');
tmp(3,i) = mean(mean(small_cossim_raster(4:5, 4:5,i),'omitnan'), 'omitnan');
end










%%

%first pass network structure, calculate correlation matrix for each
%epoch/mouse 
clear tmp tmp2 epoch_raster_corrs correlations_similarity_raster
for i = 1:numel (calcium_epoch); for j = 1:22; tmp{i,j} = []; end; end
for i = 1:numel (calcium_epoch)

        tmp{i,1} = corr(raster_epoch{i}.HC1(:,:)','rows','pairwise');
        tmp{i,2} = corr(raster_epoch{i}.HC2(:,:)','rows','pairwise');
        tmp{i,3} = corr(raster_epoch{i}.HC3(:,:)','rows','pairwise');
        tmp{i,4} = corr(raster_epoch{i}.HC4(:,:)','rows','pairwise');
        tmp{i,5} = corr(raster_epoch{i}.HC5(:,:)','rows','pairwise');
        tmp{i,6} = corr(raster_epoch{i}.HC6(:,:)','rows','pairwise');
        tmp{i,7} = corr(raster_epoch{i}.EZM(:,:)','rows','pairwise');
        tmp{i,8} = corr(raster_epoch{i}.EPM(:,:)','rows','pairwise');
        tmp{i,9} = corr(raster_epoch{i}.XM(:,:)','rows','pairwise');
        
    %arm specific correlation vectors
    %have to insert placeholder if mouse doesnt explore arm
    cells = size(raster_epoch{i}.HC1,1); placeholder = nan(cells,cells); 
    if isempty (raster_epoch{i}.EZM_open_left) == 0;                                tmp{i,10} = [corr(raster_epoch{i}.EZM_open_left(:,:)','rows','pairwise')];                else tmp{i, 10} = [placeholder]; end
    if isempty (raster_epoch{i}.EZM_open_right) == 0;                               tmp{i,11} = [corr(raster_epoch{i}.EZM_open_right(:,:)','rows','pairwise')];               else tmp{i, 11} = [placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_topfromedge) == 0;                       tmp{i,12} = [corr(raster_epoch{i}.EZM_closed_topfromedge(:,:)','rows','pairwise')];       else tmp{i, 12} = [placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_bottomfromedge) == 0;                    tmp{i,13} = [corr(raster_epoch{i}.EZM_closed_bottomfromedge(:,:)','rows','pairwise')];    else tmp{i, 13} = [placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_topfromopen) == 0;                       tmp{i,14} = [corr(raster_epoch{i}.EZM_closed_topfromopen(:,:)','rows','pairwise')];       else tmp{i, 14} = [placeholder]; end
    if isempty (raster_epoch{i}.EZM_closed_bottomfromopen) == 0;                    tmp{i,15} = [corr(raster_epoch{i}.EZM_closed_bottomfromopen(:,:)','rows','pairwise')];    else tmp{i, 15} = [placeholder]; end
    
    if isempty (raster_epoch{i}.EPM_open_left) == 0;                                tmp{i,16} = [corr(raster_epoch{i}.EPM_open_left(:,:)','rows','pairwise')];                else tmp{i, 16} = [placeholder]; end
    if isempty (raster_epoch{i}.EPM_open_right) == 0;                               tmp{i,17} = [corr(raster_epoch{i}.EPM_open_right(:,:)','rows','pairwise')];               else tmp{i, 17} = [placeholder]; end
    if isempty (raster_epoch{i}.EPM_closed_top) == 0;                               tmp{i,18} = [corr(raster_epoch{i}.EPM_closed_top(:,:)','rows','pairwise')];               else tmp{i, 18} = [placeholder]; end
    if isempty (raster_epoch{i}.EPM_closed_bottom) == 0;                            tmp{i,19} = [corr(raster_epoch{i}.EPM_closed_bottom(:,:)','rows','pairwise')];            else tmp{i, 19} = [placeholder]; end

    if isempty (raster_epoch{i}.XM_longarm_top) == 0;                               tmp{i,20} = [corr(raster_epoch{i}.XM_longarm_top(:,:)','rows','pairwise')];               else tmp{i, 20} = [placeholder]; end
    if isempty (raster_epoch{i}.XM_longarm_bottom) == 0;                            tmp{i,21} = [corr(raster_epoch{i}.XM_longarm_bottom(:,:)','rows','pairwise')];            else tmp{i, 21} = [placeholder]; end
    if isempty (raster_epoch{i}.XM_shortarm) == 0;                                  tmp{i,22} = [corr(raster_epoch{i}.XM_shortarm(:,:)','rows','pairwise')];                  else tmp{i, 22} = [placeholder]; end             
        
        
end
%remove diag
for i = 1:numel(calcium_epoch); for j = 1:22; tp = size(tmp{i,j},1); for ii = 1:tp; tmp{i,j}(ii,ii) = nan'; end; end; end
%make a pseudo correlation ensemble 
clear tmp2 epoch_raster_corrs
for j = 1:22; tmp2{1,j} = []; end; 
for i = 1:numel (calcium_epoch)
    tmp2{1} = [tmp2{1}; tmp{i,1}(:)];
    tmp2{2} = [tmp2{2}; tmp{i,2}(:)];
    tmp2{3} = [tmp2{3}; tmp{i,3}(:)];
    tmp2{4} = [tmp2{4}; tmp{i,4}(:)];
    tmp2{5} = [tmp2{5}; tmp{i,5}(:)];
    tmp2{6} = [tmp2{6}; tmp{i,6}(:)];
    tmp2{7} = [tmp2{7}; tmp{i,7}(:)];
    tmp2{8} = [tmp2{8}; tmp{i,8}(:)];
    tmp2{9} = [tmp2{9}; tmp{i,9}(:)];
    tmp2{10} = [tmp2{10}; tmp{i,10}(:)];
    tmp2{11} = [tmp2{11}; tmp{i,11}(:)];
    tmp2{12} = [tmp2{12}; tmp{i,12}(:)];
    tmp2{13} = [tmp2{13}; tmp{i,13}(:)];
    tmp2{14} = [tmp2{14}; tmp{i,14}(:)];
    tmp2{15} = [tmp2{15}; tmp{i,15}(:)];
                       
    tmp2{16} = [tmp2{16}; tmp{i,16}(:)];    
    tmp2{17} = [tmp2{17}; tmp{i,17}(:)];
    tmp2{18} = [tmp2{18}; tmp{i,18}(:)];

    tmp2{19} = [tmp2{19}; tmp{i,19}(:)];    
    tmp2{20} = [tmp2{20}; tmp{i,20}(:)];
    tmp2{21} = [tmp2{21}; tmp{i,21}(:)];
    tmp2{22} = [tmp2{22}; tmp{i,22}(:)];
end
for i = 1:22; epoch_raster_corrs(:,i) = tmp2{i}; end


%zscore event though some arms never explored
clear tmp tmp2 tmp3 ;
tmp3 = nan(size(epoch_raster_corrs,1), size(epoch_raster_corrs,2));
for i = 1:size(epoch_raster_corrs,1)
tmp = find(isfinite(epoch_raster_corrs(i,:)));
tmp2 = zscore(epoch_raster_corrs(i,tmp)')';
for j = 1:numel(tmp)
    tmp3(i,tmp(j)) = tmp2(j);
end
end
tmp4 = find(isnan(epoch_raster_corrs));
tmp3(tmp4) = nan;
[a b] = sort(mean(tmp3(:,1:6)','omitnan')');
figure; imagesc(tmp3(b,:)); caxis([0 0.7]); colormap(brewermap([],"OrRd"))               %image is zscored over time, but arranged HC1-6, then EZM, EPM, XC, which clearly shows a time dependent effect overlaid on a environment effect
       




correlations_similarity_raster = (corr(epoch_raster_corrs(:,:), 'rows','pairwise'));
for i = 1:size(correlations_similarity_raster,1); correlations_similarity_raster(i,i) = nan; end
figure; imagesc(correlations_similarity_raster)
caxis([-0.1 0.3]); colormap(brewermap([],"OrRd"))






%now same for calcium trace

clear tmp tmp2 epoch_calcium_corrs correlations_similarity_calcium
for i = 1:numel (calcium_epoch); for j = 1:22; tmp{i,j} = []; end; end
for i = 1:numel (calcium_epoch)

        tmp{i,1} = corr(calcium_epoch{i}.HC1(:,:)','rows','pairwise');
        tmp{i,2} = corr(calcium_epoch{i}.HC2(:,:)','rows','pairwise');
        tmp{i,3} = corr(calcium_epoch{i}.HC3(:,:)','rows','pairwise');
        tmp{i,4} = corr(calcium_epoch{i}.HC4(:,:)','rows','pairwise');
        tmp{i,5} = corr(calcium_epoch{i}.HC5(:,:)','rows','pairwise');
        tmp{i,6} = corr(calcium_epoch{i}.HC6(:,:)','rows','pairwise');
        tmp{i,7} = corr(calcium_epoch{i}.EZM(:,:)','rows','pairwise');
        tmp{i,8} = corr(calcium_epoch{i}.EPM(:,:)','rows','pairwise');
        tmp{i,9} = corr(calcium_epoch{i}.XM(:,:)','rows','pairwise');
        
        
    %arm specific correlation vectors
    %have to insert placeholder if mouse doesnt explore arm
    cells = size(calcium_epoch{i}.HC1,1); placeholder = nan(cells,cells); 
    if isempty (calcium_epoch{i}.EZM_open_left) == 0;                                tmp{i,10} = [corr(calcium_epoch{i}.EZM_open_left(:,:)','rows','pairwise')];                else tmp{i, 10} = [placeholder]; end
    if isempty (calcium_epoch{i}.EZM_open_right) == 0;                               tmp{i,11} = [corr(calcium_epoch{i}.EZM_open_right(:,:)','rows','pairwise')];               else tmp{i, 11} = [placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_topfromedge) == 0;                       tmp{i,12} = [corr(calcium_epoch{i}.EZM_closed_topfromedge(:,:)','rows','pairwise')];       else tmp{i, 12} = [placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_bottomfromedge) == 0;                    tmp{i,13} = [corr(calcium_epoch{i}.EZM_closed_bottomfromedge(:,:)','rows','pairwise')];    else tmp{i, 13} = [placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_topfromopen) == 0;                       tmp{i,14} = [corr(calcium_epoch{i}.EZM_closed_topfromopen(:,:)','rows','pairwise')];       else tmp{i, 14} = [placeholder]; end
    if isempty (calcium_epoch{i}.EZM_closed_bottomfromopen) == 0;                    tmp{i,15} = [corr(calcium_epoch{i}.EZM_closed_bottomfromopen(:,:)','rows','pairwise')];    else tmp{i, 15} = [placeholder]; end
    
    if isempty (calcium_epoch{i}.EPM_open_left) == 0;                                tmp{i,16} = [corr(calcium_epoch{i}.EPM_open_left(:,:)','rows','pairwise')];                else tmp{i, 16} = [placeholder]; end
    if isempty (calcium_epoch{i}.EPM_open_right) == 0;                               tmp{i,17} = [corr(calcium_epoch{i}.EPM_open_right(:,:)','rows','pairwise')];               else tmp{i, 17} = [placeholder]; end
    if isempty (calcium_epoch{i}.EPM_closed_top) == 0;                               tmp{i,18} = [corr(calcium_epoch{i}.EPM_closed_top(:,:)','rows','pairwise')];               else tmp{i, 18} = [placeholder]; end
    if isempty (calcium_epoch{i}.EPM_closed_bottom) == 0;                            tmp{i,19} = [corr(calcium_epoch{i}.EPM_closed_bottom(:,:)','rows','pairwise')];            else tmp{i, 19} = [placeholder]; end

    if isempty (calcium_epoch{i}.XM_longarm_top) == 0;                               tmp{i,20} = [corr(calcium_epoch{i}.XM_longarm_top(:,:)','rows','pairwise')];               else tmp{i, 20} = [placeholder]; end
    if isempty (calcium_epoch{i}.XM_longarm_bottom) == 0;                            tmp{i,21} = [corr(calcium_epoch{i}.XM_longarm_bottom(:,:)','rows','pairwise')];            else tmp{i, 21} = [placeholder]; end
    if isempty (calcium_epoch{i}.XM_shortarm) == 0;                                  tmp{i,22} = [corr(calcium_epoch{i}.XM_shortarm(:,:)','rows','pairwise')];                  else tmp{i, 22} = [placeholder]; end          
        
        
end
%remove diag
for i = 1:numel(calcium_epoch); for j = 1:22; tp = size(tmp{i,j},1); for ii = 1:tp; tmp{i,j}(ii,ii) = nan'; end; end; end
%make a pseudo correlation ensemble 
clear tmp2 epoch_calcium_corrs
for j = 1:22; tmp2{1,j} = []; end; 
for i = 1:numel (calcium_epoch)
    tmp2{1} = [tmp2{1}; tmp{i,1}(:)];
    tmp2{2} = [tmp2{2}; tmp{i,2}(:)];
    tmp2{3} = [tmp2{3}; tmp{i,3}(:)];
    tmp2{4} = [tmp2{4}; tmp{i,4}(:)];
    tmp2{5} = [tmp2{5}; tmp{i,5}(:)];
    tmp2{6} = [tmp2{6}; tmp{i,6}(:)];
    tmp2{7} = [tmp2{7}; tmp{i,7}(:)];
    tmp2{8} = [tmp2{8}; tmp{i,8}(:)];
    tmp2{9} = [tmp2{9}; tmp{i,9}(:)];
    tmp2{10} = [tmp2{10}; tmp{i,10}(:)];
    tmp2{11} = [tmp2{11}; tmp{i,11}(:)];
    tmp2{12} = [tmp2{12}; tmp{i,12}(:)];
    tmp2{13} = [tmp2{13}; tmp{i,13}(:)];
    tmp2{14} = [tmp2{14}; tmp{i,14}(:)];
    tmp2{15} = [tmp2{15}; tmp{i,15}(:)];
                       
    tmp2{16} = [tmp2{16}; tmp{i,16}(:)];    
    tmp2{17} = [tmp2{17}; tmp{i,17}(:)];
    tmp2{18} = [tmp2{18}; tmp{i,18}(:)];

    tmp2{19} = [tmp2{19}; tmp{i,19}(:)];    
    tmp2{20} = [tmp2{20}; tmp{i,20}(:)];
    tmp2{21} = [tmp2{21}; tmp{i,21}(:)];
    tmp2{22} = [tmp2{22}; tmp{i,22}(:)];    
end
for i = 1:22; epoch_calcium_corrs(:,i) = tmp2{i}; end




%zscore event though some arms never explored
clear tmp tmp2 tmp3 ;
tmp3 = nan(size(epoch_calcium_corrs,1), size(epoch_calcium_corrs,2));
for i = 1:size(epoch_calcium_corrs,1)
tmp = find(isfinite(epoch_calcium_corrs(i,:)));
tmp2 = zscore(epoch_calcium_corrs(i,tmp)')';
for j = 1:numel(tmp)
    tmp3(i,tmp(j)) = tmp2(j);
end
end
tmp4 = find(isnan(epoch_calcium_corrs));
tmp3(tmp4) = nan;
[a b] = sort(mean(tmp3(:,1:6)','omitnan')');
figure; imagesc(tmp3(b,:)); caxis([0 0.7]); colormap(brewermap([],"OrRd"))               %image is zscored over time, but arranged HC1-6, then EZM, EPM, XC, which clearly shows a time dependent effect overlaid on a environment effect
       




correlations_similarity_calcium= (corr(epoch_calcium_corrs(:,:), 'rows','pairwise'));
for i = 1:size(correlations_similarity_calcium,1); correlations_similarity_calcium(i,i) = nan; end
figure; imagesc(correlations_similarity_calcium)
caxis([-0.1 0.4]); colormap(brewermap([],"OrRd"))










[a b] = sort(mean(epoch_calcium_corrs(:,1:6)')');
figure; imagesc(zscore(epoch_calcium_corrs(b,:)')')  

correlations_similarity_calcium = (corr(epoch_calcium_corrs(:,:), 'rows','pairwise'));
for i = 1:size(correlations_similarity_calcium,1); correlations_similarity_calcium(i,i) = nan; end
figure; imagesc(correlations_similarity_calcium)

        




%% Classifier analysis
% gioal is to compare arm types within EZM EPM and TMaze

%generate three types of comparisons
%HCHC vectors should be noise/ control 
%HC1 v HC2
%HC3vHC4
%HC5vHC6

%EZM open vs Close
%EPM Open vs Close
%TMaze long vs short

%Train on one and test on each



iterations = 200
clear all_rasters all_times
all_rasters{1,1} = [];
all_times{1,1} = [];

%first define comparasins
for i = 1:numel(raster_epoch)
    i
    tmpA = [raster_epoch{i}.HC1]; %HC1
    tmpB = [raster_epoch{i}.HC2]; %HC2
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,1} = [tmpA tmpB];
    all_times{i,1} = A;

    tmpA = [raster_epoch{i}.HC3]; %HC3
    tmpB = [raster_epoch{i}.HC4]; %HC4
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,2} = [tmpA tmpB];
    all_times{i,2} = A;

    tmpA = [raster_epoch{i}.HC5]; %HC5
    tmpB = [raster_epoch{i}.HC6]; %HC6
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,3} = [tmpA tmpB];
    all_times{i,3} = A;
 
    tmpA = [raster_epoch{i}.EZM]; %EZM
    tmpB = [raster_epoch{i}.HC1 raster_epoch{i}.HC2]; %HC1 & 2
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,4} = [tmpA tmpB];
    all_times{i,4} = A;
    
    tmpA = [raster_epoch{i}.EPM]; %EPM
    tmpB = [raster_epoch{i}.HC3 raster_epoch{i}.HC4]; %HC3 &4
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,5} = [tmpA tmpB];
    all_times{i,5} = A;
      
    tmpA = [raster_epoch{i}.XM]; %TM
    tmpB = [raster_epoch{i}.HC5 raster_epoch{i}.HC6]; %HC5 &6
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,6} = [tmpA tmpB];
    all_times{i,6} = A;
        

    
    tmpA = [raster_epoch{i}.EZM]; %EZM
    tmpB = [raster_epoch{i}.EPM]; %EPM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,7} = [tmpA tmpB];
    all_times{i,7} = A;
 
    tmpA = [raster_epoch{i}.EZM]; %EZM
    tmpB = [raster_epoch{i}.XM]; %TM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,8} = [tmpA tmpB];
    all_times{i,8} = A;
    
    tmpA = [raster_epoch{i}.EPM]; %EPM
    tmpB = [raster_epoch{i}.XM]; %TM
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,9} = [tmpA tmpB];
    all_times{i,9} = A;
    
    
    
    %Modulation within EZM
    tmpA = [raster_epoch{i}.EZM_open_right raster_epoch{i}.EZM_open_left]; %EZM Open
    tmpB = [raster_epoch{i}.EZM_closed_topfromedge raster_epoch{i}.EZM_closed_topfromopen raster_epoch{i}.EZM_closed_bottomfromedge raster_epoch{i}.EZM_closed_bottomfromopen]; %EZM Closed
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,10} = [tmpA tmpB];
    all_times{i,10} = A;
    
    
    %modulation within EPM
    tmpA = [raster_epoch{i}.EPM_open_left raster_epoch{i}.EPM_open_right]; %EPM Open
    tmpB = [raster_epoch{i}.EPM_closed_top raster_epoch{i}.EPM_closed_bottom]; %EPM Closed
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,11} = [tmpA tmpB];
    all_times{i,11} = A;
    
    %modulation within TMaze
    tmpA = [raster_epoch{i}.XM_longarm_top raster_epoch{i}.XM_longarm_bottom ]; %Tmaze long arm
    tmpB = [raster_epoch{i}.XM_shortarm]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,12} = [tmpA tmpB];
    all_times{i,12} = A;
    
    %modulation within TMaze
    tmpA = [raster_epoch{i}.XM_longarm_top  ]; %Tmaze long arm
    tmpB = [raster_epoch{i}.XM_shortarm raster_epoch{i}.XM_longarm_bottom]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,13} = [tmpA tmpB];
    all_times{i,13} = A;
    
        %modulation within TMaze
    tmpA = [ raster_epoch{i}.XM_longarm_bottom ]; %Tmaze long arm
    tmpB = [raster_epoch{i}.XM_shortarm raster_epoch{i}.XM_longarm_top]; 
    A = zeros(1,size(tmpA,2)+size(tmpB,2)); A(1:size(tmpA,2)) = 1;
    all_rasters{i,14} = [tmpA tmpB];
    all_times{i,14} = A;
end

parfor i = 1:6
for n = 1:14
    for nn = 1:14
        i, n, nn
        [obj obj2] = svm_MI_training(all_rasters{i,n}, all_times{i,n}+1, iterations);
        [performance_AvB{i}{n, nn}] = svm_MI_testing(all_rasters{i,nn}, all_times{i,nn}+1, iterations, obj, obj2);
        %shuffled
            [performance_AvBshuf{i}{n, nn}] = svm_MI_testing(circ_shuf(all_rasters{i,nn}, size(all_rasters{i,nn},2)), all_times{i,nn}+1, iterations, obj, obj2);

    end
end

end



for i = 1:6
    for n = 1:14
        for nn = 1:14
    perf.svm(n,nn,i) = performance_AvB{i}{n,nn}(2);
    perf.svmshuf(n,nn,i) = performance_AvBshuf{i}{n,nn}(2);    
        end
    end
end



figure; imagesc(mean(perf.svm,3))
spa = ([0.5 0.85]); colormap(brewermap([],"OrRd"));
caxis(spa)

figure; imagesc(mean(perf.svmshuf,3))




for i = 1:14, perf.svm(i,i,:) = nan; perf.svmshuf(i,i,:) = nan; end

clear tmp
for i = 1:6
tmp(1,i) = mean(mean(perf.svm(1:3, 1:3,i),'omitnan'), 'omitnan'); %HC v HC
tmp(2,i) = mean(mean(perf.svm(1:3, 4,i),'omitnan'), 'omitnan'); %EZM v HC
tmp(3,i) = mean(mean(perf.svm(1:3, 5,i),'omitnan'), 'omitnan');%EPM v HC
tmp(4,i) = mean(mean(perf.svm(1:3, 6,i),'omitnan'), 'omitnan');%TM v HC

tmp(5,i) = mean(mean(perf.svm(4, 5,i),'omitnan'), 'omitnan');%EZM vs EPM (vs HC)
tmp(6,i) = mean(mean(perf.svm(4, 6,i),'omitnan'), 'omitnan');%EZM v TM   (vs HC)
tmp(7,i) = mean(mean(perf.svm(5, 6,i),'omitnan'), 'omitnan');%EPM v TM   (vs HC)

tmp(8,i) = mean(mean(perf.svm(7, 8,i),'omitnan'), 'omitnan');%EZM/EPM v EZM/TM
tmp(9,i) = mean(mean(perf.svm(8, 9,i),'omitnan'), 'omitnan');%EZM/TM v EPM/TM

tmp(10,i)= mean(mean(perf.svm(10, 11,i),'omitnan'), 'omitnan');%EZM OPen vs EPM OPen
tmp(11,i)= mean(mean(perf.svm(10, 12,i),'omitnan'), 'omitnan');%EZM OPen vs Tmaze SvL
tmp(12,i)= mean(mean(perf.svm(10, 13,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L1Others
tmp(13,i)= mean(mean(perf.svm(10, 14,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L2Others
tmp(14,i)= mean(mean(perf.svm(11, 12,i),'omitnan'), 'omitnan');%EPM OPen vs Tmaze SvL
tmp(15,i)= mean(mean(perf.svm(11, 13,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L1Others
tmp(16,i)= mean(mean(perf.svm(11, 14,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L2Others

%anxiety vs context
tmp(17,i)= mean(mean(perf.svm(10, 4,i),'omitnan'), 'omitnan');%EZM OPen vs EZM/HC
tmp(18,i)= mean(mean(perf.svm(10, 5,i),'omitnan'), 'omitnan');%EZM OPen vs EPM/HC
tmp(19,i)= mean(mean(perf.svm(10, 6,i),'omitnan'), 'omitnan');%EZM OPen vs TM/HC

tmp(20,i)= mean(mean(perf.svm(11, 4,i),'omitnan'), 'omitnan');%EPM OPen vs EZM/HC
tmp(21,i)= mean(mean(perf.svm(11, 5,i),'omitnan'), 'omitnan');%EPM OPen vs EPM/HC
tmp(22,i)= mean(mean(perf.svm(11, 6,i),'omitnan'), 'omitnan');%EPM OPen vs TM/HC
end


clear tmpshuf
for i = 1:6
tmpshuf(1,i) = mean(mean(perf.svmshuf(1:3, 1:3,i),'omitnan'), 'omitnan'); %HC v HC
tmpshuf(2,i) = mean(mean(perf.svmshuf(1:3, 4,i),'omitnan'), 'omitnan'); %EZM v HC
tmpshuf(3,i) = mean(mean(perf.svmshuf(1:3, 5,i),'omitnan'), 'omitnan');%EPM v HC
tmpshuf(4,i) = mean(mean(perf.svmshuf(1:3, 6,i),'omitnan'), 'omitnan');%TM v HC

tmpshuf(5,i) = mean(mean(perf.svmshuf(4, 5,i),'omitnan'), 'omitnan');%EZM vs EPM (vs HC)
tmpshuf(6,i) = mean(mean(perf.svmshuf(4, 6,i),'omitnan'), 'omitnan');%EZM v TM   (vs HC)
tmpshuf(7,i) = mean(mean(perf.svmshuf(5, 6,i),'omitnan'), 'omitnan');%EPM v TM   (vs HC)

tmpshuf(8,i) = mean(mean(perf.svmshuf(7, 8,i),'omitnan'), 'omitnan');%EZM/EPM v EZM/TM
tmpshuf(9,i) = mean(mean(perf.svmshuf(8, 9,i),'omitnan'), 'omitnan');%EZM/TM v EPM/TM

tmpshuf(10,i)= mean(mean(perf.svmshuf(10, 11,i),'omitnan'), 'omitnan');%EZM OPen vs EPM OPen
tmpshuf(11,i)= mean(mean(perf.svmshuf(10, 12,i),'omitnan'), 'omitnan');%EZM OPen vs Tmaze SvL
tmpshuf(12,i)= mean(mean(perf.svmshuf(10, 13,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L1Others
tmpshuf(13,i)= mean(mean(perf.svmshuf(10, 14,i),'omitnan'), 'omitnan');%EZM Open vs Tmaze L2Others
tmpshuf(14,i)= mean(mean(perf.svmshuf(11, 12,i),'omitnan'), 'omitnan');%EPM OPen vs Tmaze SvL
tmpshuf(15,i)= mean(mean(perf.svmshuf(11, 13,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L1Others
tmpshuf(16,i)= mean(mean(perf.svmshuf(11, 14,i),'omitnan'), 'omitnan');%EPM Open vs Tmaze L2Others

%anxiety vs context
tmpshuf(17,i)= mean(mean(perf.svmshuf(10, 4,i),'omitnan'), 'omitnan');%EZM OPen vs EZM/HC
tmpshuf(18,i)= mean(mean(perf.svmshuf(10, 5,i),'omitnan'), 'omitnan');%EZM OPen vs EPM/HC
tmpshuf(19,i)= mean(mean(perf.svmshuf(10, 6,i),'omitnan'), 'omitnan');%EZM OPen vs TM/HC

tmpshuf(20,i)= mean(mean(perf.svmshuf(11, 4,i),'omitnan'), 'omitnan');%EPM OPen vs EZM/HC
tmpshuf(21,i)= mean(mean(perf.svmshuf(11, 5,i),'omitnan'), 'omitnan');%EPM OPen vs EPM/HC
tmpshuf(22,i)= mean(mean(perf.svmshuf(11, 6,i),'omitnan'), 'omitnan');%EPM OPen vs TM/HC
end

