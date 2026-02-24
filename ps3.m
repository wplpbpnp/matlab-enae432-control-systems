q = [10 40 40];
r = [2 8 28 40];

roots(r)

s_array = [-1+3j -1-3j -2 2j -2j -1];
A_array = [0 0 0 0 0 0];

for k=1:6
    s = s_array(k);
    
    i0 = (20*s^2)+(80*s)+80;
    i1 = (s-2j)*(s+2j);
    i2 = (3*s*(s+1)) - i1;
    i3 = i0 * i2;
    
    b1 = (s-(-1+3j));
    b2 = (s-(-1-3j));
    b3 = s+2;
    b4 = s-2j;
    b5 = s+2j;
    b6 = s+1;
    
    b_array = [b1 b2 b3 b4 b5 b6];
    b_array(k) = 1;
    
    A_array(k) = (i3/prod(b_array));
end

s_array
A_array

s_array = [-1+3j -1-3j -2];
B_array = [0 0 0];

for k=1:3
    s = s_array(k);
    
    i0 = (2*s^2)+(10*s)+34;
    
    b1 = (s-(-1+3j));
    b2 = (s-(-1-3j));
    b3 = s+2;
    
    b_array = [b1 b2 b3];
    b_array(k) = 1;
    
    B_array(k) = (i0/prod(b_array));
end

s_array
B_array

s_array = [0 -1+2j -1-2j -2];
C_array = [0 0 0 0];

for k=1:4
    s = s_array(k);
    
    i0 = (6*s^2) + (10*s) + 20;
    
    c1 = s - s_array(1);
    c2 = s - s_array(2);
    c3 = s - s_array(3);
    c4 = s - s_array(4);
    
    c_array = [c1 c2 c3 c4];
    c_array(k) = 1;
    
    C_array(k) = (i0/prod(c_array));
end

s_array
C_array

s_array = [0 -.143+1.73j -.143-1.73j];
D_array = [0 0 0];

for k=1:3
    s = s_array(k);
    
    i0 = (-0.5*s) - 0.043;
    
    d1 = s - s_array(1);
    d2 = s - s_array(2);
    d3 = s - s_array(3);
    
    d_array = [d1 d2 d3];
    d_array(k) = 1;
    
    D_array(k) = (i0/prod(d_array));
end

s_array
D_array