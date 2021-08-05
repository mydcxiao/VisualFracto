%%------------------------------------------------------------------------------------------------------------------------------------------------
%%Author(s): Xiao Yuhang
%%Date: 2020/4/29
%%2020 Copyright: all rights for this program are reserved to FAMS Laboratory at the University of Michigan Jiao Tongy University -Joint Instiute.  
%%This program cannot be used without the prior approval of both Prof. Roberto Dugnani and the authors of the code.
%%------------------------------------------------------------------------------------------------------------------------------------------------
function varargout = timageprocessed(varargin)
% TIMAGEPROCESSED MATLAB code for timageprocessed.fig
%      TIMAGEPROCESSED, by itself, creates a new TIMAGEPROCESSED or raises the existing
%      singleton*.
%
%      H = TIMAGEPROCESSED returns the handle to a new TIMAGEPROCESSED or the handle to
%      the existing singleton*.
%
%      TIMAGEPROCESSED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIMAGEPROCESSED.M with the given input arguments.
%
%      TIMAGEPROCESSED('Property','Value',...) creates a new TIMAGEPROCESSED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before timageprocessed_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to timageprocessed_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help timageprocessed

% Last Modified by GUIDE v2.5 25-Mar-2020 22:16:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @timageprocessed_OpeningFcn, ...
                   'gui_OutputFcn',  @timageprocessed_OutputFcn, ...
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


% --- Executes just before timageprocessed is made visible.
function timageprocessed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to timageprocessed (see VARARGIN)

% Choose default command line output for timageprocessed
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes timageprocessed wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = timageprocessed_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
