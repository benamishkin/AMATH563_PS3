clear all; close all; clc

P = '/Users/BenMishkin/Documents/MATLAB/AMATH563/PS3/yalefaces';
D = dir(fullfile(P,'subject*'));
C = cell(size(D));
face = zeros(243, 320, numel(C), 'int16');
facevec=zeros(77760, numel(C), 'int16');
for k = 1:numel(D)
    C{k} = imread(fullfile(P,D(k).name));
    face(:,:,k) = int16(C{k,1});
    A=face(:,:,k);
    facevec(:,k)=A(:);
end



      %face39Ar=face;
      faceUVc=facevec;

clear C D face K P k A facevec
save('faceunc.mat');
