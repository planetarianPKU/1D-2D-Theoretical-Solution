clear all;
keynum=40;%琴键编号
f = 440 * (2^( (keynum-49)/12 ));%十二平均律生成的频率
L=1;%弦的长度
a=2*L*f;%和弦密度、两端张力有关的量
c=0.2*L;%施加初速度的位置
FS=11025;%音频采样率
%生成图窗
figure();set(gcf,'unit','normalized','position',[0,0,1,1],'color','w');
%计算
u_sum=0;
for x = 0:L/20:L
t=0:1/FS:5;%持续五秒
u=0;un=0;
for n = 1:10%叠加10个mode
    un=n^(-2)*sin(n*pi/L*c)*sin(n*pi/L*a*t)*sin(n*pi/L*x);u=u+un;
end
u_sum=u_sum+u;
end
u_win=u.*exp(-1*t);%模拟琴弦的指数衰减
u_sum_win=u_sum.*exp(-1*t);
subplot(2,1,1)
plot(t,u_sum);title(['origin wave']);xlabel('s');ylabel('displacement');
subplot(2,1,2)
plot(t,u_sum_win);title(['filtered wave']);xlabel('s');ylabel('displacement');
%sound(u,FS);