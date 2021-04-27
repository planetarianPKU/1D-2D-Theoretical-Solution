clear all;
keynum=40;%琴键编号
f = 440 * (2^( (keynum-49)/12));%十二平均律生成的频率
L=1;%弦的长度
a=2*L*f;%和弦密度、两端张力有关的量

x0=0.2*L;y0=0.4*L;%施加初速度的位置

%[X,Y]=meshgrid(x,y);%生成二维网格
FS=11025;
t=0:1/FS:10;
u=0;umn=0;
u_sum=0;
for x=0:0.1*L:L
    for y=0:0.1*L:L
        for n = 1:5
            for m = 1:5
                omega=sqrt(m^2+n^2)*pi*a/L;%当前mode的频率
                umn=(m*n*omega)^-1*sin(n*pi/L*x0)*sin(m*pi/L*y0)*sin(omega*t).*sin(n*pi/L*x).*sin(m*pi/L*y);
                u=u+umn;
            end
        end
                u_sum=u_sum+u;
    end
end
