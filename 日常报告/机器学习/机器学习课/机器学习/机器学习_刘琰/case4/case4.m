u1=[3 2];
u2=[5 4];
u3=[2 5];
covar1=[0.5 0;0 0.5];
covar2=[1 0;0 1];
covar3=[2 0;0 2];

x=-2:0.5:8;
y=-2:0.5:8;

[x,y]=meshgrid(x,y);
xy=[x(:) y(:)]

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

ezplot('(0.25*(x^2+y^2)-3.5*x-3*y+69/4-log(1/2))',[-2 8 -2 8]);
hold on;
ezplot('(0.5*(x^2+y^2)+x-6*y-41/2+29-log(2))',[-2 8 -2 8]);
hold on;
ezplot('(0.75*(x^2+y^2)-2.5*x-9*y+103/4+log(2)-log(1/2))',[-2 8 -2 8]);

hold on



