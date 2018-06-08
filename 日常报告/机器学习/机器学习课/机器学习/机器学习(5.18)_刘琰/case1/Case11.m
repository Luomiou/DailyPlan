u1=[3 2];
u2=[7 4];%设定每类数据均值
u3=[2 5];
covar=[2 0;0 2];%协方差矩阵
x=-2:0.5:8;
y=-2:0.5:8;
[x,y]=meshgrid(x,y);
xy=[x(:) y(:)];
% 求出类概率密度函数
p1=mvnpdf(xy,u1,covar);
p2=mvnpdf(xy,u2,covar);
p3=mvnpdf(xy,u3,covar);

f1=reshape(p1,size(x));
f2=reshape(p2,size(x));
f3=reshape(p3,size(x));

subplot(2,1,1);
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);   %caxis 颜色映射指定最大值与最小值设置颜色范围
a=ones(21,21);
a=8*a;   %设置为red
surfc(x,y,f1,a);

hold on;
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);
b=ones(20,20);
b=5*b;    %设置为green
surfc(x,y,f2',b);
hold on;
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);
c=ones(20,20);
c=1.5*c;   %设置为blue
surfc(x,y,f3,c);

subplot(2,1,2);
%画等高线
contour(x,y,f1,'r');
hold on;
contour(x,y,f2,'g');
hold on;
contour(x,y,f3,'b');
hold on;
ezplot('-1/4*((8*x+4*y)-52)',[31/7 10 -4 29/7]);%决策线
hold on;
ezplot('-1/4*((-10*x+2*y)+36)',[31/7 10 29/7 12]);
hold on;
ezplot('-1/4*((-2*x+6*y)-16)',[-4 31/7 -4 29/7]);