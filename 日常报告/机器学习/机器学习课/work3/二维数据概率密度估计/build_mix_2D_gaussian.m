function [X,N] = build_mix_2D_gaussian( u_c,covar_c,p_c,N_c)
M = length(p_c);                  % the number of gaussians
p_c = round( p_c / sum(p_c) * N_c );  % number of samples for each gaussian
N = sum( p_c );                   % total number of samples
X = zeros(N,2);                   % initialize output samples 2D vector
idx = 1; 
for m = 1:M
    if (idx>1)
        span = sum(p_c(1:idx-1)+1):sum(p_c(1:idx));
    else
        span = 1:p_c(1);
    end
    X(span,:) = mvnrnd( u_c(:,idx),covar_c(:,:,idx),length( span ) );
    idx = idx + 1;
end
