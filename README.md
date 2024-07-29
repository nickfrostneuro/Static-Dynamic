README
Folder contains code to perform analysis on behavioral and calcium data from static dynamic experiments. 

Social behavior vs context
Social experiments consist of two single recordings for each mouse collected on different days. One on the ‘static context day’ and one on the ‘dynamic context day.’ The static context day consists of 4 epochs within the animals home cage in which it is initially alone prior to introduction of a novel juvenile (epoch A-D). The Dynamic context experiment is the same except that Epochs C and D occur in a distinct context to which mouse has been previously habituated. 
Data corresponding to this experiment is included in zenodo repository (https://zenodo.org/records/10113327) in file ‘socx4_neuronmodulation_6000_6182003.mat'
This dataset contains variables corresponding to both the inputs and outputs of ‘HCRCSOC_analysis_single neuron modulation.m’
Inputs
Inscopix: cell array consisting of binarized calcium data from static and dynamic experiment days
SOCIAL: cell array consisting of vector corresponding to social interaction data and epoch for each frame
Dir_data: directory of mice

Lines 1-144: generate and compare population vectors for each epoch for static and dynamic experiment
Lines 161-203: calculate mean activity during social and nonsocial times
Lines 205-443: calculate modulation index for each cell and compare – note this is across entire experiment and not used in manuscript
Lines 449-570: calculate modulation index within epoch for each neuron
Lines 576-788: compare modulation index between epochs (note that included dataset includes output of this as it is time consuming)
Lines812 -1398: various comparisons and graphing to compare similarity across and within epochs
Line 1406: classifier
Line 1587: cosine similarity between different ensembles (social and context)


Anxiety-related behavior
Activity_by_epoch.m is code for analysis of anxiety related behavior across multiple contexts. Experiment consists of behavior analysis and calcium data collected in a single recording across 9 interleaved settings (home cage or different anxiety-provoking maxes)
HC1-EZM-HC2
HC3-EPM-HC4
HC5-TMaze-HC6 
1. The first 416 lines of this code generate subrasters or calcium data corresponding to times in which mouse is in each environment (HC1-6, EZM, EPM, or XM), or in subregions within the anxiety provoking mazes.
The outputs, calcium _epoch and raster_epoch, consist of raw calcium traces or binarized calcium activity (cells x frames), respectively in a structure array which contains data for each mouse, and epoch. Dir_data contains mouse numbers. These, as well as calcium(raw calcium)/inscopix(binary) and the behavior variables (EZM, EPM, XM) are included in ‘cleaned_data_and_behavior.mat’ on zenodo repository (https://zenodo.org/records/10113327)
2. Lines 420-512 calculate the mean activity during each epoch (calcium trace).
3. Lines 518-740 calculate similarity between epoch specific population vectors (pooled calcium traces)
4. Lines 751-944 calculates the degree to which individual cells are modulated by different behaviors (modulation index)

5. line 1025-1077 calculates cosine similarity

6. 1087 – 1136 analyze mean activity from binary data
7. 1139 – 1141 visualize similarity between subepochs (pooled data)
8. 1147 – 11179 calculate the similarity between populations vectors for each mouse. 
9. 1183-1222 calculate the activity of each neurons for each mouse and epoch
10. 1329 – 1551 calcualtes the similarity between different vectors on a mousewise basis. 
11. 1563-1703 – calculate cosine similarities
12. lines 1925-end – classifier analysis (can we decode whether mouse is in context A vs B?)



  
