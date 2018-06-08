clc
%A:第一次买到红瓤；B：第二次买到红瓤
n1 = 3;
n2 = 1;
n_AB = factorial(n1)/factorial(n1-2);%factorial是求阶乘
n = factorial(n1+n2)/factorial(n1+n2-2);
n_A = (factorial(n1)/factorial(n1-1))*(factorial(n1+n2-1)/factorial(n1+n2-1-1));
p_AB = n_AB/n;
p_A = n_A/n;
p_B_A = p_AB/p_A;
disp('第一次买到红瓤的前提下，第二次买到红瓤的概率为：');
disp(p_B_A)
