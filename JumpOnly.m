function [Ju] = JumpOnly(J,rd,tp,ip,n)

% only save jumps, disgard the rest
Ju = zeros(J,1);

for j = 1:J
    Ju(j,1) = rd((tp(j,1)-1)*n+ip(j,1),1);
end
