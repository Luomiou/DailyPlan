clear;clc;
d=0;
u1=[0 2]';u2=[5 0]'; %实验数据均值
u=[u1 u2];
covar(:,:,1)=[2 -1;-1 2];
covar(:,:,2)=[2 1;1 4];     %协方差
p_c=[1 1];           %混合数据之间比例
N_c=1000;
k=5;
% 样本总数
[X,N]=build_mix_2D_gaussian(u,covar,p_c,N_c);
xx=linspace(-4,6,100);%线性等分向量
yy=linspace(-4,6,100);
[x,y]=meshgrid(xx,yy);%用于三维曲面的分格线座标
xy=[x(:) y(:)];               
p=0.5*mvnpdf(xy,u1',covar(:,:,1))+0.5*mvnpdf(xy,u2',covar(:,:,2));%联合概率密度
p1=reshape(p,100,[]);%改造再成形
figure(1);
surf(x,y,p1);
xlabel('X1');
ylabel('X2');
zlabel('p(x)');
axis([-4 6 -4 6 0 0.1]);
%直方图概率密度估计
width=0.5;        %样条宽度
[n]= hist3(X,[round((max(X)-min(X))/width)]);   %样条数=(max(X)-min(X))/width，
                                                %n:落在每个bin中样本的个数
pp = n /1000;        %每个bin样本的频率                  
figure(2),
% subplot(2,2,1);
bar3(pp);
hold on;
% plot(X,pp,'g.');

%parzen窗估计
% [X,Y,x1,y1,x2,y2]=make_data(1,sqrt(2),4,1,1000);%生成1000个训练样本
yy1=parzen3d(X,X,0.1);                            %h=0.1  
yy2=parzen3d(X,X,0.3);                            %h=0.3
yy3=parzen3d(X,X,0.5);                            %h=0.5  
plot3(X(:,1),X(:,2),yy1,'g.',X(:,1),X(:,2),yy2,'y.',X(:,1),X(:,2),yy3,'b.');%画图
legend('h = 0.1','h = 0.3','h=0.5');


%平滑核估计

yy1=smooth3d(X,X,0.1);                            %h=0.1  
yy2=smooth3d(X,X,0.3);                            %h=0.3
yy3=smooth3d(X,X,0.5);                            %h=0.5  
plot3(X(:,1),X(:,2),yy1,'g.',X(:,1),X(:,2),yy2,'y.',X(:,1),X(:,2),yy3,'b.');%画图
legend('h = 0.1','h = 0.3','h=0.5');

%  figure(2);
% contour(x,y,p1,'r');
% hold on;
% plot(X(:,1),X(:,2),'g.');
% axis([-5 8 -5 8]);
% xlabel('X1');
% ylabel('X2');
% p=0.5*mvnpdf(xy,u1',1.06*0.4*covar(:,:,1))+0.5*mvnpdf(xy,u2',1.06*0.4*covar(:,:,2));%联合概率密度
% p2=reshape(p,100,[]);%改造再成形
% figure(3);
% surf(x,y,p2);
% xlabel('X1');
% ylabel('X2');
% zlabel('p(x)');
% axis([-4 6 -4 6 0 0.1]);
%  figure(4);
% contour(x,y,p2,'r');
% hold on;
% plot(X(:,1),X(:,2),'g.');
% axis([-5 8 -5 8]);
% xlabel('X1');
% ylabel('X2');





