clear all; close all; clc
load('CroppedSVD.mat');

load('faces_cropped_vector.mat');



%% K-Folds for loop
MMAc=zeros(1,50);
NBAc=zeros(1,50);
LDAAc=zeros(1,50);
SVMAc=zeros(1,50);
DTAc=zeros(1,50);
KNNc=zeros(1,50);
for l=1:50
    rng(l,'twister');
%% Cross validation

%number of features
fnum=2:60;

q59=randperm(59);
q60=randperm(60);
q62=randperm(62);
q63=randperm(63);
q64=randperm(64);

f01=v(1:64,fnum);
f02=v(65:128,fnum);
f03=v(129:192,fnum);
f04=v(193:256,fnum);
f05=v(257:320,fnum);
f06=v(321:384,fnum);
f07=v(385:448,fnum);
f08=v(449:515,fnum);
f09=v(513:576,fnum);
f10=v(577:640,fnum);
f11=v(641:700,fnum);
f12=v(701:759,fnum);
f13=v(760:819,fnum);
f15=v(820:882,fnum);
f16=v(883:944,fnum);
f17=v(945:1007,fnum);
f18=v(1008:1070,fnum);
f19=v(1071:1134,fnum);
f20=v(1135:1198,fnum);
f21=v(1199:1262,fnum);
f22=v(1263:1326,fnum);
f23=v(1327:1390,fnum);
f24=v(1391:1454,fnum);
f25=v(1455:1518,fnum);
f26=v(1519:1582,fnum);
f27=v(1583:1646,fnum);
f28=v(1647:1710,fnum);
f29=v(1711:1774,fnum);
f30=v(1775:1838,fnum);
f31=v(1839:1902,fnum);
f32=v(1903:1966,fnum);
f33=v(1967:2030,fnum);
f34=v(2031:2094,fnum);
f35=v(2095:2158,fnum);
f36=v(2159:2222,fnum);
f37=v(2223:2286,fnum);
f38=v(2287:2350,fnum);
f39=v(2351:2414,fnum);

xtrain=[f01(q64(1:40),:);
f02(q64(1:40),:);
f03(q64(1:40),:);
f04(q64(1:40),:);
f05(q64(1:40),:);
f06(q64(1:40),:);
f07(q64(1:40),:);
f08(q64(1:40),:);
f09(q64(1:40),:);
f10(q64(1:40),:);
f11(q60(1:40),:);
f12(q59(1:40),:);
f13(q60(1:40),:);
f15(q63(1:40),:);
f16(q62(1:40),:);
f17(q63(1:40),:);
f18(q63(1:40),:);
f19(q64(1:40),:);
f20(q64(1:40),:);
f21(q64(1:40),:);
f22(q64(1:40),:);
f23(q64(1:40),:);
f24(q64(1:40),:);
f25(q64(1:40),:);
f26(q64(1:40),:);
f27(q64(1:40),:);
f28(q64(1:40),:);
f29(q64(1:40),:);
f30(q64(1:40),:);
f31(q64(1:40),:);
f32(q64(1:40),:);
f33(q64(1:40),:);
f34(q64(1:40),:);
f35(q64(1:40),:);
f36(q64(1:40),:);
f37(q64(1:40),:);
f38(q64(1:40),:);
f39(q64(1:40),:)];

xtest=[f01(q64(41:end),:);
f02(q64(41:end),:);
f03(q64(41:end),:);
f04(q64(41:end),:);
f05(q64(41:end),:);
f06(q64(41:end),:);
f07(q64(41:end),:);
f08(q64(41:end),:);
f09(q64(41:end),:);
f10(q64(41:end),:);
f11(q60(41:end),:);
f12(q59(41:end),:);
f13(q60(41:end),:);
f15(q63(41:end),:);
f16(q62(41:end),:);
f17(q63(41:end),:);
f18(q63(41:end),:);
f19(q64(41:end),:);
f20(q64(41:end),:);
f21(q64(41:end),:);
f22(q64(41:end),:);
f23(q64(41:end),:);
f24(q64(41:end),:);
f25(q64(41:end),:);
f26(q64(41:end),:);
f27(q64(41:end),:);
f28(q64(41:end),:);
f29(q64(41:end),:);
f30(q64(41:end),:);
f31(q64(41:end),:);
f32(q64(41:end),:);
f33(q64(41:end),:);
f34(q64(41:end),:);
f35(q64(41:end),:);
f36(q64(41:end),:);
f37(q64(41:end),:);
f38(q64(41:end),:);
f39(q64(41:end),:)];


%% Naive Bayes And Training Labels
% Labels
ctrain=ones(40,1);
train_label=[];
for j=1:39
    if j~=14
        train_label=[train_label; j*ctrain];
    end
end

test_label=[];
ctrain59=ones(19,1);
ctrain60=ones(20,1);
ctrain62=ones(22,1);
ctrain63=ones(23,1);
ctrain64=ones(24,1);

for k=1:39
    if k==11
        test_label=[test_label; k*ctrain60];
    elseif k==12
        test_label=[test_label; k*ctrain59];
    elseif k==13
        test_label=[test_label; k*ctrain60];
    elseif k==14
    elseif k==15
         test_label=[test_label; k*ctrain63];
    elseif k==16
         test_label=[test_label; k*ctrain62];
    elseif k==17
         test_label=[test_label; k*ctrain63];
    elseif k==18
         test_label=[test_label; k*ctrain63];
    else
         test_label=[test_label;  k*ctrain64];
    end
end

%% MF Label
for b=1:length(train_label)
    if train_label(b)==5
        train_label(b)=1;
    end
    if train_label(b)==15
        train_label(b)=1;
    end
    if train_label(b)==22
        train_label(b)=1;
    end
    if train_label(b)==27
        train_label(b)=1;
    end
    if train_label(b)==28
        train_label(b)=1;
    end
    if train_label(b)==32
        train_label(b)=1;
    end
    if train_label(b)==34
        train_label(b)=1;
    end
    if train_label(b)==37
        train_label(b)=1;
    end
end

for b=1:length(test_label)
    if test_label(b)==5
        test_label(b)=1;
    end
    if test_label(b)==15
        test_label(b)=1;
    end
    if test_label(b)==22
        test_label(b)=1;
    end
    if test_label(b)==27
        test_label(b)=1;
    end
    if test_label(b)==28
        test_label(b)=1;
    end
    if test_label(b)==32
        test_label(b)=1;
    end
    if test_label(b)==34
        test_label(b)=1;
    end
    if test_label(b)==37
        test_label(b)=1;
    end
end

% Naive Bayes
nb=fitcnb(xtrain, train_label);
preNB=nb.predict(xtest);

%% LDA

preLDA=classify(xtest,xtrain,train_label);
close all

%% SVM

svm=fitcecoc(array2table(xtrain),train_label);
preSVM=predict(svm,xtest);

%% Decison Tree
tree=fitctree(xtrain,train_label);
PreTREE=predict(tree,xtest);

%% KNN
[ind,D]=knnsearch(xtrain,xtest,'k',5);
preKNN=zeros(894,1);
for j=1:894
    index=ind(j,:);
    preKNN(j)=mode(train_label([index]));
end

%% Accuracy Test
MMcor=0;
NBcor=0;
LDAcor=0;
SVMcor=0;
DTcor=0;
KNNcor=0;
for n=1:894

    if preNB(n)==test_label(n)
        NBcor=NBcor+1;
    end
    if preLDA(n)==test_label(n)
        LDAcor=LDAcor+1;
    end
    if preSVM(n)==test_label(n)
        SVMcor=SVMcor+1;
    end
    if PreTREE(n)==test_label(n)
        DTcor=DTcor+1;
    end
    if preKNN(n)==test_label(n)
        KNNcor=KNNcor+1;
    end
end

NBAc(l)=NBcor;
LDAAc(l)=LDAcor;
SVMAc(l)=SVMcor;
DTAc(l)=DTcor;
KNNc(l)=KNNcor;
end
save('2_60_truncation_sex.mat', 'NBAc', 'LDAAc', 'SVMAc', 'DTAc', 'KNNc')