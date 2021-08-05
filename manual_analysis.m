%%------------------------------------------------------------------------------------------------------------------------------------------------
%%Author(s): Xiao Yuhang
%%Date: 2020/4/29
%%2020 Copyright: all rights for this program are reserved to FAMS Laboratory at the University of Michigan Jiao Tongy University -Joint Instiute.  
%%This program cannot be used without the prior approval of both Prof. Roberto Dugnani and the authors of the code.
%%------------------------------------------------------------------------------------------------------------------------------------------------
function varargout = manual_analysis(varargin)
% MANUAL_ANALYSIS MATLAB code for manual_analysis.fig
%      MANUAL_ANALYSIS, by itself, creates a new MANUAL_ANALYSIS or raises the existing
%      singleton*.
%
%      H = MANUAL_ANALYSIS returns the handle to a new MANUAL_ANALYSIS or the handle to
%      the existing singleton*.
%
%      MANUAL_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUAL_ANALYSIS.M with the given input arguments.
%
%      MANUAL_ANALYSIS('Property','Value',...) creates a new MANUAL_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manual_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manual_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manual_analysis

% Last Modified by GUIDE v2.5 19-Mar-2020 23:32:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manual_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @manual_analysis_OutputFcn, ...
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


% --- Executes just before manual_analysis is made visible.
function manual_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manual_analysis (see VARARGIN)
global index
index=1;
% Choose default command line output for manual_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes manual_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manual_analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imb=getappdata(handles.axes2,'dataimage');
axes(handles.axes2);
global index
index=index-1;
if index==0
    index=size(imb,1);
end
imshow(imread(imb{index,1}));
set(handles.text10,'string',num2str(imb{index,2}));
    

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imb=getappdata(handles.axes2,'dataimage');
axes(handles.axes2);
global index
index=index+1;
if index>size(imb,1)
    index=1;
end
imshow(imread(imb{index,1}));
set(handles.text10,'string',num2str(imb{index,2}));


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imb=getappdata(handles.axes2,'dataimage');
axes(handles.axes2);
global index
index=str2num(get(handles.edit4,'string'));
if index<=0
    index=1;
elseif index>size(imb,1)
    index=size(imb,1);
end
imshow(imread(imb{index,1}));
set(handles.edit4,'string',num2str(index));
set(handles.text10,'string',num2str(imb{index,2}));
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% thickness=getappdata(handles.axes2,'thk');
% KIC=getappdata(handles.axes2,'K');
tk=getappdata(handles.axes2,'tk');
kic=getappdata(handles.axes2,'k');
DB=getappdata(handles.axes2,'dataimage');
% Sig2 = exp(1/(log(MaxX)*0.0208+0.2553));
% digits(2);
% SigE =eval(vpa(Sig2*sqrt(thickness/tk) * kic/KIC));
global index
SigE =DB{index,3}*kic/sqrt(tk*10^(-6));
if SigE>=10
    SigE=round(SigE);
elseif SigE<10
    digits(2);
    SigE=eval(vpa(SigE));
end
set(handles.text3,'string',strcat('R/H: ',num2str(DB{index,2})));
set(handles.text2,'string',strcat('strength: ',num2str(SigE),' MPa'));


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
