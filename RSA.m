%% MATLAB code by : Shivam Singh
% Discrete Mathematics Project on 
% Secure data transmission system using cryptography
% using RSA algorithm
% RSA = Ron Rivest, Adi Shamir, and Leonard Adleman 
% Start Date: 02.01.2019 

% Prerequisite Declarations

clear all;
close all;
clc;
status=0;


% Information to be used while Splitting two ends : Tx and Rx
% Tx: e, n, phi(n) message(plain text - original)
% Rx: Cipher Text, d, n

disp('Cryptography using RSA Algorithm');

%% Connected Arduino Board port
% arduino=serial('COM6'); 
% fprintf(arduino,char(cipher));


%% Necessary Inputs: 


while status == 0
    disp(' ');
    disp('Please Enter a Prime Number for p,');
    p = input('Enter the value of p: ');
    status = isprime(p);
end

status=0;

while status == 0
    disp(' ');
    disp('Please Enter a Prime Number for q,');
    q = input('Enter the value of q: ');
    status = isprime(q);
end

%% Calculation of Public and Private Keys

[n,Phi,d,e] = intialize(p,q);

disp(['The Value of p: ',num2str(p)]);
disp(['The Value of q: ',num2str(q)]);

M = input('\nEnter the message: ','s');

x=length(M);  %Size of Entered Message



%% Convert Message/ plain text into ASCII code for mathematical operations
%     in order to carry out encryption and decryption

c=0;

for j= 1:x
    for i=0:122
        if strcmp(M(j),char(i))
            c(j)=i;
        end
    end
end

disp('ASCII Code of the entered Message:');
disp(c); 


%% Transmission (Encryption) END;

for j= 1:x
   cipher(j)= crypt(c(j),n,e); 
end
disp('Encrypted Message/ Cipher Text of the entered Message:');
disp(cipher);

%% Receiver (Decryption) END;

for j= 1:x
   message(j)= crypt(cipher(j),n,d); 
end
disp('Decrypted ASCII code of Message:');
disp(message);
disp(['Decrypted Message: ' message]);


%% function to check that input numbers p and q are prime numbers

function result = isprime(number)
result=true;
%% check if number is a nonnegative integer
if floor(number)~=number || number<0
    result=false;
    return
end
%% check if number can be divided by another integer
for k=2:(number/2)
    if rem(number,k)==0
        result=false;
        return
    end
end
end


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
