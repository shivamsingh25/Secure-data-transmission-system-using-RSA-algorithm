if ~isempty(instrfind)   % Close Existing Open Connection
     fclose(instrfind);
      delete(instrfind);
end
 myarduino=serial('COM7');  

%% Arduino Scan Serial Port
  arduino=serial('COM7'); 
  fopen(arduino);
  pause(10);
  out=fscanf(arduino);
  fclose(arduino); 
 