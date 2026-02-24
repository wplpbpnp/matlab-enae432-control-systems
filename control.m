function u = control(yd,y)
    persistent x A B C D
    if isempty(x)
        A = [2.478260869565217  -2.024574669187145   0.546313799621928;
             1.000000000000000                   0                   0;
             0   1.000000000000000                   0]; % square
        B = [8;
            0;
            0]; % column
        C = [-1.179829071463796   2.197140807190511  -1.017309372777756]; % row
        D = [19.188565689981097]; % scalar
        x = zeros(size(A,1),1);
    end
    
    e = yd - y;
    u = C*x + D*e;
    x = A*x + B*e;
end