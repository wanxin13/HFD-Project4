function [] = plot1D(Ju,Ju2,J,betaJ,stockname)

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

for i= 1:J
    Ju_m(i,1) = Ju(i,1);
end
Ju_m(J+1,1) = 1.3*min(Ju);
Ju_m(J+2,1) = 1.3*max(Ju);

a = plot(Ju, Ju2,'b.');
hold on 
b = plot(Ju_m, betaJ*Ju_m, 'red');

%datetick('x','yyyy');
box off; grid on;
ylabel('Stock Returns')
xlabel('Market Jump Returns');
title(strcat('Stock ',stockname, ' Returns at Jump Times'));
legend('Stock Returns','Regression Line');
%print(f,'-dpng','-r200','figures/1B');
%close(f);