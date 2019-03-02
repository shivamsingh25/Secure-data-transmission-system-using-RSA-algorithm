%% Function to Calculate and Assign Values using p and q
%     Calculates Phi, n, d (used for decryption/ private key) , e (used for encryption/ public key)
function [n,Phi,d,e] = intialize(p,q)
clc;
disp('Intaializing:');
n=p*q;
Phi=(p-1)*(q-1);
%Calculate the value of e
x=2;e=1;
while x > 1
    e=e+1;
    x=gcd(Phi,e);
end
%Calculate the value of d
i=1;
r=1;
while r > 0
    k=(Phi*i)+1;
    r=rem(k,e);
    i=i+1;
end
d=k/e;
clc;
disp(['The value of (N) is: ' num2str(n)]);
disp(['The public key (e) is: ' num2str(e)]);
disp(['The value of (Phi) is: ' num2str(Phi)]);
disp(['The private key (d) is: ' num2str(d)]);
end