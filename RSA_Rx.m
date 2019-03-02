close all;
clc;
clear all;

%% Close all open Arduino Ports
if ~isempty(instrfind)   % Close Existing Open Connection
     fclose(instrfind);
      delete(instrfind);
end

%% Establish Arduino Rx Connection 

 %p = "128;59;95;50;113;54";  % Test String without hardware
 
  arduino=serial('COM7'); 
  fopen(arduino);
  disp("Please Wait while the Arduino Hardware Setups..!!");
  pause(10);
  disp("Please Wait while we receive Signal from Tx, in order to continue decryption.");
  
  p='';     % empty string 
  
  %% Read Serial Data until received
  while isempty(p)==1 
    p=fscanf(arduino);
  end
  disp("Tx Input Received..!!");
  fclose(arduino);
 disp("The Received String is: ");
 disp(p);
 status=0;
 while status == 0
    choice=input('Do You Want to Decrypt the Cipher Text (y/n): ','s');
    if(choice=="n" || choice=="N") 
       status=1;    % Exit the loop
    else 
        status=1;   %Exit the loop after execution
            rxstring = regexp(p, ';', 'split');
            cipher=str2double(rxstring);    % Convert String into Double for Operations
            x = length(cipher);
            disp("The Obtained Cipher Text is: ");
            disp(cipher);
            %% Input Private Key:
            d = input('Enter the value of Private Key (d): ');
            n = input('Enter the value of n (p*q): ');
             
            for j= 1:x
                message(j)= crypt(cipher(j),n,d); 
            end
            disp('Decrypted ASCII code of Message:');
            disp(message);
            disp(['Decrypted Message: ' message]);

    end
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