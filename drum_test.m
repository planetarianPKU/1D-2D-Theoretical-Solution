%鬼畜时刻
L=1;%弦的长度
a=1;%和弦密度、两端张力有关的量
x0=0.2*L;y0=0.4*L;%施加初速度的位置
figure();set(gcf,'unit','normalized','position',[0,0,1,1],'color','w');%生成图窗
x=0:0.01:L;y=0:0.01:L;
[X,Y]=meshgrid(x,y);%生成二维网格
for t=0:1e-2:10
    u=0;umn=0;
    for n = 1:10
        for m = 1:10
            omega=sqrt(m^2+n^2)*pi*a/L;%当前mode的频率
            umn=(m*n*omega)^-1*sin(n*pi/L*x0)*sin(m*pi/L*y0)*sin(omega*t).*sin(n*pi/L*X).*sin(m*pi/L*Y);
            u=u+umn;
        end
    end
    mesh(X,Y,u);zlim([-0.2 0.2]);colorbar;caxis([-0.16 0.16]);title(['time = ' num2str(t) ' s']);xlabel('x');ylabel('y');pause(1e-6);clf;
end