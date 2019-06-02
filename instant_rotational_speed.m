Sr = 20e3;    %Sample rate ������
Sc = 2;       %Signal channel �����ź�������ͨ��
Sbr = 12;      %signal begin row ��ȥ��ͷ���źſ�ʼ������
list_K = [];
%����
Sd = csvread('signal_data.csv', Sbr, 1);
PSd = Sd(:,1);
%�б�
for i=1:(length(PSd)-1)
    if PSd(i)-PSd(i+1) < -2.43
        %ȡ�Ǳ�
        list_K = [list_K, i+1];
    end
end
list_K = list_K / 20000;
%������ʱ��
diff_K = diff(list_K);
%����˲ʱת��
diff_K = 1./diff_K;
%��ͼ
x=(list_K(1:(length(list_K)-1))+list_K(2:length(list_K)))/2
plot(x,diff_K)
xlabel('Time/s')
ylabel('Speed/(rad/s)')
title('Speed plot')