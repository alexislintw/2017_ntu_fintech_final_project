file='SPY.csv';
fprintf('Reading %s...\n', file);
spyTable=readtable(file);
s1=table2struct(spyTable);
fprintf('%d\n',length(s1));
e1=s1(end);
z1=s1(1:end-1);
