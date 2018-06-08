clc;clear;
u1=[3 2]';
u2=[7 4]';%�趨ʵ�����ݾ�ֵ
u3=[2 5]';
covar=[2 0; 0 2];
% linspace(x0,x1,n)
% ����n������ǵ����Ŀ�����ֳ�n-1�ȷ֡�
% ����Ӧ����(x1-x0)/(n-1)
xx=linspace(-2,10,50);
yy=linspace(-2,8,50);
[x,y]=meshgrid(xx,yy);  %������������;meshigrid��x��y���������ǲ���һ��������xΪ�У�����yΪ�еľ���
xy=[x(:) y(:)]; 
p=mvnpdf(xy,u1',covar);%��ȡ��һ���Ԫ��̬�ֲ������ܶ�
p1=reshape(p,50,[]);  %����任,p�Ǵ�����ľ��󣬺����������ά��ά�� 

subplot(2,1,1);
v=[0 10];   %����ɫ��������ֳ�ʮ�ȷ�
caxis(v);%caxis ��ɫӳ��
a=ones(50,50);
a=8*a;    %����Ϊred
surf(x,y,p1,a);
axis([-2 10 -2 8 0 0.08]);%xyz�����귶Χ
xlabel('x');
ylabel('y');
hold on
p=mvnpdf(xy,u2',covar);%��ȡ�ڶ����Ԫ��̬�ֲ������ܶ�
p2=reshape(p,50,[]);   %����任 
v=[0 10];   %����ɫ��������ֳ�ʮ�ȷ�
caxis(v);
b=ones(50,50);
b=5*b    %����Ϊgreen
surf(x,y,p2,b);
hold on
p=mvnpdf(xy,u3',covar);%��ȡ�������Ԫ��̬�ֲ������ܶ�
p3=reshape(p,50,[]);  %����任 
v=[0 10];   %����ɫ��������ֳ�ʮ�ȷ�
caxis(v);
c=ones(50,50);
c=1.5*c; %����Ϊblue
surf(x,y,p3,c);
               %colorbar;
hold on

subplot(2,1,2);
contour(x,y,p1,'r');   %����ά�ȸ���
hold on
contour(x,y,p2,'g');
hold on
contour(x,y,p3,'b');
hold on
ezplot('-1/4*((8*x+4*y)-52)',[31/7 10 -4 29/7]);%������
hold on;
ezplot('-1/4*((-10*x+2*y)+36)',[31/7 10 29/7 12]);
hold on;
ezplot('-1/4*((-2*x+6*y)-16)',[-4 31/7 -4 29/7]);


