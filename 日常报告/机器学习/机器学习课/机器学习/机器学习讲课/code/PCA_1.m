%data�Ǵ������ݣ�kΪѡȡǰk�������ɷ�
%FinalData�ǽ�ά��õ�������
function [FinalData] = PCA_1(data,k)

[m,n] = size(data);%%��������data
sig=cov(data);%Э�������
[E,D] = eig(sig);%Э������������ֵ����������D�ĶԽ���������ֵ��E��D��Ӧ����������
eigenvalues = flipud(sort(diag(D)));%����ֵ�Ӵ� -> С����
eigenvector=fliplr(E);%�����������Ӵ� -> С����
FinalData = data*eigenvector(:,1:k);%nά������ѡȡǰk������
end