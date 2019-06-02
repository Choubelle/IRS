Sr = 20e3;    %Sample rate 采样率
Sc = 2;       %Signal channel 脉冲信号所处的通道
Sbr = 12;      %signal begin row 除去表头后信号开始的行数
list_K = [];
%读数
Sd = csvread('signal_data.csv', Sbr, 1);
PSd = Sd(:,1);
%判别
for i=1:(length(PSd)-1)
    if PSd(i)-PSd(i+1) < -2.43
        %取角标
        list_K = [list_K, i+1];
    end
end
list_K = list_K / 20000;
%算脉冲时间
diff_K = diff(list_K);
%计算瞬时转速
diff_K = 1./diff_K;
%画图
x=(list_K(1:(length(list_K)-1))+list_K(2:length(list_K)))/2
plot(x,diff_K)
xlabel('Time/s')
ylabel('Speed/(rad/s)')
title('Speed plot')