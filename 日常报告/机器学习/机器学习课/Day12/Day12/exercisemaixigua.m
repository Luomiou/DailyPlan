clc
%A:��һ���򵽺�ȿ��B���ڶ����򵽺�ȿ
n1 = 3;
n2 = 1;
n_AB = factorial(n1)/factorial(n1-2);%factorial����׳�
n = factorial(n1+n2)/factorial(n1+n2-2);
n_A = (factorial(n1)/factorial(n1-1))*(factorial(n1+n2-1)/factorial(n1+n2-1-1));
p_AB = n_AB/n;
p_A = n_A/n;
p_B_A = p_AB/p_A;
disp('��һ���򵽺�ȿ��ǰ���£��ڶ����򵽺�ȿ�ĸ���Ϊ��');
disp(p_B_A)
