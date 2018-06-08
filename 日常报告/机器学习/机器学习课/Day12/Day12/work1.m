%狼来了
clc;clear;
p_a_ba_b=0.9;
p_a_ba_b_ba=0.5;
p_b=0.138;
i=0;
while (p_b<0.8)
    p_b_ba=1-p_b;
    i=i+1;
    p_b_a_ba=(p_a_ba_b*p_b)/(p_a_ba_b*p_b+p_a_ba_b_ba*p_b_ba);
    p_b=p_b_a_ba;
    p(i)=p_b;
end
disp(['需要次数为:',num2str(i)]);
disp('每次值分别为：')
disp(p)
