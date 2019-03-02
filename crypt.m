%% Function to perform cryptography operations - Encryption and Decryption using Keys 
%     { Public for Encryption, Private for Decryption }
function mc = crypt(M,N,e)
e=decimaltobinary(e);
k = 65535;
c  = M;
cf = 1;
cf=mod(c*cf,N);
for i=k-1:-1:1
    c = mod(c*c,N);
    j=k-i+1;
     if e(j)==1
         cf=mod(c*cf,N);
     end
end
mc=cf;
end

%% Function to convert Decimal into Binary to Carry out Encryption Decryption mathematical operations
function a = decimaltobinary(d)
i=1;
a=zeros(1,65535);
while d >= 2
    r=rem(d,2);
    if r==1
        a(i)=1;
    else
        a(i)=0;
    end
    i=i+1;
    d=floor(d/2);
end
if d == 2
    a(i) = 0;
else
    a(i) = 1;
end
x=[a(16) a(15) a(14) a(13) a(12) a(11) a(10) a(9) a(8) a(7) a(6) a(5) a(4) a(3) a(2) a(1)];
end