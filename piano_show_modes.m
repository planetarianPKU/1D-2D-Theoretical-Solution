%鬼畜时刻
L=1;%弦的长度
a=1;%和弦密度、两端张力有关的量
c=0.2*L;%施加初速度的位置
%生成图窗
figure();set(gcf,'unit','normalized','position',[0,0,1,1],'color','w');
%计算
x=0:0.01:L;
for t=0:1e-2:10
    u=0;
    sgtitle(['time = ' num2str(t) ' s']);
for n = 1:10%画每个mode
    un=n^(-2)*sin(n*pi/L*c)*sin(n*pi/L*a*t)*sin(n*pi/L*x);
    subplot(5,2,n)
     plot(x,un,'LineWidth',3,'color','black');ylim(1.1*[-n^-2 n^-2]);
     title(['mode ' num2str(n)]);
end
    pause(1e-3);clf;disp(t)
end