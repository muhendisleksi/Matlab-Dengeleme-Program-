clear
clc
NN = str2mat('s23;s24');
NN_split = strsplit(NN, ';');
for i = 1 : 2
  name{i} = sprintf('%s. Point', NN_split{i})
end

