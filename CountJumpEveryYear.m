function [av,cy] = CountJumpEveryYear(count,J,rd,tp,ip,n)

% Count jumps every year and calaculate average magnitude of the jumps
% every year.

k = 1;
cy = zeros(11,1);
s = zeros(11,1);
av = zeros(11,1);

for y = 2007 :2017
    for i = 1:J
        if count(i,1) == y
           s(k,1) = s(k,1) + abs(rd( (tp(i,1)-1)*n+ip(i,1),1));
           cy(k,1) = cy(k,1) +1;
        end
    end
    av(k,1) = s(k,1)/cy(k,1);
    k = k+1;
end
        