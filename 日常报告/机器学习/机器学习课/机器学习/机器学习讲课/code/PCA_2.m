function [FinalData] = PCA_2(data,c_rate)

[m,n] = size(data);%%��������data
sig=cov(data);%Э�������
[E,D] = eig(sig);%Э������������ֵ����������D�ĶԽ���������ֵ��E��D��Ӧ����������
eigenvalues = flipud(sort(diag(D)));%����ֵ�Ӵ� -> С����

%%%%%%%%%%%%���������ֵռ����ı��أ�Ҳ��������ֵ�Ĺ�����
    summ=0;
    n=0;
for i=1:length(eigenvalues)  
    latent(i)=eigenvalues(i)./sum(eigenvalues);
    summ=summ+ latent(i);
    if(summ<=c_rate)
        n=n+1;
    end    
end   
eigenvector=fliplr(E);%�����������Ӵ� -> С����
FinalData = data*eigenvector(:,1:n);%nά������ѡȡǰk������
end


    