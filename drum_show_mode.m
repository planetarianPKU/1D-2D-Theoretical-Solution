clear all
%鬼畜时刻
L=1;%弦的长度
a=1;%和弦密度、两端张力有关的量
x0=0.5*L;y0=0.5*L;%施加初速度的位置
figure();set(gcf,'unit','normalized','position',[0,0,1,1],'color','w');%生成图窗
x=0:0.01:L;y=0:0.01:L;
[X,Y]=meshgrid(x,y);%生成二维网格
v = VideoWriter('drum.avi');
open(v);
for t=0:1e-2:10
        sgtitle(['time = ' num2str(t) ' s']);
    index=0;
    for n = 1:3
        for m = 1:3
            index=index+1;
            omega=sqrt(m^2+n^2)*pi*a/L;%当前mode的频率
            umn=(m*n*omega)^-1*sin(n*pi/L*x0)*sin(m*pi/L*y0)*sin(omega*t).*sin(n*pi/L*X).*sin(m*pi/L*Y);
            subplot(3,3,index)
            A=1.1*abs((m*n*omega)^-1);
            mesh(X,Y,umn);zlim([-A A]);colorbar;caxis([-A A]);xlabel('x');ylabel('y');
            title(['n = ' num2str(n) ' m = ' num2str(m)]);
        end
    end
       frame = getframe(gcf);

       writeVideo(v,frame);
    pause(1e-5);clf;
end
close(v);
