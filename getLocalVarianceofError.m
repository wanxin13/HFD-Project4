function [c]=getLocalVarianceofError(re,kn,t,i,n,r,cut)
% getLocalVarianceError computes the local variance c of regression error at time t, t contains in
% interval t day i interval
%
% INPUTS:
%  rc: diffusive returns
%  kn: window size parameter
%  t: day t
%  i: interval i
%  n: number of returns in a day
%
% OUTPUT:
%  c: local variance estimator
%
c = 0;

if i-kn > 0 && i+kn <78 
    
        for j = i-kn : i+kn
            if abs(r((t-1)*n+j,1)) <= abs(cut((t-1)*n+j,1))
                c = c + re((t-1)*n+j,1)^2;
            end
        end
        c = c/((2*kn+1)/n);
     
elseif i - kn <= 0
      
         count =0; 
         for j = 1 : i+kn
             count = count +1;
             if abs(r((t-1)*n+j,1)) <= abs(cut((t-1)*n+j,1))
                c = c + re((t-1)*n+j,1)^2;
                
             end
         end
         c = c/(count/n);
else
        
            count =0; 
            for j = i-kn : 77
                count = count +1;
                if abs(r((t-1)*n+j,1)) <= abs(cut((t-1)*n+j,1))
                    c = c + re((t-1)*n+j,1)^2;
                    
                end
            end
             c = c/(count/n);
             
end
            