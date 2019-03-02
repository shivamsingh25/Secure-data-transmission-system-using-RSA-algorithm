function varargout = RSAGUI_Tx(varargin)
% RSAGUI_Tx MATLAB code for RSAGUI_Tx.fig
%      RSAGUI_Tx, by itself, creates a new RSAGUI_Tx or raises the existing
%      singleton*.
%
%      H = RSAGUI_Tx returns the handle to a new RSAGUI_Tx or the handle to
%      the existing singleton*.
%
%      RSAGUI_Tx('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RSAGUI_Tx.M with the given input arguments.
%
%      RSAGUI_Tx('Property','Value',...) creates a new RSAGUI_Tx or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RSAGUI_Tx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RSAGUI_Tx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RSAGUI_Tx

% Last Modified by GUIDE v2.5 10-Jan-2019 16:25:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RSAGUI_Tx_OpeningFcn, ...
                   'gui_OutputFcn',  @RSAGUI_Tx_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RSAGUI_Tx is made visible.
function RSAGUI_Tx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RSAGUI_Tx (see VARARGIN)

% Choose default command line output for RSAGUI_Tx
handles.output = hObject;
set(handles.pushbutton2,'Enable','off')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RSAGUI_Tx wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RSAGUI_Tx_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.pushbutton1,'Enable','off')
 set(handles.edit1,'Enable','off')
 set(handles.edit2,'Enable','off')
 Str = get(handles.edit1, 'String');
 Num = sscanf(Str, '%g:%g');
 p   = min(Num):max(Num);
 Str1 = get(handles.edit2, 'String');
 Num1 = sscanf(Str1, '%g:%g');
 q   = min(Num1):max(Num1);
 edit3String = get(handles.edit3, 'string');
 disp("Value of p: ");
 disp(p);
 disp("Value of q: ");
 disp(q);
 disp("Entered Message: ");
 disp(edit3String);
 [n,Phi,d,e] = intialize(p,q);
 x=length(edit3String);
 %% Convert Message/ plain text into ASCII code for mathematical operations
%     in order to carry out encryption and decryption
c=0;
for j= 1:x
    for i=0:122
        if strcmp(edit3String(j),char(i))
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
seperater=";";
for j= 1:x
   if(j==x)
       temp=num2str(cipher(j));
       txstring = strcat(txstring,temp);
   else 
    if(j==1)
        txstring=num2str(cipher(j));
        txstring = strcat(txstring,seperater);
    else
        temp=strcat(num2str(cipher(j)),seperater);
        txstring = strcat(txstring,temp);
    end
   end
end
disp('Pass the below Cipher Text to Decoder for decryption:');
disp(txstring);
handles.txstring=txstring;
guidata(hObject,handles)
set(handles.text13, 'String', 'Find Encrypted Message in edit box above.');
set(handles.pushbutton2,'Enable','on')
set(handles.text6,'String','Value of d:')
set(handles.text8,'String',['Original Message: ' edit3String])
set(handles.edit1,'String',d)
set(handles.edit3,'String',txstring)
set(handles.text7,'String','Value of n:')
set(handles.edit2,'String',n)
drawnow;




function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text13, 'String', ["Please Wait. Transmitting Signal. Make Sure the receiver is ON."]);
drawnow;
set(handles.pushbutton2,'Enable','off')
set(handles.pushbutton2,'String','Please Wait...')
if ~isempty(instrfind)   % Close Existing Open Connection
     fclose(instrfind);
      delete(instrfind);
end
myarduino=serial('COM6'); 
txstring=handles.txstring;
set(handles.pushbutton2,'Enable','off')
            disp('Make Sure The Receiver End is Turned ON and is Nearby.');
            pause(2);
            disp('Transmitting Encrypted Message/ Cipher Text');
            dot='.';
            txstring = strcat(txstring,dot);
            fopen(myarduino);
            pause(10);
            fprintf(myarduino,char(txstring));
            pause(10);
            fclose(myarduino); 
            disp("Process Done.");
            set(handles.pushbutton2,'String','Signal Transmitted.')
