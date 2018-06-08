function y =parzen3d(X,x,h)
n=length(x);
for i=1:n
    m=0;
    for j=1:length(X)
         m=m+inbar3d(X(j,:),x(i,:),h);
    end
    y(i)=m/(length(X)*h*h);
end
