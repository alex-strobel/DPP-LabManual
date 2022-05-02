%%
% Script for computing microstates for hypothesis 3a and 4a in the EEG ManyPipelines Project
%
% Author: Josephine Zerna, josephine.zerna@tu-dresden.de
%
% Requirements:
%   - EEGLAB [for importing and plotting EEG data]
%       Delorme A. & Makeig S. (2004). EEGLAB: an open-source toolbox for analysis of single-trial EEG dynamics, Journal of Neuroscience Methods 134:9-21.
%       Version 2019.1

%% Clear workspace

clear

%% Working directory and file listing

run eeglab.m % Run EEGLAB with its functions

% import the data

files = dir(fullfile('C:\Users\josep\Documents\04_Projekte\02_EEGManyPipelines\eeglab2021.1\Data','*.set')); % list all .set - files in directory

for i = 1:numel(files)
    currentName = files(i).name;
    currentSubject = currentName(1:end-4); % remove ".set" from the name
    EEG = pop_loadset(currentName, 'C:\Users\josep\Documents\04_Projekte\02_EEGManyPipelines\eeglab2021.1\Data');
    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', currentSubject);
end

%% Do baseline correction, and remove baseline period and unneccessary channels

ALLEEG = pop_rmbase(ALLEEG, [EEG.xmin 0]);
ALLEEG = pop_select(ALLEEG, 'time', [0 EEG.xmax], 'nochannel', {'M1','M2','VEOG','HEOG'});

%% Extracting the marker names as a seperate array

triggercodesH3 = ["1110", "1111", "1119", "2110", "2111", "2119", "1120", "1121", "1129", "2120", "2121", "2129"];
triggercodesH4 = ["1031", "1041", "1111", "1121", "1030", "1040", "1110", "1120"];

for i = 1:numel(files)
    % index with all relevant markers for hypothesis 3
    ALLEEG(i).TriggerH3 = matches(cellstr(string({ALLEEG(i).event.type})), triggercodesH3);
    % repeat for hypothesis 4
    ALLEEG(i).TriggerH4 = matches(cellstr(string({ALLEEG(i).event.type})), triggercodesH4);
end

% Creating a normalized ERP series per hypothesis per subject
for i = 1:numel(files)
    relevantEpochs = ALLEEG(i).event(ALLEEG(i).TriggerH3).epoch;
    gfp = std(mean(ALLEEG(i).data(:,:,relevantEpochs),3)); % calculate Global Field Power as the SD of mean activity across all channels at every time point
    ALLEEG(i).nERPH3 = mean(ALLEEG(i).data(:,:,relevantEpochs),3); % put mean across relevant epochs into new field
    ALLEEG(i).nERPH3(:,2:size(ALLEEG(i).nERPH3,2)) = ALLEEG(i).nERPH3(:,2:size(ALLEEG(i).nERPH3,2))./gfp(2:length(gfp)); % normalize each subject´s ERP series by dividing it by the GFP
    % repeat for hypothesis 4
    relevantEpochs = ALLEEG(i).event(ALLEEG(i).TriggerH4).epoch;
    gfp = std(mean(ALLEEG(i).data(:,:,relevantEpochs),3)); % calculate Global Field Power as the SD of mean activity across all channels at every time point
    ALLEEG(i).nERPH4 = mean(ALLEEG(i).data(:,:,relevantEpochs),3); % put mean across relevant epochs into new field
    ALLEEG(i).nERPH4(:,2:size(ALLEEG(i).nERPH4,2)) = ALLEEG(i).nERPH4(:,2:size(ALLEEG(i).nERPH4,2))./gfp(2:length(gfp)); % normalize each subject´s ERP series by dividing it by the GFP
end

%% Creating the grand-grandmean ERP series for both hypotheses

GGMeanERP3a = cat(3,ALLEEG.nERPH3); % create an array of along the z-axis concatenated normalized ERPs
GGMeanERP3a = mean(GGMeanERP3a,3); % average across the z-axis to obtain the grand-grandmean ERP series
GGMeanERP3a = GGMeanERP3a.'; % transpose matrix to be suitable for k means clustering
GGMeanERP4a = cat(3,ALLEEG.nERPH4);
GGMeanERP4a = mean(GGMeanERP4a,3);
GGMeanERP4a = GGMeanERP4a.';

%% Clustering the grand-grandmean ERP series for hypothesis 3a into microstates
    
for k = 5:30
    [idx,C,sumd,D] = kmeans(GGMeanERP3a, k, 'MaxIter', 100, 'Replicates', 50);
    % k clusters, moves the centroids 100 times, tries 50 different centroid starting positions
    % feed the results into a structure
    Clusters3a(k-4).idx = idx; % idx = column vector with cluster indices
    Clusters3a(k-4).C = C; % C = cluster centroid locations
    Clusters3a(k-4).sumd = sumd; % sumd = within-cluster sums of point-to-centroid distances
    Clusters3a(k-4).D = D; % D = distances from each point to each centroid
    Clusters3a(k-4).cumsum = sum(Clusters3a(k-4).sumd); % the cumulative sum of all distance measures
    Clusters3a(k-4).change = [0; diff([Clusters3a(k-4).idx])]; % the difference between current and previous cluster id
end

% create a new field, displaying the order of cluster IDs
for i = 1:numel(Clusters3a)
    Clusters3a(i).ID = Clusters3a(i).idx(1); % add the first element of idx to a new field
    for j = 2:numel(Clusters3a(i).change)
        if Clusters3a(i).change(j) ~ 0; % if there is a change in cluster id
            Clusters3a(i).ID = vertcat(Clusters3a(i).ID,Clusters3a(i).idx(j)); % add the corresponding id to the new field
        else
            % do nothing
        end  
    end
end

% create a new field with a vector, counting the amount of repetitions of each cluster
for i = 1:numel(Clusters3a)
    Clusters3a(i).rep = []; % create new empty field
    n = 1; % set counter to one
    for j = 2:numel(Clusters3a(i).idx)
           if Clusters3a(i).idx(j) == Clusters3a(i).idx(j-1) % if the current time point belongs to the same cluster as the previous one
               n = n + 1; % increase counter by one
           elseif Clusters3a(i).idx(j) ~= Clusters3a(i).idx(j-1) % if the current time point belongs to a different cluster
               Clusters3a(i).rep = vertcat(Clusters3a(i).rep,n); % attach counter value to field
               n = 1; % set counter back to one
           end
    end
    % now count the repetition of the last cluster by adding the subtraction of the number of time points and the sum of the other
    % cluster repetitions so far (the if-statement fails to include the last cluster, so this is a cheat)
    Clusters3a(i).rep = vertcat(Clusters3a(i).rep,numel(Clusters3a(i).idx)-sum(Clusters3a(i).rep));
end

%% Clustering the grand-grandmean ERP series for hypothesis 4a into microstates
    
for k = 5:30
    [idx,C,sumd,D] = kmeans(GGMeanERP4a, k, 'MaxIter', 100, 'Replicates', 50);
    % k clusters, moves the centroids 100 times, tries 50 different centroid starting positions
    % feed the results into a structure
    Clusters4a(k-4).idx = idx; % idx = column vector with cluster indices
    Clusters4a(k-4).C = C; % C = cluster centroid locations
    Clusters4a(k-4).sumd = sumd; % sumd = within-cluster sums of point-to-centroid distances
    Clusters4a(k-4).D = D; % D = distances from each point to each centroid
    Clusters4a(k-4).cumsum = sum(Clusters4a(k-4).sumd); % the cumulative sum of all distance measures
    Clusters4a(k-4).change = [0; diff([Clusters4a(k-4).idx])]; % the difference between current and previous cluster id
end

% create a new field, displaying the order of cluster IDs
for i = 1:numel(Clusters4a)
    Clusters4a(i).ID = Clusters4a(i).idx(1); % add the first element of idx to a new field
    for j = 2:numel(Clusters4a(i).change)
        if Clusters4a(i).change(j) ~ 0; % if there is a change in cluster id
            Clusters4a(i).ID = vertcat(Clusters4a(i).ID,Clusters4a(i).idx(j)); % add the corresponding id to the new field
        else
            % do nothing
        end  
    end
end

% create a new field with a vector, counting the amount of repetitions of each cluster
for i = 1:numel(Clusters4a)
    Clusters4a(i).rep = []; % create new empty field
    n = 1; % set counter to one
    for j = 2:numel(Clusters4a(i).idx)
           if Clusters4a(i).idx(j) == Clusters4a(i).idx(j-1) % if the current time point belongs to the same cluster as the previous one
               n = n + 1; % increase counter by one
           elseif Clusters4a(i).idx(j) ~= Clusters4a(i).idx(j-1) % if the current time point belongs to a different cluster
               Clusters4a(i).rep = vertcat(Clusters4a(i).rep,n); % attach counter value to field
               n = 1; % set counter back to one
           end
    end
    % now count the repetition of the last cluster by adding the subtraction of the number of time points and the sum of the other
    % cluster repetitions so far (the if-statement fails to include the last cluster, so this is a cheat)
    Clusters4a(i).rep = vertcat(Clusters4a(i).rep,numel(Clusters4a(i).idx)-sum(Clusters4a(i).rep));
end

%% Visualizing the different clustering options for hypothesis 3a

n = max(cellfun(@numel,{Clusters3a.rep})); % find the cell with the highest number of elements

for i = 1:numel(Clusters3a)
    Clusters3a(i).repnan = Clusters3a(i).rep; % copy field into new field
    Clusters3a(i).repnan(end+1:n) = nan; % attach NaN to all cells with fewer elements than n
end

ClusterOptions3a = vertcat([Clusters3a.repnan]'); % concatenate cluster rep cells by row

ClusterFig3a = figure(1);

subplot(1,7,[1:4]);
barh(5:k,ClusterOptions3a,'stacked') % stacked horizontal bars showing the duration of microstates for each number of k
title('Duration of microstates using different numbers of clusters k')
ylabel('Clusters k')
xlabel('Approximate duration in ms')
xticks([0:150:600]) % change x-axis tick interval
xticklabels({'0','300','600','900','1170'}) % change x-axis ticks

subplot(1,7,5);
barh(5:k,[cellfun(@length,{Clusters3a.ID})]) % horizontal bar chart showing the number of microstates for each k
title({'Number of microstates','for each k'})
ylabel('Clusters k')
xlabel('Number of microstates')

subplot(1,7,6:7);
plot(5:k,[Clusters3a.cumsum],'-o') % elbow plot showing the reduction in distance
title({'Cumulative distance to centroid within clusters','depending on the number of clusters k'})
xlabel('Clusters k')
ylabel('Cumulative distance')

%% Decide on a number of microstates for hypothesis 3a

NoC3a = 27; % insert the optimal number of clusters k, determined by visual inspection of the three plots in figure 1

Cluster_3a = Clusters3a(NoC3a-4); % single out the corresponding cluster results

% the clustering algorithm recognized the first sampling point as an
% independent cluster, which is only 4 ms long and cannot be considered a
% microstate, so we will have to include the first sampling point in the
% "second"/first microstate
Cluster_3a.idx(1) = Cluster_3a.idx(2);
Cluster_3a.change(2) = Cluster_3a.change(1);
Cluster_3a.ID = Cluster_3a.ID(2:end);
Cluster_3a.rep = [Cluster_3a.rep(1)+Cluster_3a.rep(2); Cluster_3a.rep(3:28)];
Cluster_3a.repnan = [Cluster_3a.repnan(1)+Cluster_3a.repnan(2); Cluster_3a.repnan(3:35)];

MSdurations3a = Cluster_3a.rep.*4; % a vector of the duration of each microstate in ms
MSdurationsCumul3a = cumsum(MSdurations3a); % a vector of the cumulative duration of each microstate in ms

%% Visualizing the different clustering options for hypothesis 4a

n = max(cellfun(@numel,{Clusters4a.rep})); % find the cell with the highest number of elements

for i = 1:numel(Clusters4a)
    Clusters4a(i).repnan = Clusters4a(i).rep; % copy field into new field
    Clusters4a(i).repnan(end+1:n) = nan; % attach NaN to all cells with fewer elements than n
end

ClusterOptions4a = vertcat([Clusters4a.repnan]'); % concatenate cluster rep cells by row

ClusterFig4a = figure(2);

subplot(1,7,[1:4]);
barh(5:k,ClusterOptions4a,'stacked') % stacked horizontal bars showing the duration of microstates for each number of k
title('Duration of microstates using different numbers of clusters k')
ylabel('Clusters k')
xlabel('Approximate duration in ms')
xticks([0:150:600]) % change x-axis tick interval
xticklabels({'0','300','600','900','1170'}) % change x-axis ticks

subplot(1,7,5);
barh(5:k,[cellfun(@length,{Clusters4a.ID})]) % horizontal bar chart showing the number of microstates for each k
title({'Number of microstates','for each k'})
ylabel('Clusters k')
xlabel('Number of microstates')

subplot(1,7,6:7);
plot(5:k,[Clusters4a.cumsum],'-o') % elbow plot showing the reduction in distance
title({'Cumulative distance to centroid within clusters','depending on the number of clusters k'})
xlabel('Clusters k')
ylabel('Cumulative distance')

%% Decide on a number of microstates for hypothesis 4a

NoC4a = 22; % insert the optimal number of clusters k, determined by visual inspection of the three plots in figure 2

Cluster_4a = Clusters4a(NoC4a-4); % single out the corresponding cluster results

% the clustering algorithm recognized the first sampling point as an
% independent cluster, which is only 4 ms long and cannot be considered a
% microstate, so we will have to include the first sampling point in the
% "second"/first microstate
Cluster_4a.idx(1) = Cluster_4a.idx(2);
Cluster_4a.change(2) = Cluster_4a.change(1);
Cluster_4a.ID = Cluster_4a.ID(2:end);
Cluster_4a.rep = [Cluster_4a.rep(1)+Cluster_4a.rep(2); Cluster_4a.rep(3:30)];
Cluster_4a.repnan = [Cluster_4a.repnan(1)+Cluster_4a.repnan(2); Cluster_4a.repnan(3:41)];

MSdurations4a = Cluster_4a.rep.*4; % a vector of the duration of each microstate in ms
MSdurationsCumul4a = cumsum(MSdurations4a); % a vector of the cumulative duration of each microstate in ms

%% Create ERPs for each condition of interest

name = ["Hits3a","Misses3a","Remembered4a","Forgotten4a"]'; % create a vector of condition names

for i = 1:numel(name)
    ERPs(i).name = name(i); % feed condition names into the field of a new struct
end

strAll = ["1110", "1111", "1119", "2110", "2111", "2119";
    "1120", "1121", "1129", "2120", "2121", "2129";
    "1031", "1041", "1111", "1121", NaN, NaN;
    "1030", "1040", "1110", "1120", NaN, NaN]; % string array with the relevant markers for the loop to reference to

% put all relevant epochs in the respective field
for j = 1:size(strAll,1)
    for i = 1:numel(ALLEEG)
        relevantEpochs = [ALLEEG(i).event(find(contains(cellstr(string({ALLEEG(i).event.type})),strAll(j,:)))).epoch]; % indices of all epochs of the relevant condition
            if i == 1
                ERPs(j).data = cat(3,ALLEEG(i).data(:,:,relevantEpochs)); % put the first data into the new field
            else
                ERPs(j).data = cat(3,ERPs(j).data,ALLEEG(i).data(:,:,relevantEpochs)); % append all other data along the z-dimension
            end
    end
end


%% Apply the number of microstates to the ERPs

NoMS3a = numel(Cluster_3a.ID); % the number of microstates, based on the number of clusters assigned before
NoMS4a = numel(Cluster_4a.ID);

for i = 1:numel(ERPs)
    ERPs(i).ERP = mean(ERPs(i).data,3)./std(mean(ERPs(i).data,3)); % new field with the channel x time values, averaged across epochs and with normalized GFP
end

for i = 1:2
    for j = 1:numel(Cluster_3a.rep)
        if j == 1
            ERPs(i).MS = mean(ERPs(i).ERP(:,1:Cluster_3a.rep(j)),2); % average the number of columns corresponding to the repetitions of the first cluster
        else
            ERPs(i).MS = horzcat(ERPs(i).MS,mean(ERPs(i).ERP(:,sum(Cluster_3a.rep(1:j-1))+1:sum(Cluster_3a.rep(1:j))),2)); % append the other averaged data of the following clusters
        end
    end
end
for i = 3:4
    for j = 1:numel(Cluster_4a.rep)
        if j == 1
            ERPs(i).MS = mean(ERPs(i).ERP(:,1:Cluster_4a.rep(j)),2); % average the number of columns corresponding to the repetitions of the first cluster
        else
            ERPs(i).MS = horzcat(ERPs(i).MS,mean(ERPs(i).ERP(:,sum(Cluster_4a.rep(1:j-1))+1:sum(Cluster_4a.rep(1:j))),2)); % append the other averaged data of the following clusters
        end
    end
end

%% Preparing TANOVA calculation

poolname = ["H3a";"H4a"]; % create a vector of names

poolindex = [1,2;3,4]'; % create a vector which indicates which lines of the struct ERPs will be pooled

j = 1;
for i = 1:numel(poolname)
    Hypoth(i).pool = poolname(i); % feed condition names into the field of a new struct
    Hypoth(i).data = cat(3,ERPs(poolindex(j)).data,ERPs(poolindex(j+1)).data); % pool the relevant data matrices in a new field of the hypotheses-struct
    Hypoth(i).division = cat(2,size(ERPs(poolindex(j)).data,3),size(ERPs(poolindex(j+1)).data,3)); % make a note of the ratio of the two pooled data arrays
    j = j+2;
end

MSnum3a = string(1:NoMS3a); % create a string array of the microstate numbers for hypothesis 3a

for j = 1:NoMS3a
    Hypoth(1).divone(1).(append("MS",MSnum3a(j)))=[]; % create a new field for every microstate of one division
    Hypoth(1).divtwo(1).(append("MS",MSnum3a(j)))=[]; % create a new field for every microstate of the other division
end

MSnum4a = string(1:NoMS4a); % create a string array of the microstate numbers for hypothesis 4a

for j = 1:NoMS4a
    Hypoth(2).divone(1).(append("MS",MSnum4a(j)))=[]; % create a new field for every microstate of one division
    Hypoth(2).divtwo(1).(append("MS",MSnum4a(j)))=[]; % create a new field for every microstate of the other division
end

%% Creating the null distribution of the pooled data

for n = 1:numel(Hypoth)
    % make sure that the loop refers to the correct hypothesis in both iterations
    if n == 1
        MSnum = MSnum3a;
        NoMS = NoMS3a;
        Clusters = Cluster_3a;
        NoC = NoC3a;
    else
        MSnum = MSnum4a;
        NoMS = NoMS4a;
        Clusters = Cluster_4a;
        NoC = NoC4a;
    end
    % create a null distribution out of 3000 randomly shuffled samples
    for rep = 1:3000
        datashuffle = Hypoth(n).data(:,:,randperm(size(Hypoth(n).data,3))); % randomly shuffle the z-dimension, while keeping x- and y-data
        divERP_one = mean(datashuffle(:,2:end,1:Hypoth(n).division(1)),3)./std(mean(datashuffle(:,2:end,1:Hypoth(n).division(1)),3)); % average as many epochs as one half of the pooled data, normalize GFP
        divERP_two = mean(datashuffle(:,2:end,Hypoth(n).division(1)+1:end),3)./std(mean(datashuffle(:,2:end,Hypoth(n).division(1)+1:end),3)); % average the remaining epochs, normalize GFP
        % reattach the first column of zeros (which had to be skipped in the two lines above, because you cannot divide by zero)
        divERP_one = [mean(datashuffle(:,1,1:Hypoth(n).division(1)),3) divERP_one];
        divERP_two = [mean(datashuffle(:,1,Hypoth(n).division(1)+1:end),3) divERP_two];
        if rep == 1
            for j = 1:NoMS
                if j == 1
                    Hypoth(n).divone(1).(append("MS",MSnum(j)))= mean(divERP_one(:,1:Clusters.rep(j)),2); % average the number of columns corresponding to the repetitions of the first cluster
                    Hypoth(n).divtwo(1).(append("MS",MSnum(j)))= mean(divERP_two(:,1:Clusters.rep(j)),2); % the same for divERP_two
                else
                    Hypoth(n).divone(1).(append("MS",MSnum(j)))= mean(divERP_one(:,sum(Clusters.rep(1:j-1))+1:sum(Clusters.rep(1:j))),2); % average the number of columns corresponding to the repetitions of each cluster
                    Hypoth(n).divtwo(1).(append("MS",MSnum(j)))= mean(divERP_two(:,sum(Clusters.rep(1:j-1))+1:sum(Clusters.rep(1:j))),2); % the same for divERP_two
                end
            end
        else
            for j = 1:NoMS
                if j == 1
                    Hypoth(n).divone(1).(append("MS",MSnum(j)))= horzcat(Hypoth(n).divone(1).(append("MS",MSnum(j))),mean(divERP_one(:,1:Clusters.rep(j)),2)); % average the number of columns corresponding to the repetitions of the first cluster
                    Hypoth(n).divtwo(1).(append("MS",MSnum(j)))= horzcat(Hypoth(n).divtwo(1).(append("MS",MSnum(j))),mean(divERP_two(:,1:Clusters.rep(j)),2)); % the same for divERP_two
                else
                    Hypoth(n).divone(1).(append("MS",MSnum(j)))= horzcat(Hypoth(n).divone(1).(append("MS",MSnum(j))),mean(divERP_one(:,sum(Clusters.rep(1:j-1))+1:sum(Clusters.rep(1:j))),2)); % average the number of columns corresponding to the repetitions of each cluster
                    Hypoth(n).divtwo(1).(append("MS",MSnum(j)))= horzcat(Hypoth(n).divtwo(1).(append("MS",MSnum(j))),mean(divERP_two(:,sum(Clusters.rep(1:j-1))+1:sum(Clusters.rep(1:j))),2)); % the same for divERP_two
                end
            end
        end
    end
end

% the topographical similarity measure is defined as: cos theta = (vecA * vecB) / (magnitude(vecA) * magnitude(vecB))

for j = 1:NoMS3a
    % calculate cos theta for every value pair in divone and divtwo and feed the results into a similar struct, yielding 3000 elements per null distribution of each microstate
    Hypoth(1).H0(1).(append("MS",MSnum3a(j))) = (dot(Hypoth(1).divone(1).(append("MS",MSnum3a(j))),Hypoth(1).divtwo(1).(append("MS",MSnum3a(j)))))./...
            (times(vecnorm(Hypoth(1).divone(1).(append("MS",MSnum3a(j)))),vecnorm(Hypoth(1).divtwo(1).(append("MS",MSnum3a(j))))));
end
for j = 1:NoMS4a
    % calculate cos theta for every value pair in divone and divtwo and feed the results into a similar struct, yielding 3000 elements per null distribution of each microstate
    Hypoth(2).H0(1).(append("MS",MSnum4a(j))) = (dot(Hypoth(2).divone(1).(append("MS",MSnum4a(j))),Hypoth(2).divtwo(1).(append("MS",MSnum4a(j)))))./...
            (times(vecnorm(Hypoth(2).divone(1).(append("MS",MSnum4a(j)))),vecnorm(Hypoth(2).divtwo(1).(append("MS",MSnum4a(j))))));
end


%% Calculating the Cos Theta for all hypotheses

for j = 1:NoMS3a
    for n = 1:numel(Hypoth)
        Hypoth(1).H1(1).(append("MS",MSnum3a(j)))=[]; % create a new field for every microstate
    end
end
for j = 1:NoMS4a
    for n = 1:numel(Hypoth)
        Hypoth(2).H1(1).(append("MS",MSnum4a(j)))=[]; % create a new field for every microstate
    end
end

% calculate Cos Thetas for each combination of conditions
H1H3a = (dot(ERPs(poolindex(1)).MS,ERPs(poolindex(2)).MS))./...
    (times(vecnorm(ERPs(poolindex(1)).MS),vecnorm(ERPs(poolindex(2)).MS)));
H1H4a = (dot(ERPs(poolindex(3)).MS,ERPs(poolindex(4)).MS))./...
    (times(vecnorm(ERPs(poolindex(3)).MS),vecnorm(ERPs(poolindex(4)).MS)));

for j = 1:NoMS3a
    Hypoth(1).H1(1).(append("MS",MSnum3a(j))) = H1H3a(j); % feed each value of Cos Theta into the corresponding microstate field
end
for j = 1:NoMS4a
    Hypoth(2).H1(1).(append("MS",MSnum4a(j))) = H1H4a(j);
end


%% Check H1 values against H0 distributions

adjustedp3a = 0.05/NoMS3a; % the adjusted p-value is alpha divided by the number of microstates
adjustedp4a = 0.05/NoMS4a;
lowerrank3a = rep*(adjustedp3a/2); % determines which rank position is the cutoff for the lower signficance cutoff
lowerrank4a = rep*(adjustedp4a/2);
higherrank3a = rep*(1-adjustedp3a/2); % determines which rank position is the cutoff for the higher signficance cutoff
higherrank4a = rep*(1-adjustedp4a/2);

H0sorted3a = structfun(@sort,Hypoth(1).H0(1),'UniformOutput',false); % creates struct with sorted values of each microstate H0 distribution
H0sorted4a = structfun(@sort,Hypoth(2).H0(1),'UniformOutput',false);

for j = 1:NoMS3a
    rankposition = find(H0sorted3a(1).(append("MS",MSnum3a(j))) > Hypoth(1).H1(1).(append("MS",MSnum3a(j))),1)-1; % find the first element of H0sorted, that is bigger than H1
    % now add significance information to each field
    if rankposition < lowerrank3a % if it is smaller than the lower cutoff
        Hypoth(1).H1(2).(append("MS",MSnum3a(j))) = append("rank ",string(rankposition));
        Hypoth(1).H1(3).(append("MS",MSnum3a(j))) = "SigLow";
        Hypoth(1).H1(4).(append("MS",MSnum3a(j))) = append("p = ",string((rankposition+1)/rep));
    elseif (lowerrank3a <= rankposition) & (rankposition <= higherrank3a) % if it is between the cutoff limits
        Hypoth(1).H1(2).(append("MS",MSnum3a(j))) = append("rank ",string(rankposition));
        Hypoth(1).H1(3).(append("MS",MSnum3a(j))) = "n.s.";
        Hypoth(1).H1(4).(append("MS",MSnum3a(j))) = append("p = ",string((rankposition+1)/rep));
    else % if it is larger than the high cutoff
        Hypoth(1).H1(2).(append("MS",MSnum3a(j))) = append("rank ",string(rep));
        Hypoth(1).H1(3).(append("MS",MSnum3a(j))) = "SigHigh";
        Hypoth(1).H1(4).(append("MS",MSnum3a(j))) = append("p = ",string(1/rep));
    end
end

for j = 1:NoMS4a
    rankposition = find(H0sorted4a(1).(append("MS",MSnum4a(j))) > Hypoth(2).H1(1).(append("MS",MSnum4a(j))),1)-1; % find the first element of H0sorted, that is bigger than H1
    % now add significance information to each field
    if rankposition < lowerrank4a % if it is smaller than the lower cutoff
        Hypoth(2).H1(2).(append("MS",MSnum4a(j))) = append("rank ",string(rankposition));
        Hypoth(2).H1(3).(append("MS",MSnum4a(j))) = "SigLow";
        Hypoth(2).H1(4).(append("MS",MSnum4a(j))) = append("p = ",string((rankposition+1)/rep));
    elseif (lowerrank4a <= rankposition) & (rankposition <= higherrank4a) % if it is between the cutoff limits
        Hypoth(2).H1(2).(append("MS",MSnum4a(j))) = append("rank ",string(rankposition));
        Hypoth(2).H1(3).(append("MS",MSnum4a(j))) = "n.s.";
        Hypoth(2).H1(4).(append("MS",MSnum4a(j))) = append("p = ",string((rankposition+1)/rep));
    else % if it is larger than the high cutoff
        Hypoth(2).H1(2).(append("MS",MSnum4a(j))) = append("rank ",string(rep));
        Hypoth(2).H1(3).(append("MS",MSnum4a(j))) = "SigHigh";
        Hypoth(2).H1(4).(append("MS",MSnum4a(j))) = append("p = ",string(1/rep));
    end
end

%% Compute p-values for local topographical differences

% add a new field to the ERPs struct, containing microstate values that are not averaged across participants

for j = 1:2
    for n = 1:numel(Cluster_3a.rep)
        if n == 1
            ERPs(j).MSnonav = mean(ERPs(j).data(:,1:Cluster_3a.rep(n),:),2); % average the number of columns corresponding to the repetitions of the first cluster
        else
            ERPs(j).MSnonav = horzcat(ERPs(j).MSnonav,mean(ERPs(j).data(:,sum(Cluster_3a.rep(1:n-1))+1:sum(Cluster_3a.rep(1:n)),:),2)); % append the other averaged data of the following clusters
        end
    end
end
for j = 3:4
    for n = 1:numel(Cluster_4a.rep)
        if n == 1
            ERPs(j).MSnonav = mean(ERPs(j).data(:,1:Cluster_4a.rep(n),:),2); % average the number of columns corresponding to the repetitions of the first cluster
        else
            ERPs(j).MSnonav = horzcat(ERPs(j).MSnonav,mean(ERPs(j).data(:,sum(Cluster_4a.rep(1:n-1))+1:sum(Cluster_4a.rep(1:n)),:),2)); % append the other averaged data of the following clusters
        end
    end
end

for j = 1:NoMS3a
    if Hypoth(1).H1(3).(append("MS",MSnum3a(j))) == "n.s."
        Hypoth(1).H1(5).(append("MS",MSnum3a(j))) = []; % if the microstate was not significant in the first place, add empty value
        Hypoth(1).H1(6).(append("MS",MSnum3a(j))) = [];
    else
        % the number of epochs in the condition with less epochs
        smalldim = min(size(ERPs(poolindex(1)).MSnonav,3),size(ERPs(poolindex(2)).MSnonav,3));
        % compare the channel values across all epochs per channel and randomly pick as many epochs from both conditions as...
        % there are epochs in the condition with less epochs (to match the requirements of the paired-sample ttest)
        [h,p,ci,stats] = ttest(ERPs(poolindex(1)).MSnonav(:,j,randperm(size(ERPs(poolindex(1)).MSnonav,3),smalldim)),ERPs(poolindex(2)).MSnonav(:,j,randperm(size(ERPs(poolindex(2)).MSnonav,3),smalldim)),'Dim',3,'Alpha',0.0017);
        % h is a channel-length vector of zeros (reject H1) and ones(reject H0)
        % p is a channel-length vector with the p-values
        % stats is a struct containing the test statistic as a field
        Hypoth(1).H1(5).(append("MS",MSnum3a(j))) = horzcat(h,p,stats(1).tstat,h.*stats(1).tstat);
        % h, p and t into three columns of an array for each sign. MS
        % the fourth column contains the t-values of significant channels, and zeros for insignificant channels (for plotting)
        % replace negative values with -1 and positive values with +1 in the fourth column
        Hypoth(1).H1(5).(append("MS",MSnum3a(j)))(:,4) = Hypoth(1).H1(5).(append("MS",MSnum3a(j)))(:,4)./abs(Hypoth(1).H1(5).(append("MS",MSnum3a(j)))(:,4));
        Hypoth(1).H1(6).(append("MS",MSnum3a(j))) = {ALLEEG(1).chanlocs(find(Hypoth(1).H1(5).(append("MS",MSnum3a(j)))(:,4) == 1)).labels}; % locations of the significant channels that have higher activity in condition A
        Hypoth(1).H1(7).(append("MS",MSnum3a(j))) = {ALLEEG(1).chanlocs(find(Hypoth(1).H1(5).(append("MS",MSnum3a(j)))(:,4) == -1)).labels}; % locations of the significant channels that have lower activity in condition A
    end
end

for j = 1:NoMS4a % repeat for hypothesis 4a
    if Hypoth(2).H1(3).(append("MS",MSnum4a(j))) == "n.s."
        Hypoth(2).H1(5).(append("MS",MSnum4a(j))) = []; % if the microstate was not significant in the first place, add empty value
        Hypoth(2).H1(6).(append("MS",MSnum4a(j))) = [];
    else
        smalldim = min(size(ERPs(poolindex(3)).MSnonav,3),size(ERPs(poolindex(4)).MSnonav,3));
        [h,p,ci,stats] = ttest(ERPs(poolindex(3)).MSnonav(:,j,randperm(size(ERPs(poolindex(3)).MSnonav,3),smalldim)),ERPs(poolindex(4)).MSnonav(:,j,randperm(size(ERPs(poolindex(4)).MSnonav,3),smalldim)),'Dim',3,'Alpha',0.0017);
        Hypoth(2).H1(5).(append("MS",MSnum4a(j))) = horzcat(h,p,stats(1).tstat,h.*stats(1).tstat);
        Hypoth(2).H1(5).(append("MS",MSnum4a(j)))(:,4) = Hypoth(2).H1(5).(append("MS",MSnum4a(j)))(:,4)./abs(Hypoth(2).H1(5).(append("MS",MSnum4a(j)))(:,4));
        Hypoth(2).H1(6).(append("MS",MSnum4a(j))) = {ALLEEG(1).chanlocs(find(Hypoth(2).H1(5).(append("MS",MSnum4a(j)))(:,4) == 1)).labels}; % locations of the significant channels that have higher activity in condition A
        Hypoth(2).H1(7).(append("MS",MSnum4a(j))) = {ALLEEG(1).chanlocs(find(Hypoth(2).H1(5).(append("MS",MSnum4a(j)))(:,4) == -1)).labels}; % locations of the significant channels that have lower activity in condition A
    end
end


%% Plot microstate pairs of a hypothesis with significant electrode locations

mycbarlimits = [abs(min(Hypoth(1).data,[],'all')),abs(max(Hypoth(1).data,[],'all'))]; % absolute value of highest and lowest value in the data for the colorbar limits

fig4 = figure(4);
condA = 1; % insert the line number of condition A in the ERPs-struct
condB = 2; % same with condition B
hypothAB = 1; % insert the corresponding line of the Hypoth-struct
n = [1:9,28:36];
m = 1;
for j = 1:size(ERPs(condA).MS,2)
    if m <= 18
        subplot(6,9,n(m));
        topoplot(ERPs(condA).MS(:,j),ALLEEG(1).chanlocs,'electrodes','off','plotrad',0.5);
        title(string(j),'FontSize',13);
        subplot(6,9,n(m)+9);
        topoplot(ERPs(condB).MS(:,j),ALLEEG(1).chanlocs,'electrodes','off','plotrad',0.5);
        subplot(6,9,n(m)+18);
        if Hypoth(hypothAB).H1(3).(append("MS",i(j))) == "n.s."
            topoplot(zeros(30,1),ALLEEG(1).chanlocs,'style','blank','electrodes','off','hcolor','none','plotrad',0.5);
            % style blank -> plot no colormap
            % electrodes off -> plot no electrodes
            % hcolor none -> plot no head
            % -> essentially plots a gap
        else
            if isempty(Hypoth(hypothAB).H1(6).(append("MS",i(j)))) == 1 && isempty(Hypoth(hypothAB).H1(7).(append("MS",i(j)))) == 1
                topoplot(zeros(30,1),ALLEEG(1).chanlocs,'style','blank','electrodes','off','hcolor',[0.76 0.76 0.76],'plotrad',0.7);
                % if the microstates are significant, but no electrodes are...
                % plot a head
            elseif isempty(Hypoth(hypothAB).H1(6).(append("MS",i(j)))) == 0 && isempty(Hypoth(hypothAB).H1(7).(append("MS",i(j)))) == 1
                topoplot(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,1).*-1,ALLEEG(1).chanlocs,'style','blank','emarker',{'^','k',3,2},'plotchans',find(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,4)==1),'hcolor',[0.76 0.76 0.76],'headrad',0.5,'plotrad',0.7);
                % plot only those electrodes that have higher activity, if...
                % there are none with lower activity
            elseif isempty(Hypoth(hypothAB).H1(6).(append("MS",i(j)))) == 1 && isempty(Hypoth(hypothAB).H1(7).(append("MS",i(j)))) == 0
                topoplot(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,1).*-1,ALLEEG(1).chanlocs,'style','blank','emarker',{'.','k',11,2},'plotchans',find(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,4)==-1),'hcolor',[0.76 0.76 0.76],'headrad',0.5,'plotrad',0.7);
                % plot only those electrodes that have lower activity, if...
                % there are none with higher activity
            else
                hold on
                topoplot(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,1).*-1,ALLEEG(1).chanlocs,'style','blank','emarker',{'^','k',3,2},'plotchans',find(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,4)==1),'hcolor',[0.76 0.76 0.76],'headrad',0.5,'plotrad',0.7);
                topoplot(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,1).*-1,ALLEEG(1).chanlocs,'style','blank','emarker',{'.','k',11,2},'plotchans',find(Hypoth(hypothAB).H1(5).(append("MS",i(j)))(:,4)==-1),'hcolor','none','headrad',0.5,'plotrad',0.7);
                hold off
            end
        % style blank -> plot no colormap
        % emarker -> {markerchar color size linewidth}
        % plotchans vector -> the channel vector to be plotted
        % hcolor none -> plot no head
        end
        m = m+1;
    else
        
    end
end

% uncomment one of the following definitions of the variable 'mycolors'
% depending on whether you want a grey scaled or colorful topoplot
mycolors = brewermap(NaN,'Greys'); % grey scaled colors
mycolors = customcolormap([0 0.5 1],[0.9 0.89 0.2;0.77 1 0.95;0.01 0.6 0.59]); % evenly spaced custom colors in teal/yellow

colormap(mycolors); % use custom colors
caxis([-max(mycbarlimits) max(mycbarlimits)]); % set colorbar to a range between a minus and plus version of the largest value in the data

export_fig PlotOfHypothesis1grey.png -png -transparent % name the plot for export into a png-file with transparent background