%鬼畜时刻
L=1;%弦的长度
a=1;%和弦密度、两端张力有关的量
c=0.2*L;%施加初速度的位置
%生成图窗
figure();set(gcf,'unit','normalized','position',[0,0,1,1],'color','w');
%计算
x=0:0.001:L;
for t=0:1e-2:10
    u=0;
for n = 1:100
    un=n^(-2)*sin(n*pi/L*c)*sin(n*pi/L*a*t)*sin(n*pi/L*x);
    u=u+un;
end
    plot(x,u,'LineWidth',3,'color','black');ylim([-0.7 0.7]);
    title(['time = ' num2str(t) ' s']);pause(1e-6);clf;
end