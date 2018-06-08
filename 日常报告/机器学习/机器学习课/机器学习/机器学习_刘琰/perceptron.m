clear;
clc;
A(:,1)=normrnd(10,5,500,1);
A(:,2)=normrnd(35,5,500,1);
A(1:500,3)=ones(500,1);
B(:,1)=normrnd(35,5,500,1);
B(:,2)=normrnd(10,5,500,1);
B(1:500,3)=-ones(500,1);
C(1:500,:)=A;
C(501:1000,:)=B;
figure(1);
plot(A(:,1),A(:,2),'r*',B(:,1),B(:,2),'b.');
title('正负类散点分布图');
xlabel('特征1');
ylabel('特征2');
figure(2);
plot(A(:,1),A(:,2),'r*',B(:,1),B(:,2),'b.');
title('正负类散点分布图');
xlabel('特征1');
ylabel('特征2');
w1=0;
w2=0;
b=0;
i=0;
while i<1000
    for i=1:1000
        if C(i,3)*(w1*C(i,1)+w2*C(i,2)+b)<=0
            w1=w1+0.5*C(i,3)*C(i,1);
            w2=w2+0.5*C(i,3)*C(i,2);
            b=b+0.5*C(i,2);
            break;
        end
    end
end
x=0:60;
y=-(w1*x+b)/w2;
hold on
plot(x,y);
disp(['w1=',num2str(w1),'  w2=',num2str(w2),'   b=',num2str(b)]);
disp(['直线方程为y=',num2str(-w1/w2),'x+',num2str(-b/w2)]);
