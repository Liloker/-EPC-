function fun
clear,clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.3.2 计算各因素权重
%一级风险因素判断矩阵A_原始数据------表4-2 一级风险因素的两两对比结果
disp('一级风险因素判断矩阵A_原始数据')
A=[ 1,1/2,1/7,1/3,1/5;
    2,  1,1/5,1/2,1/3;
    7,  5,	1,	3,	2;
    3,	2,1/3,	1,1/2;
    5,	3,1/2,	2,	1;]
%归一化处理得到A*,用A_x表示
for j=1:5
    for i=1:5
        A_x(i,j)=A(i,j)/sum(A(:,j));
    end
end
disp('归一化处理得到A*结果,用A_x表示')
A_x
%对A*中各行要素求平均数，得最大特征根对应的归一化向量w
disp('最大特征根对应的归一化向量')
w=mean(A_x,2)
%根据A×W得出的向量中的元素进行求和，得到最大特征根lamda_max
disp('最大特征根')
lamda_max=sum(A*w)
%一致性检验
disp('一致性检验')
%表2-2 平均随机一致性检验指标
n=3:9;
RI=[0.58	0.9	1.12	1.24	1.32	0.41	1.45];
for n=3:9
    disp(['当n=',num2str(n),'时：'])
    CI=(lamda_max-n)/(n-1);
    CR=CI/RI(n-2);
    if CR<0.1
        disp(['CR=',num2str(CR),'<0.1 判断矩阵A通过了一致性检验，其通过归一化处理获得的向量即为权重向量'])
    else
        disp(['CR=',num2str(CR),'>0.1 矩阵没有通过一致性检验，说明矩阵的科学性存在问题，需要重新进行打分。'])
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%对各二级风险指标进行计算
%disp('二级风险因素判断矩阵_原始数据')
%自然风险U1,经济风险U2,合同风险U3,技术风险U4,管理风险U5
U1=[1,3,2;1/3,1,1/2;1/2,2,1;];
U2=[1,3,5;1/3,1,3;1/5,1/3,1;];
U3=[1,2,3;1/2,1,2;1/3,1/2,1;];
U4=[1,7,3,5;1/7,1,1/5,1/3;1/3,5,1,3;1/5,3,1/3,1;];
U5=[1,1/2,4,3;2,1,7,5;1/4,1/7,1,1/2;1/3,1/5,2,1;];
%归一化处理得到A*,用Ui_A_x表示
disp('下面对5个二级风险因素进行相同处理：')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('自然风险U1：')
for j=1:3
    for i=1:3
        U1_A_x(i,j)=U1(i,j)/sum(U1(:,j));
    end
end
disp('归一化处理得到')
U1_A_x
%对A*中各行要素求平均数，得最大特征根对应的归一化向量w1
disp('最大特征根对应的归一化向量')
w1=mean(U1_A_x,2)
%根据A×W得出的向量中的元素进行求和，得到最大特征根lamda_max
disp('最大特征根')
U1_lamda_max=sum(U1*w1)
%一致性检验
disp('一致性检验')
%表2-2 平均随机一致性检验指标
n=3:9;
RI=[0.58	0.9	1.12	1.24	1.32	0.41	1.45];
for n=3:9
    disp(['当n=',num2str(n),'时：'])
    CI=(U1_lamda_max-n)/(n-1);                                                %%%%%%%%
    CR=CI/RI(n-2);
    if CR<0.1
        disp(['CR=',num2str(CR),'<0.1 判断矩阵A通过了一致性检验，其通过归一化处理获得的向量即为权重向量'])
    else
        disp(['CR=',num2str(CR),'>0.1 矩阵没有通过一致性检验，说明矩阵的科学性存在问题，需要重新进行打分。'])
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('经济风险U2：')
for j=1:3
    for i=1:3
        U2_A_x(i,j)=U2(i,j)/sum(U2(:,j));                                   %%%%%
    end
end
disp('归一化处理得到')
U2_A_x                                                                     %%%%%
%对A*中各行要素求平均数，得最大特征根对应的归一化向量w1
disp('最大特征根对应的归一化向量')
w2=mean(U2_A_x,2)                                                           %%%%%
%根据A×W得出的向量中的元素进行求和，得到最大特征根lamda_max
disp('最大特征根')
U2_lamda_max=sum(U2*w2)                                                     %%%%%
%一致性检验
disp('一致性检验')
%表2-2 平均随机一致性检验指标
n=3:9;
RI=[0.58	0.9	1.12	1.24	1.32	0.41	1.45];
for n=3:9
    disp(['当n=',num2str(n),'时：'])
    CI=(U2_lamda_max-n)/(n-1);                                              %%%%%
    CR=CI/RI(n-2);
    if CR<0.1
        disp(['CR=',num2str(CR),'<0.1 判断矩阵A通过了一致性检验，其通过归一化处理获得的向量即为权重向量'])
    else
        disp(['CR=',num2str(CR),'>0.1 矩阵没有通过一致性检验，说明矩阵的科学性存在问题，需要重新进行打分。'])
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('合同风险U3：')
for j=1:3
    for i=1:3
        U3_A_x(i,j)=U3(i,j)/sum(U3(:,j));                                   %%%%%
    end
end
disp('归一化处理得到')
U3_A_x                                                                     %%%%%
%对A*中各行要素求平均数，得最大特征根对应的归一化向量w1
disp('最大特征根对应的归一化向量')
w3=mean(U3_A_x,2)                                                           %%%%%
%根据A×W得出的向量中的元素进行求和，得到最大特征根lamda_max
disp('最大特征根')
U3_lamda_max=sum(U3*w3)                                                     %%%%%
%一致性检验
disp('一致性检验')
%表2-2 平均随机一致性检验指标
n=3:9;
RI=[0.58	0.9	1.12	1.24	1.32	0.41	1.45];
for n=3:9
    disp(['当n=',num2str(n),'时：'])
    CI=(U3_lamda_max-n)/(n-1);                                              %%%%%
    CR=CI/RI(n-2);
    if CR<0.1
        disp(['CR=',num2str(CR),'<0.1 判断矩阵A通过了一致性检验，其通过归一化处理获得的向量即为权重向量'])
    else
        disp(['CR=',num2str(CR),'>0.1 矩阵没有通过一致性检验，说明矩阵的科学性存在问题，需要重新进行打分。'])
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('技术风险U4：')
for j=1:4
    for i=1:4
        U4_A_x(i,j)=U4(i,j)/sum(U4(:,j));                                   %%%%%
    end
end
disp('归一化处理得到')
U4_A_x                                                                     %%%%%
%对A*中各行要素求平均数，得最大特征根对应的归一化向量w1
disp('最大特征根对应的归一化向量')
w4=mean(U4_A_x,2)                                                           %%%%%
%根据A×W得出的向量中的元素进行求和，得到最大特征根lamda_max
disp('最大特征根')
U4_lamda_max=sum(U4*w4)                                                     %%%%%
%一致性检验
disp('一致性检验')
%表2-2 平均随机一致性检验指标
n=3:9;
RI=[0.58	0.9	1.12	1.24	1.32	0.41	1.45];
for n=3:9
    disp(['当n=',num2str(n),'时：'])
    CI=(U4_lamda_max-n)/(n-1);                                              %%%%%
    CR=CI/RI(n-2);
    if CR<0.1
        disp(['CR=',num2str(CR),'<0.1 判断矩阵A通过了一致性检验，其通过归一化处理获得的向量即为权重向量'])
    else
        disp(['CR=',num2str(CR),'>0.1 矩阵没有通过一致性检验，说明矩阵的科学性存在问题，需要重新进行打分。'])
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('管理风险U5：')
for j=1:4
    for i=1:4
        U5_A_x(i,j)=U5(i,j)/sum(U5(:,j));                                   %%%%%
    end
end
disp('归一化处理得到')
U5_A_x                                                                     %%%%%
%对A*中各行要素求平均数，得最大特征根对应的归一化向量w1
disp('最大特征根对应的归一化向量')
w5=mean(U5_A_x,2)                                                           %%%%%
%根据A×W得出的向量中的元素进行求和，得到最大特征根lamda_max
disp('最大特征根')
U5_lamda_max=sum(U5*w5)                                                     %%%%%
%一致性检验
disp('一致性检验')
%表2-2 平均随机一致性检验指标
n=3:9;
RI=[0.58	0.9	1.12	1.24	1.32	0.41	1.45];
for n=3:9
    disp(['当n=',num2str(n),'时：'])
    CI=(U5_lamda_max-n)/(n-1);                                              %%%%%
    CR=CI/RI(n-2);
    if CR<0.1
        disp(['CR=',num2str(CR),'<0.1 判断矩阵A通过了一致性检验，其通过归一化处理获得的向量即为权重向量'])
    else
        disp(['CR=',num2str(CR),'>0.1 矩阵没有通过一致性检验，说明矩阵的科学性存在问题，需要重新进行打分。'])
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.4.1 各子风险综合评价
%表4-10 ZX项目总承包风险评价指标隶属度R_(17*5)
R_ZX = [0,0,0.1,0.6,0.3;
		0,0.1,0.5,0.3,0.1;
		0,0.2,0.6,0.2,0;
		0,0.4,0.2,0.3,0.1;
		0.4,0.2,0.2,0.2,0;
		0.1,0.3,0.6,0,0;
		0.1,0.5,0.3,0.1,0;
		0.2,0.2,0.3,0.2,0.1;
		0.1,0.4,0.3,0.2,0;
		0.1,0,0.6,0.3,0;
		0,0.2,0.7,0.1,0;
		0.1,0.3,0.5,0.1,0;
		0.5,0.4,0.1,0,0;
		0.1,0.6,0.3,0,0;
		0.1,0.4,0.4,0.1,0;
		0,0.3,0.4,0.3,0;
		0.1,0.3,0.4,0.2,0;];
%运用综合评价向量=权重向量×模糊矩阵进行综合评价，得到ZX项目5个风险评价向量分别如下
BU1=w1'*R_ZX(1:3,:)
BU2=w2'*R_ZX(4:6,:)
BU3=w3'*R_ZX(7:9,:)
BU4=w4'*R_ZX(10:13,:)
BU5=w5'*R_ZX(14:17,:)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%4.4.3 总体风险模糊综合评价
R=[BU1;BU2;BU3;BU4;BU5]
BU=w'*R



