function varargout = RSAGUI_Rx(varargin)
% RSAGUI_Rx MATLAB code for RSAGUI_Rx.fig
%      RSAGUI_Rx, by itself, creates a new RSAGUI_Rx or raises the existing
%      singleton*.
%
%      H = RSAGUI_Rx returns the handle to a new RSAGUI_Rx or the handle to
%      the existing singleton*.
%
%      RSAGUI_Rx('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RSAGUI_Rx.M with the given input arguments.
%
%      RSAGUI_Rx('Property','Value',...) creates a new RSAGUI_Rx or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RSAGUI_Rx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RSAGUI_Rx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RSAGUI_Rx

% Last Modified by GUIDE v2.5 10-Jan-2019 23:07:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RSAGUI_Rx_OpeningFcn, ...
                   'gui_OutputFcn',  @RSAGUI_Rx_OutputFcn, ...
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


% --- Executes just before RSAGUI_Rx is made visible.
function RSAGUI_Rx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RSAGUI_Rx (see VARARGIN)

% Choose default command line output for RSAGUI_Rx
handles.output = hObject;
global rxstring;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RSAGUI_Rx wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RSAGUI_Rx_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text13, 'String', ['Waiting for Hardware Response.']);
drawnow;
 set(handles.pushbutton1,'Enable','off')
 set(handles.pushbutton2,'Enable','off')
 set(handles.pushbutton2,'String','Please Wait...')
 set(handles.edit1,'Enable','off')
 set(handles.edit2,'Enable','off')
 set(handles.edit3,'Enable','off')
 if ~isempty(instrfind)   % Close Existing Open Connection
     fclose(instrfind);
      delete(instrfind);
end
 arduino=serial('COM7'); 
  fopen(arduino);
  disp("Please Wait while the Arduino Hardware Setups..!!");
  pause(10);
  disp("Please Wait while we receive Signal from Tx, in order to continue decryption.");
  
  txstring='';     % empty string 
  
  %% Read Serial Data until received
  while isempty(txstring)==1 
    txstring=fscanf(arduino);
  end
  disp("Tx Input Received..!!");
  fclose(arduino);
  disp("The Received String is: ");
  disp(txstring);
  set(handles.edit3,'String',txstring)
  rxstring1 = regexp(txstring, ';', 'split');
  global rxstring
  rxstring=str2double(rxstring1);    % Convert String into Double for Operations
  %handles.rxstring=rxstring;
  %guidata(hObject,handles)
  set(handles.text13, 'String', ['Signal Received.Insert key to decrypt.']);
  set(handles.edit1,'Enable','on')
  set(handles.edit2,'Enable','on')
  set(handles.pushbutton1,'Enable','on')
  set(handles.pushbutton2,'String','Signal Received.')
  disp("Encrypted Message:");
  disp(rxstring);
  drawnow;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.pushbutton1,'Enable','off')
 set(handles.pushbutton2,'Enable','off')
 set(handles.edit1,'Enable','off')
 set(handles.edit2,'Enable','off')
 set(handles.edit3,'Enable','off')
 Str = get(handles.edit1, 'String');
 Num = sscanf(Str, '%g:%g');
 d   = min(Num):max(Num);
 Str1 = get(handles.edit2, 'String');
 Num1 = sscanf(Str1, '%g:%g');
 n   = min(Num1):max(Num1);
 global rxstring
 if(isempty(rxstring)==1)
     edit3String = get(handles.edit3, 'String');
     rxstring = regexp(p, ';', 'split');
     cipher=str2double(rxstring);    % Convert String into Double for Operations
 else
     cipher = rxstring;
 end
 disp("Entered Value of d: ");
 disp(d);
 disp("Entered Value of n: ");
 disp(n);
 x = length(cipher);
            disp("The Obtained Cipher Text is: ");
            disp(cipher);             
            for j= 1:x
                message(j)= crypt(cipher(j),n,d); 
            end
            disp('Decrypted ASCII code of Message:');
            disp(message);
            disp(['Decrypted Message: ' message]);
            set(handles.text13, 'String', ['Decrypted Message: ' message]);
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
