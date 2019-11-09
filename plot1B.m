function [] = plot1B(Ju,Ju2,stockname)

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(Ju, Ju2,'b.');
%datetick('x','yyyy');
box off; grid on;
ylabel('Stock Returns')
xlabel('Market Jump Returns');
title(strcat('Stock ',stockname, ' Returns at Jump Times'));
%print(f,'-dpng','-r200','figures/1B');
%close(f);
