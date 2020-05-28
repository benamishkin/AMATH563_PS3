for k=1:38
out=kmeans(xtrain,38);
A=reshape(out,40,38); %each column a face
cluster_strength=zeros(1,38);
for j=1:38
    [m,F]=mode(A(:,j));
    cluster_strength(j)=100*F/40;
end
k
mean(cluster_strength)
end