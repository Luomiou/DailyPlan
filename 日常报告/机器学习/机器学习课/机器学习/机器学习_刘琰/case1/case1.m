clc;clear;
u1=[3 2]';
u2=[7 4]';%设定实验数据均值
u3=[2 5]';
covar=[2 0; 0 2];
% linspace(x0,x1,n)
% 其中n代表的是点的数目，即分成n-1等分。
% 步长应当是(x1-x0)/(n-1)
xx=linspace(-2,10,50);
yy=linspace(-2,8,50);
[x,y]=meshgrid(xx,yy);  %产生网格数据;meshigrid（x，y）的作用是产生一个以向量x为行，向量y为列的矩阵
xy=[x(:) y(:)]; 
p=mvnpdf(xy,u1',covar);%求取第一类二元正态分布概率密度
p1=reshape(p,50,[]);  %矩阵变换,p是待重组的矩阵，后面是数组各维的维度 

subplot(2,1,1);
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);%caxis 颜色映射
a=ones(50,50);
a=8*a;    %设置为red
surf(x,y,p1,a);
axis([-2 10 -2 8 0 0.08]);%xyz轴坐标范围
xlabel('x');
ylabel('y');
hold on
p=mvnpdf(xy,u2',covar);%求取第二类二元正态分布概率密度
p2=reshape(p,50,[]);   %矩阵变换 
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);
b=ones(50,50);
b=5*b    %设置为green
surf(x,y,p2,b);
hold on
p=mvnpdf(xy,u3',covar);%求取第三类二元正态分布概率密度
p3=reshape(p,50,[]);  %矩阵变换 
v=[0 10];   %把颜色从蓝到红分成十等分
caxis(v);
c=ones(50,50);
c=1.5*c; %设置为blue
surf(x,y,p3,c);
               %colorbar;
hold on

subplot(2,1,2);
contour(x,y,p1,'r');   %画二维等高线
hold on
contour(x,y,p2,'g');
hold on
contour(x,y,p3,'b');
hold on
ezplot('-1/4*((8*x+4*y)-52)',[31/7 10 -4 29/7]);%决策线
hold on;
ezplot('-1/4*((-10*x+2*y)+36)',[31/7 10 29/7 12]);
hold on;
ezplot('-1/4*((-2*x+6*y)-16)',[-4 31/7 -4 29/7]);


