function [X,N] = build_mix_1D_gaussian( u_c,covar_c,p_c,N_c)
M  = length(p_c);                      % the number of mixed gaussians
p_c  = round( p_c / sum(p_c) * N_c );  % number of samples for each gaussian
N = sum( p_c );                        % total number of samples
X = zeros(N,1);                        % initialize output samples 1D vector
idx  = 1;                              % counter 高斯分布类别计数器
for m = 1:M
    if (idx>1)
        span = sum(p_c(1:idx-1))+1:sum(p_c(1:idx));   %每类高斯分布样本的起始位置到终止位置
    else
        span = 1:p_c(1);
    end
   X(span,:) = mvnrnd( u_c(:,idx),covar_c(:,:,idx),length( span ) );
    idx       = idx + 1;
end
