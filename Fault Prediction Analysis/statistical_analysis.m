%% Load Data
clear,clc
close all
rng(10)
rawdata = xlsread('data_alternatorpot');
ind = randperm(length(rawdata));
rawdata1 = rawdata(ind,:);
features = rawdata1(:,1:end-1);
class = rawdata1(:,end);
%% Normality Test
[TableNT, pKs, pLil, pJb] = NorTest(features);
close all

%% Kruskal-Wallis
for i = 1:size(rawdata1,2)-1
 P(i) = kruskalwallis(features(:,i),class,'off');
end

%% Choose K for KNN (60-40)
for j = 1:10
    CVO = cvpartition(class,'Holdout',0.4);
    err = zeros(CVO.NumTestSets,1);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        %ytest = classify(features(teIdx,:),features(trIdx,:),class(trIdx,:),'quadratic');
        ytest = KNN(features(trIdx,:),features(teIdx,:),class(trIdx,:),j);
        %err(i) = sum(~strcmp(ytest,class(teIdx)));
        sama(i) = sum(ytest == class(teIdx));
    end
    Acc(j) = (sum(sama)/sum(CVO.TestSize))*100;
end
[Y,I] = max(Acc);
figure(100)
plot(Acc)
Acc6040 = Acc;
%% Holdout (60-40) for 10 times
for j = 1:1
    CVO = cvpartition(class,'Holdout',0.4);
    err = zeros(CVO.NumTestSets,1);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        %ytest = classify(features(teIdx,:),features(trIdx,:),class(trIdx,:),'quadratic');
        ytest = KNN(features(trIdx,:),features(teIdx,:),class(trIdx,:),I);
        %err(i) = sum(~strcmp(ytest,class(teIdx)));
        sama(i) = sum(ytest == class(teIdx));
    end
    Accuracy(j) = (sum(sama)/sum(CVO.TestSize))*100;
end
AccuracyAVG6040 = mean(Accuracy);

btest = ClasstoBinary(ytest);
bclass = ClasstoBinary(class(teIdx));
figure(101)
plotconfusion(btest,bclass)

%% Choose K for KNN (70-30)
for j = 1:10
    CVO = cvpartition(class,'Holdout',0.3);
    err = zeros(CVO.NumTestSets,1);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        %ytest = classify(features(teIdx,:),features(trIdx,:),class(trIdx,:),'quadratic');
        ytest = KNN(features(trIdx,:),features(teIdx,:),class(trIdx,:),j);
        %err(i) = sum(~strcmp(ytest,class(teIdx)));
        sama(i) = sum(ytest == class(teIdx));
    end
    Acc(j) = (sum(sama)/sum(CVO.TestSize))*100;
end
[Y,I] = max(Acc);
figure(102)
plot(Acc)
Acc7030 = Acc;

%% Holdout (70-30) for 10 times
for j = 1:1
    CVO = cvpartition(class,'Holdout',0.3);
    err = zeros(CVO.NumTestSets,1);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        %ytest = classify(features(teIdx,:),features(trIdx,:),class(trIdx,:),'quadratic');
        ytest = KNN(features(trIdx,:),features(teIdx,:),class(trIdx,:),I);
        %err(i) = sum(~strcmp(ytest,class(teIdx)));
        sama(i) = sum(ytest == class(teIdx));
    end
    Accuracy(j) = (sum(sama)/sum(CVO.TestSize))*100;
end
AccuracyAVG7030 = mean(Accuracy);

btest = ClasstoBinary(ytest);
bclass = ClasstoBinary(class(teIdx));
figure(103)
plotconfusion(btest,bclass)

%% Choose K for KNN (80-20)
for j = 1:10
    CVO = cvpartition(class,'Holdout',0.2);
    err = zeros(CVO.NumTestSets,1);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        %ytest = classify(features(teIdx,:),features(trIdx,:),class(trIdx,:),'quadratic');
        ytest = KNN(features(trIdx,:),features(teIdx,:),class(trIdx,:),j);
        %err(i) = sum(~strcmp(ytest,class(teIdx)));
        sama(i) = sum(ytest == class(teIdx));
    end
    Acc(j) = (sum(sama)/sum(CVO.TestSize))*100;
end
[Y,I] = max(Acc);
figure(104)
plot(Acc)
Acc8020 = Acc;

%% Holdout (80-20) for 10 times
for j = 1:1
    CVO = cvpartition(class,'Holdout',0.2);
    err = zeros(CVO.NumTestSets,1);
    for i = 1:CVO.NumTestSets
        trIdx = CVO.training(i);
        teIdx = CVO.test(i);
        %ytest = classify(features(teIdx,:),features(trIdx,:),class(trIdx,:),'quadratic');
        ytest = KNN(features(trIdx,:),features(teIdx,:),class(trIdx,:),I);
        %err(i) = sum(~strcmp(ytest,class(teIdx)));
        sama(i) = sum(ytest == class(teIdx));
    end
    Accuracy(j) = (sum(sama)/sum(CVO.TestSize))*100;
end
AccuracyAVG8020 = mean(Accuracy);

btest = ClasstoBinary(ytest);
bclass = ClasstoBinary(class(teIdx));
figure(105)
plotconfusion(btest,bclass)

%% plot KNN
figure(106)
plot(Acc6040,'r-d')
hold on
plot(Acc7030,'g-*')
plot(Acc8020,'b-^')
hold off



