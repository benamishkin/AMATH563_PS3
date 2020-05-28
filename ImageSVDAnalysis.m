clear all; close all; clc

files=dir('*C.mat');

for j=1:length(files)
    load(files(j).name);
    
end

%% Concatenate Face Vectors

 Faces=[face01Vc face02Vc face03Vc face04Vc face05Vc face06Vc face07Vc face08Vc ...
        face09Vc face10Vc face11Vc face12Vc face13Vc face15Vc face16Vc ...
        face17Vc face18Vc face19Vc face20Vc face21Vc face22Vc face23Vc face24Vc ...
        face25Vc face26Vc face27Vc face28Vc face29Vc face30Vc face31Vc face32Vc ...
        face33Vc face34Vc face35Vc face36Vc face37Vc face38Vc face39Vc];
%% Create Lables

lable64=ones(1,64);
lable60=ones(1,60);
lable59=ones(1,59);
lable63=ones(1,63);
lable62=ones(1,62);

f01l = 1 * lable64;
f02l = 2 * lable64;
f03l = 3 * lable64;
f04l = 4 * lable64;
f05l = 5 * lable64;
f06l = 6 * lable64;
f07l = 7 * lable64;
f08l = 8 * lable64;
f09l = 9 * lable64;
f10l = 10 * lable64;
f11l = 11 * lable60;
f12l = 12 * lable59;
f13l = 13 * lable60;
f15l = 15 * lable63;
f16l = 16 * lable62;
f17l = 17 * lable63;
f18l = 18 * lable63;
f19l = 19 * lable64;
f20l = 20 * lable64;
f21l = 21 * lable64;
f22l = 22 * lable64;
f23l = 23 * lable64;
f24l = 24 * lable64;
f25l = 25 * lable64;
f26l = 26 * lable64;
f27l = 27 * lable64;
f28l = 28 * lable64;
f29l = 29 * lable64;
f30l = 30 * lable64;
f31l = 31 * lable64;
f32l = 32 * lable64;
f33l = 33 * lable64;
f34l = 34 * lable64;
f35l = 35 * lable64;
f36l = 36 * lable64;
f37l = 37 * lable64;
f38l = 38 * lable64;
f39l = 39 * lable64;

labels=[f01l f02l f03l f04l f05l f06l f07l f08l f09l f10l f11l f12l f13l ...
    f15l f16l f17l f18l f19l f20l f21l f22l f23l f24l f25l f26l f27l f28l ...
    f29l f30l f31l f32l f33l f34l f35l f36l f37l f38l f39l]; 

clearvars *Ar
clearvars *Vc
clearvars lable*
clearvars *l
%% SVD
Ft=Faces';
[u, s, v]=svd(double(Faces), 'econ');

save('CroppedSVD.mat', 'u', 's', 'v');
