function [xRot,xPCAwhite,xZCAwhite]=ZCA(x)
epsilon=0.01;

x=double(x);
avg=mean(x(:));

x=x-avg;
sigma=x*x'/size(x,2);
[U,S,V] = svd(sigma);
xRot=U'*x;
xPCAwhite = diag(1./sqrt(diag(S) + epsilon)) * U' * x;
xZCAwhite = U * diag(1./sqrt(diag(S) + epsilon)) * U' * x;


