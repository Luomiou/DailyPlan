clc;clear;
u1=[3 2];
u2=[5 4];%设定实验数据均值
u3=[2 5];
u=[u1 u2 u3];        
covar1=[1 -1; -1 2];
covar2=[1 -1; -1 7];
covar3=[0.5 0.5; 0.5 3];
%% 
x=-2:0.5:8;
y=-2:0.5:8;

[x,y]=meshgrid(x,y);
xy=[x(:) y(:)];

p1=mvnpdf(xy,u1,covar1);
p2=mvnpdf(xy,u2,covar2);
p3=mvnpdf(xy,u3,covar3);

f1=reshape(p1,size(x));
f2=reshape(p2,size(x));
f3=reshape(p3,size(x));

subplot(2,1,1);
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);%caxis 颜色映射
a=ones(20,20);
a=8*a    %设置为red
surfc(x,y,f1,a);
hold on;
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);
b=ones(20,20);
b=5*b    %设置为green
surfc(x,y,f2',b);
hold on;
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);
c=ones(20,20);
c=1.5*c   %设置为blue
surfc(x,y,f3,c);

subplot(2,1,2);
contour(x,y,f1,'r');
hold on;
contour(x,y,f2,'g');
hold on;
contour(x,y,f3,'b');
hold on;

g1='-0.5*(2*(x-3)^2+2*(x-3)*(y-2)+(y-2)^2)-(-0.5*(1.1667*(x-5)^2+2*0.1667*(x-5)*(y-4)+0.1667*(y-4)^2)-0.5*log10(6))';
g2= '-0.5*(2*(x-3)^2+2*(x-3)*(y-2)+(y-2)^2)-(-0.5*(2.4*(x-2)^2-0.8*(x-2)*(y-5)+0.4*(y-5)^2)-0.5*log10(1.25))';
g3= '-0.5*(1.1667*(x-5)^2+2*0.1667*(x-5)*(y-4)+0.1667*(y-4)^2)-0.5*log10(6)-(-0.5*(2.4*(x-2)^2-0.8*(x-2)*(y-5)+0.4*(y-5)^2)-0.5*log10(1.25))';
a=ezplot(g1,[3.1665  8  1 3.9958]);
hold on;
b=ezplot(g2,[1 3.1665  1 3.9958]);
hold on;
c=ezplot(g3,[3.1665  8  3.9958 8]);
hold on;