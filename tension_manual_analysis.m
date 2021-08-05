%%------------------------------------------------------------------------------------------------------------------------------------------------
%%Author(s): Xiao Yuhang
%%Date: 2020/4/29
%%2020 Copyright: all rights for this program are reserved to FAMS Laboratory at the University of Michigan Jiao Tongy University -Joint Instiute.  
%%This program cannot be used without the prior approval of both Prof. Roberto Dugnani and the authors of the code.
%%------------------------------------------------------------------------------------------------------------------------------------------------
function varargout = tension_manual_analysis(varargin)
% TENSION_MANUAL_ANALYSIS MATLAB code for tension_manual_analysis.fig
%      TENSION_MANUAL_ANALYSIS, by itself, creates a new TENSION_MANUAL_ANALYSIS or raises the existing
%      singleton*.
%
%      H = TENSION_MANUAL_ANALYSIS returns the handle to a new TENSION_MANUAL_ANALYSIS or the handle to
%      the existing singleton*.
%
%      TENSION_MANUAL_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TENSION_MANUAL_ANALYSIS.M with the given input arguments.
%
%      TENSION_MANUAL_ANALYSIS('Property','Value',...) creates a new TENSION_MANUAL_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tension_manual_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tension_manual_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tension_manual_analysis

% Last Modified by GUIDE v2.5 10-Apr-2020 17:29:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tension_manual_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @tension_manual_analysis_OutputFcn, ...
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


% --- Executes just before tension_manual_analysis is made visible.
function tension_manual_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tension_manual_analysis (see VARARGIN)

% Choose default command line output for tension_manual_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tension_manual_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tension_manual_analysis_OutputFcn(hObject, eventdata, handles) 
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
d=getappdata(handles.axes1,'d');
kic=getappdata(handles.axes1,'k');
now=get(hObject,'string');
switch now
    case 'Measure' 
set(hObject,'string','Confirm');
axes(handles.axes1);
handles.rpl=imdistline;
setLabelVisible(handles.rpl,false);
    case 'Confirm'
set(hObject,'string','Measure')
pix=getDistance(handles.rpl);
rm=pix/d;
delete(handles.rpl);
MaxX=rm;
SigE =2.76*kic/sqrt(rm*10^(-6));
if MaxX>=10
    MaxX=round(MaxX);
elseif MaxX<10
    digits(2);
    MaxX=eval(vpa(MaxX));
end
if SigE>=10
    SigE=round(SigE);
elseif SigE<10
    digits(2);
    SigE=eval(vpa(SigE));
end
slCharacterEncoding('UTF-8');
nt=char(181);
set(handles.text3,'string',strcat('Rm: ',num2str(MaxX),'',nt,'m'));
set(handles.text2,'string',strcat('strength: ',num2str(SigE),' MPa'));
end
guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=getappdata(handles.axes1,'d');
kic=getappdata(handles.axes1,'k');
now=get(hObject,'string');
switch now
    case 'Measure' 
set(hObject,'string','Confirm');
axes(handles.axes1);
handles.rpl=imdistline;
setLabelVisible(handles.rpl,false);
    case 'Confirm'
set(hObject,'string','Measure')
pix=getDistance(handles.rpl);
pix=pix/2;
rm=pix/d;
delete(handles.rpl);
MaxX=rm;
SigE =2.76*kic/sqrt(rm*10^(-6));
if MaxX>=10
    MaxX=round(MaxX);
elseif MaxX<10
    digits(2);
    MaxX=eval(vpa(MaxX));
end
if SigE>=10
    SigE=round(SigE);
elseif SigE<10
    digits(2);
    SigE=eval(vpa(SigE));
end
slCharacterEncoding('UTF-8');
nt=char(181);
set(handles.text3,'string',strcat('Rm: ',num2str(MaxX),'',nt,'m'));
set(handles.text2,'string',strcat('strength: ',num2str(SigE),' MPa'));
end
guidata(hObject,handles);
