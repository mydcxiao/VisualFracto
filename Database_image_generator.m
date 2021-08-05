%%------------------------------------------------------------------------------------------------------------------------------------------------
%%Author(s): Xiao Yuhang
%%Date: 2020/4/29
%%2020 Copyright: all rights for this program are reserved to FAMS Laboratory at the University of Michigan Jiao Tongy University -Joint Instiute.  
%%This program cannot be used without the prior approval of both Prof. Roberto Dugnani and the authors of the code.
%%------------------------------------------------------------------------------------------------------------------------------------------------
function varargout = Database_image_generator(varargin)
% DATABASE_IMAGE_GENERATOR MATLAB code for Database_image_generator.fig
%      DATABASE_IMAGE_GENERATOR, by itself, creates a new DATABASE_IMAGE_GENERATOR or raises the existing
%      singleton*.
%
%      H = DATABASE_IMAGE_GENERATOR returns the handle to a new DATABASE_IMAGE_GENERATOR or the handle to
%      the existing singleton*.
%
%      DATABASE_IMAGE_GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATABASE_IMAGE_GENERATOR.M with the given input arguments.
%
%      DATABASE_IMAGE_GENERATOR('Property','Value',...) creates a new DATABASE_IMAGE_GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Database_image_generator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Database_image_generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Database_image_generator

% Last Modified by GUIDE v2.5 14-Oct-2020 13:53:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Database_image_generator_OpeningFcn, ...
                   'gui_OutputFcn',  @Database_image_generator_OutputFcn, ...
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


% --- Executes just before Database_image_generator is made visible.
function Database_image_generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Database_image_generator (see VARARGIN)
set(handles.pushbutton5,'enable','off');
set(handles.pushbutton43,'enable','off');
set(handles.pushbutton44,'enable','off');
set(handles.pushbutton45,'enable','off');
set(handles.pushbutton13,'enable','off');
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton16,'enable','off');
set(handles.pushbutton25,'visible','off');
set(handles.pushbutton26,'visible','off');
set(handles.pushbutton27,'visible','off');
set(handles.pushbutton28,'visible','off');
set(handles.edit7,'visible','off');
set(handles.edit10,'enable','off');
set(handles.pushbutton30,'enable','off');
set(handles.edit11,'enable','off');
set(handles.edit12,'enable','off');
handles.stretchlimits=0.01;
handles.gamma=1;
handles.gim=[];
handles.bgim=[];
handles.rm=[];
set(handles.pushbutton35,'enable','off');
handles.tk=[];
handles.deg=[];
handles.rm=[];
handles.Im2=[];
handles.d=[];
% Choose default command line output for Database_image_generator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Database_image_generator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Database_image_generator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu5,'value');
switch val
    case 1
    case 2
[filename,filepath] = uigetfile({'*.jpg;*.tif;*.png;*.bmp','Image file(*.jpg,*.tif,*.png,*.bmp)'},'Pick an image');
file = strcat(filepath,filename);
handles.im = imread(file);
axes(handles.axes2);
handles.Im1=im2double(rgb2gray(handles.im));
imshow(rgb2gray(handles.im));
    case 3
[filename,filepath] = uigetfile({'*.jpg;*.tif;*.png;*.bmp','Image file(*.jpg,*.tif,*.png,*.bmp)'},'Pick an image');
file = strcat(filepath,filename);
handles.im = imread(file);
axes(handles.axes2);
handles.Im1=imcomplement(im2double(rgb2gray(handles.im)));
imshow(handles.Im1);
    case 4
[filename,filepath] = uigetfile({'*.txt;*.xls;*.mat','Data file(*.txt,*.xls,*.mat)'},'Pick data file');
file = strcat(filepath,filename);
handles.dataR = importdata(file);
Zdata = handles.dataR(:,3);
handles.dataR = reshape(Zdata,sqrt(size(handles.dataR,1)),sqrt(size(handles.dataR,1)));
axes(handles.axes2);
handles.Im1=im2double(uint8(handles.dataR));
imshow(handles.Im1);
    case 5
[filename,filepath] = uigetfile({'*.csv','Data file(*.csv)'},'Pick data file');
file = strcat(filepath,filename);
handles.dataR = csvread(file,15,1);
% handles.dataR(1,:)=[];
% handles.dataR(:,1)=[];
if size(handles.dataR,1)<size(handles.dataR,2)
    handles.dataR(:,size(handles.dataR,2))=[];
end
axes(handles.axes2);
handles.Im1=im2double(uint8(handles.dataR));
imshow(handles.Im1);
end
set(handles.pushbutton5,'enable','on');
set(handles.pushbutton43,'enable','on');
set(handles.pushbutton44,'enable','on');
set(handles.pushbutton45,'enable','on');
guidata(hObject,handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu4,'value');
switch val
    case 1
    case 2
     if isempty(handles.d)&&isempty(handles.tk)
        errordlg('Please input the magnificaiton and thickness','Error'); 
     elseif isempty(handles.d)
         errordlg('Please input the magnificaiton','Error');
     elseif isempty(handles.tk)
         errordlg('Please input the thickness','Error');
     else
now=get(hObject,'string');
switch now
    case 'select ROI'
prompt = {'Enter Size of ROI (Fraction of Thickness):'};
title = 'Input';
dims = [1 35];
definput = {'0.25'};
opts.Interpreter = 'tex';
answer = inputdlg(prompt,title,dims,definput,opts);
handles.deg=str2num(answer{1});
l=round((handles.tk*handles.deg)*handles.d);
set(hObject,'string','Confirm')
cla(handles.axes2,'reset');
axes(handles.axes2);
if isempty(handles.Im2)
    imshow(handles.Im1);
else 
    imshow(handles.Im2);
end
handles.pt=impoint(gca);
handles.ptp=getPosition(handles.pt);
handles.rect=imrect(gca,[handles.ptp(1)-l/3,handles.ptp(2),l,l]);
setFixedAspectRatioMode(handles.rect,true);
setColor(handles.rect,'red');
    case 'Confirm'
set(hObject,'string','select ROI');
por=getPosition(handles.rect);
setPosition(handles.rect,[handles.ptp(1)-por(3)/3,handles.ptp(2),por(3),por(4)]);
if isempty(handles.Im2)
    I1=imcrop(handles.Im1,[handles.ptp(1)-por(3)/3,handles.ptp(2),por(3),por(4)]);
else
    I1=imcrop(handles.Im2,[handles.ptp(1)-por(3)/3,handles.ptp(2),por(3),por(4)]);
end
if size(I1,2)<por(3)||size(I1,1)<por(4)
    errordlg('no effective image', 'warning');
% else
% val=get(handles.popupmenu5,'value');
% switch val
%     case 1
%     case 2
%     case 3
%     I1=imcomplement(I1);
%     case 4
%     case 5
% end
end
I1=imresize(I1,[700 700]);
if get(handles.popupmenu7,'value')~=2
handles.I=morphchange(I1);
else
handles.I=I1;
end
set(handles.pushbutton13,'enable','on');
handles.ptp=[];
end
guidata(hObject,handles);
     end
    case 3
     if isempty(handles.d)&&isempty(handles.rm)
     errordlg('Please input the magnificaiton, thickness and mirror radius','Error'); 
     elseif isempty(handles.d)
         errordlg('Please input the magnificaiton','Error');
     elseif isempty(handles.rm)
         errordlg('Please input the mirror radius','Error');
     else
now=get(hObject,'string');
switch now
    case 'select ROI'
set(hObject,'string','Confirm')
cla(handles.axes2,'reset');
axes(handles.axes2);
if isempty(handles.Im2)
    imshow(handles.Im1);
else
    imshow(handles.Im2);
end
l=round(1.5*handles.rm*handles.d);
handles.ptc=impoint(gca);
handles.ptp=getPosition(handles.ptc);
handles.rect=imrect(gca,[handles.ptp(1),handles.ptp(2),l,l]);
setFixedAspectRatioMode(handles.rect,true);
    case 'Confirm'
set(hObject,'string','select ROI');
pt=getPosition(handles.rect);
handles.lengtht=pt(3)/handles.d;
if isempty(handles.Im2)
    I1=imcrop(handles.Im1,[pt(1),pt(2),pt(3),pt(4)]);
else
    I1=imcrop(handles.Im2,[pt(1),pt(2),pt(3),pt(4)]);
end
% val=get(handles.popupmenu5,'value');
if (size(I1,2)<pt(3)||size(I1,1)<pt(4)) %&& val==2
   errordlg('no effective image', 'warning');
% elseif (size(I1,2)<ht(i)||size(I1,1)<wh(i)) && val==3
%         BG=logical(zeros(round(wh(i)),round(ht(i))));
%     for l=1:size(I1,1)
%         for m=1:size(I1,2)
%             BG(l,m)=I1(l,m);
%         end
%     end
%     I1=BG;
%     I1=imcomplement(I1);
% else
%     switch val
%     case 1
%     case 2
%     case 3
%     I1=imcomplement(I1);
%     case 4
%     case 5
%     end
end
I1=imresize(I1,[700 700]);
if get(handles.popupmenu7,'value')~=2
handles.I=morphchange(I1);
% handles.I=I1;
else
handles.I=I1;
end
set(handles.pushbutton13,'enable','on');
end
guidata(hObject,handles);
     end
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton9.

function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'value');
switch val
    case 1
        handles.d=127/50;
    case 2
        handles.d=127/50;
    case 3
        handles.d=242/50;
    case 4
        handles.d=567/50;
    case 5
        set(handles.uipanel5,'Visible','off');
        set(handles.uipanel3,'position',[0.774 0.003 0.199 0.996]);
        set(handles.uipanel3,'Visible','on');
end
guidata(hObject,handles);

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.tk=str2num(get(handles.edit1,'string'));
guidata(hObject,handles);
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
handles.rm=str2num(get(handles.edit2,'string'));
guidata(hObject,handles);
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

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes2,'reset');
set(handles.popupmenu1,'value',1);
set(handles.edit6,'string','');
set(handles.radiobutton9,'value',1);
set(handles.radiobutton10,'value',0);
set(handles.popupmenu4,'value',1);
set(handles.popupmenu5,'value',1);
handles.Im1=[];
handles.Im2=[];
handles.sl=[];
handles.mh=[];
handles.lengtht=[];
handles.d=[];
handles.rm=[];
handles.tk=[];
handles.kic=[];
handles.index=[];
handles.sizeDB=[];
handles.rh=[];
handles.Sig=[];
handles.SigE=[];
handles.dv=[];
handles.dataR=[];
handles.DZ=128;
handles.z=[];
handles.Rms=[];
handles.gim=[];
handles.bgim=[];
handles.stretchlimits=0.01;
handles.gamma=1;
handles.DB=[];
handles.deg=[];
handles.numtestflex=[];
handles.numtestten=[];
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit4,'string','');
set(handles.edit5,'string','');
set(handles.edit7,'string','');
set(handles.edit7,'visible','off');
set(handles.pushbutton13,'enable','off');
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton16,'enable','off');
set(handles.pushbutton25,'visible','off');
set(handles.pushbutton26,'visible','off');
set(handles.pushbutton27,'visible','off');
set(handles.pushbutton28,'visible','off');
set(handles.edit9,'string','128');
set(handles.edit8,'string','');
set(handles.popupmenu7,'value',1);
set(handles.edit10,'string','');
set(handles.edit10,'enable','off');
set(handles.pushbutton30,'enable','off');
set(handles.edit11,'enable','off');
set(handles.edit12,'enable','off');
set(handles.edit11,'string','');
set(handles.edit12,'string','');
set(handles.edit14,'string','');
set(handles.slider2,'value',0.01);
set(handles.slider3,'value',4);
set(handles.pushbutton5,'string','select ROI');
set(handles.pushbutton35,'enable','off');
set(handles.pushbutton5,'enable','off');
set(handles.pushbutton43,'enable','off');
set(handles.pushbutton44,'enable','off');
set(handles.pushbutton45,'enable','off');
guidata(hObject,handles);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
imshow(handles.I);
set(handles.pushbutton35,'enable','on');


% --- Executes during object creation, after setting all properties.
function axes14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel3,'Visible','off');
set(handles.uipanel3,'position',[0.568 0.003 0.199 0.996]);
set(handles.uipanel5,'Visible','on');



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.d=str2num(get(handles.edit4,'string'));
guidata(hObject,handles);

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


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
now=get(hObject,'string');
switch now
    case 'Measure Pixels' 
set(hObject,'string','Confirm');
axes(handles.axes2);
handles.pl=imdistline;
setLabelVisible(handles.pl,false);
    case 'Confirm'
set(hObject,'string','Measure Pixels')
pix=getDistance(handles.pl);
handles.d=pix/handles.sl;
delete(handles.pl);
set(handles.edit4,'string',num2str(handles.d));
end
guidata(hObject,handles);
    
    




function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sl=str2num(get(handles.edit5,'string'));
set(handles.pushbutton16,'enable','on');
guidata(hObject,handles);
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


% --- Executes when selected object is changed in uibuttongroup4.
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.d)
    errordlg('Please Input Magnification!','Error');
else
str=get(hObject,'tag');
switch str
    case 'radiobutton9'
     set(handles.axes2,'visible','off');
     handles.axes2.XGrid='off';
     handles.axes2.YGrid='off';
     set(handles.edit11,'enable','off');
     set(handles.edit12,'enable','off');
     xlabel('');
     ylabel('');
    case 'radiobutton10'
    set(handles.edit11,'enable','on');
    set(handles.edit12,'enable','on');  
     axes(handles.axes2);
     imshow(handles.Im2);
     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
     handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
     handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
     XTick=handles.axes2.XTickLabel;
     YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
end
guidata(hObject,handles);
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Deg=str2num(get(handles.edit6,'string'));
    axes(handles.axes2);
    handles.Im2=imrotate(handles.Im2,Deg);
    imshow(handles.Im2);
     if get(handles.radiobutton10,'value')==1
     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
     handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
     handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
XTick=handles.axes2.XTickLabel;
YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
     end
guidata(hObject,handles);
    
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit6,'string','');
handles.Im2=handles.Im1;
axes(handles.axes2);
imshow(handles.Im2);
if get(handles.radiobutton10,'value')==1
     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
     handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
     handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
XTick=handles.axes2.XTickLabel;
YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
end
guidata(hObject,handles);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
now=get(hObject,'string');
switch now
    case 'Measure' 
set(hObject,'string','Confirm');
axes(handles.axes2);
handles.tpl=imdistline;
setLabelVisible(handles.tpl,false);
    case 'Confirm'
set(hObject,'string','Measure')
pix=getDistance(handles.tpl);
handles.tk=pix/handles.d;
delete(handles.tpl);
set(handles.edit1,'string',num2str(handles.tk));
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
now=get(hObject,'string');
switch now
    case 'Measure' 
set(hObject,'string','Confirm');
axes(handles.axes2);
handles.rpl=imdistline;
setLabelVisible(handles.rpl,false);
    case 'Confirm'
set(hObject,'string','Measure')
pix=getDistance(handles.rpl);
handles.rm=pix/handles.d;
delete(handles.rpl);
set(handles.edit2,'string',num2str(handles.rm));
end
guidata(hObject,handles);



% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom on;

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom off;

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom out;


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'value');
switch val
    case 1
    case 2
    if get(handles.popupmenu5,'value')~=1
    set(handles.pushbutton2,'enable','on');
%     set(handles.popupmenu3,'string',{'select database','sodalime glass'});
    end
    case 3
    if get(handles.popupmenu5,'value')~=1
    set(handles.pushbutton2,'enable','on');
    end
%     set(handles.popupmenu3,'string',{'select database','t_sodalimeglass'});
end
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'value');
switch val
    case 1
    case 2
    if get(handles.popupmenu4,'value')~=1
    set(handles.pushbutton2,'enable','on');
    end
    case 3
    if get(handles.popupmenu4,'value')~=1
    set(handles.pushbutton2,'enable','on');
    end
    case 4
    if get(handles.popupmenu4,'value')~=1
    set(handles.pushbutton2,'enable','on');
    end
end
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
cla;
handles.index=handles.index+1;
if handles.index>handles.sizeDB
    handles.index=1;
end
m=0.6:0.025:1.5;
[maxy posy] = max(handles.Yy{handles.index});
MaxX = handles.Xx{handles.index}(posy);
pti=find(m-MaxX>=0,1);
if pti<=6
    st=1;
    ed=pti+5;
    pos1=1;
    pos2=(pti-1+5)*25+1;
elseif pti+5>=length(m)
    ed=length(m);
    st=pti-6;
    pos1=(pti-1-6)*25+1;
    pos2=length(handles.Xx{handles.index});
else
    st=pti-6;
    ed=pti+5;
    pos1=(pti-1-6)*25+1;
    pos2=(pti-1+5)*25+1;
end
pt=m(st:ed);
Rn=handles.Rn(st:ed,handles.index);
Xx=0.6+(pos1-1)*0.001:0.001:0.6+(pos2-1)*0.001;
Pp = polyfit(pt,Rn',6);
Yy=polyval(Pp,Xx);
% Xx=handles.Xx{handles.index}(pos1:pos2);
% Yy=handles.Yy{handles.index}(pos1:pos2);
% scatter(m,handles.Rn(:,handles.index)',40,'b','filled');
scatter(pt,Rn,40,'b','filled');
hold on;
% plot(handles.Xx{handles.index},handles.Yy{handles.index},'r');
plot(Xx,Yy,'r');
xlabel('m');
ylabel('Correlation Index');
set(handles.edit7,'string',num2str(handles.index));
guidata(hObject,handles);

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
cla;
handles.index=handles.index-1;
if handles.index==0
    handles.index=handles.sizeDB;
end
m=0.6:0.025:1.5;
[maxy posy] = max(handles.Yy{handles.index});
MaxX = handles.Xx{handles.index}(posy);
pti=find(m-MaxX>=0,1);
if pti<=6
    st=1;
    ed=pti+5;
    pos1=1;
    pos2=(pti-1+5)*25+1;
elseif pti+5>=length(m)
    ed=length(m);
    st=pti-6;
    pos1=(pti-1-6)*25+1;
    pos2=length(handles.Xx{handles.index});
else
    st=pti-6;
    ed=pti+5;
    pos1=(pti-1-6)*25+1;
    pos2=(pti-1+5)*25+1;
end
pt=m(st:ed);
Rn=handles.Rn(st:ed,handles.index);
Xx=0.6+(pos1-1)*0.001:0.001:0.6+(pos2-1)*0.001;
Pp = polyfit(pt,Rn',6);
Yy=polyval(Pp,Xx);
% Xx=handles.Xx{handles.index}(pos1:pos2);
% Yy=handles.Yy{handles.index}(pos1:pos2);
% scatter(m,handles.Rn(:,handles.index)',40,'b','filled');
scatter(pt,Rn,40,'b','filled');
hold on;
% plot(handles.Xx{handles.index},handles.Yy{handles.index},'r');
plot(Xx,Yy,'r');
xlabel('m');
ylabel('Correlation Index');
set(handles.edit7,'string',num2str(handles.index));
guidata(hObject,handles);



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
axes(handles.axes2);
cla;
handles.index=str2num(get(handles.edit7,'string'));
if handles.index<=0
    handles.index=1;
elseif handles.index>handles.sizeDB
    handles.index=handles.sizeDB;
end
m=0.6:0.025:1.5;
[maxy posy] = max(handles.Yy{handles.index});
MaxX = handles.Xx{handles.index}(posy);
pti=find(m-MaxX>=0,1);
if pti<=6
    st=1;
    ed=pti+5;
    pos1=1;
    pos2=(pti-1+5)*25+1;
elseif pti+5>=length(m)
    ed=length(m);
    st=pti-6;
    pos1=(pti-1-6)*25+1;
    pos2=length(handles.Xx{handles.index});
else
    st=pti-6;
    ed=pti+5;
    pos1=(pti-1-6)*25+1;
    pos2=(pti-1+5)*25+1;
end
pt=m(st:ed);
Rn=handles.Rn(st:ed,handles.index);
Xx=0.6+(pos1-1)*0.001:0.001:0.6+(pos2-1)*0.001;
Pp = polyfit(pt,Rn',6);
Yy=polyval(Pp,Xx);
% Xx=handles.Xx{handles.index}(pos1:pos2);
% Yy=handles.Yy{handles.index}(pos1:pos2);
% scatter(m,handles.Rn(:,handles.index)',40,'b','filled');
scatter(pt,Rn,40,'b','filled');
hold on;
% plot(handles.Xx{handles.index},handles.Yy{handles.index},'r');
plot(Xx,Yy,'r');
xlabel('m');
ylabel('Correlation Index');
set(handles.edit7,'string',num2str(handles.index));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RH=handles.RH(handles.index);
if RH>=10
    RH=round(RH);
elseif RH<10
    digits(2);
    RH=eval(vpa(RH));
end
slCharacterEncoding('UTF-8');
nt=char(181);
set(handles.text7,'string',strcat('Rm: ',num2str(RH),'',nt,'m'));
set(handles.text9,'string',strcat('strength: ',num2str(handles.Sig(handles.index)),' MPa'));

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
digits(2);
slCharacterEncoding('US-ASCII');
sgn=char(177);
slCharacterEncoding('UTF-8');
nt=char(181);
set(handles.text7,'string',strcat('Rm: ',num2str(handles.rh),'',nt,'m'));
set(handles.text9,'string',strcat('strength: ',num2str(handles.SigE),sgn,num2str(handles.dv),' MPa'));



% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
now=get(hObject,'string');
switch now
    case 'select region'
set(hObject,'string','Confirm')
axes(handles.axes2);
handles.region=imrect(gca,[10 10 300 300]);
    case 'Confirm'
set(hObject,'string','select region');
pt=getPosition(handles.region);
delete(handles.region);
zavg = 0;
    for ii= round(pt(1)):round((pt(1)+pt(3)))
        for jj= round(pt(2)):round((pt(2)+pt(4)))
            zavg = zavg + handles.dataR(ii,jj);
        end
    end
zavg = zavg/(round(pt(3))*round(pt(4)));
Zmin = zavg;
c_data = handles.dataR-Zmin;
deltax=round(pt(4)-1);
deltay=round(pt(3)-1);
    for i = 1:deltax
        for j = 1:deltay
            Xcolv(j+deltay*(i-1)) = i; % Make X a column vector
            Ycolv(j+deltay*(i-1)) = j; % Make Y a column vector
            Zcolv(j+deltay*(i-1)) = c_data(j+round(pt(1)-1),i+round(pt(2))-1); % Make Z a column vector
        end
    end
    Const = ones(size(Xcolv)); % Vector of ones for constant term
    Coefficients = [Xcolv' Ycolv' Const']\Zcolv'; % Find the coefficients
    XCoeff = Coefficients(1); % X coefficient
    YCoeff = Coefficients(2); % X coefficient
for i = 1:size(handles.dataR,1)
    for j=1:size(handles.dataR,2)
        z(i,j)=c_data(i,j)-(XCoeff*j+YCoeff*i);
    end
end
    z_average = mean(mean(z(pt(1):pt(1)+pt(3),pt(2):pt(2)+pt(4))));
    z = z - z_average;
    for i = 1:size(z,1)
        for j=1:size(z,2)
           if z(i,j)<-(handles.DZ)/2
               z(i,j)=0;
           end
           if z(i,j)> (handles.DZ)/2
               z(i,j)=0;
           end
        end
    end
for i= 1:size(z,1)
    for j= 1:floor(size(z,2)/5)
        intave = 0;
        for k = 1 : 5
           knum = (j-1)*5+k;
           intave = intave + z(i,knum);
        end
        intave = intave / 5;
        for k = 1 : 5
           knum = (j-1)*5+k;
           Hdif(i,knum) = z(i,knum) - intave;
        end
    end
end
for i = 1:size(Hdif,1)
    for j = 1:size(Hdif,2)-4
        Rai = 0;
        Rmsi = 0;
        hmax = -999;
        hmin = 999;
        for k = j : j+4
            if Hdif(i,k)> hmax
               hmax = Hdif(i,k);
            elseif Hdif(i,k)< hmin
               hmin = Hdif(i,k);
            end
         Rai = Rai+abs(Hdif(i,k));
         Rmsi = Rmsi+(abs(Hdif(i,k)))^2;
         end 
         Rms(i,j)=sqrt(Rmsi/5);     
   end
end
    Rc=Rms;
for i=1:size(Rc,1)
    for j=1:size(Rc,2)
        if Rc(i,j)<=1.5
            Rc(i,j)=0.4*Rc(i,j);
        elseif Rc(i,j)>1.5
            Rc(i,j)=1-0.6/Rc(i,j);
        end
    end
end
axes(handles.axes2);
imshow(Rc);
handles.Rms=Rc;
end
guidata(hObject,handles);

% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'value');
switch val
    case 1
    case 2
        set(handles.pushbutton30,'enable','on');
    case 3
        set(handles.edit10,'enable','on');
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.d=1/(str2num(get(handles.edit8,'string')));
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.DZ=str2num(get(handles.edit9,'string'));
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.DZ=128;
guidata(hObject,handles);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.BRms=[];
threshold=str2num(get(handles.edit10,'string'));
handles.BRms=imbinarize(handles.Rms,threshold);
axes(handles.axes2);
imshow(handles.BRms);
set(handles.pushbutton30,'enable','on');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel4,'Visible','off');
set(handles.uipanel4,'position',[0.568 0.003 0.199 0.996]);
set(handles.uipanel1,'Visible','on');
val=get(handles.popupmenu7,'value');
switch val
    case 1
        errorlog('Analysis Type Error','Please select analysis type!');
    case 2
        handles.Im1=handles.Rms;
    case 3
        handles.Im1=handles.BRms;
end
guidata(hObject,handles);


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 axes(handles.axes2);

         imshow(handles.Im2);

     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
         handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
     handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
     XTick=handles.axes2.XTickLabel;
     YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 axes(handles.axes2);
         imshow(handles.Im2);
     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
         handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
         handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
     XTick=handles.axes2.XTickLabel;
     YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel5,'Visible','off');
set(handles.uipanel5,'position',[0.568 0.003 0.199 0.996]);
set(handles.uipanel1,'Visible','on');
if isempty(handles.bgim)&&~isempty(handles.gim)
handles.Im1=handles.gim;
elseif ~isempty(handles.bgim)
    handles.Im1=handles.bgim;
end
guidata(hObject,handles);


function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
level=str2num(get(hObject,'string'));
handles.bgim=imbinarize(handles.gim,level);
axes(handles.axes2);
imshow(handles.bgim);
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.stretchlimits=get(hObject,'value');
handles.gim=imadjust(handles.Im1,stretchlim(handles.Im1,handles.stretchlimits),[],handles.gamma);
axes(handles.axes2);
imshow(handles.gim);
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.gamma=10^(get(hObject,'value')-4);
handles.gim=imadjust(handles.Im1,stretchlim(handles.Im1,handles.stretchlimits),[],handles.gamma);
axes(handles.axes2);
imshow(handles.gim);
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.bgim=imbinarize(handles.gim);
axes(handles.axes2);
imshow(handles.bgim);
guidata(hObject,handles);


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile('*.tif','Save Picture','Untitled');
if FileName==0
    return;
else
    imwrite(handles.I,[PathName,FileName]);
end

% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel6,'Visible','off');
set(handles.uipanel6,'position',[0.568 0.003 0.199 0.996]);
set(handles.uipanel1,'Visible','on');
guidata(hObject,handles);

% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu5,'value');
switch val
    case 1
    case 2
set(handles.uipanel1,'Visible','off');
set(handles.uipanel5,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel5,'Visible','on');
handles.Im1=im2double(rgb2gray(handles.im));
    case 3
set(handles.uipanel1,'Visible','off');
set(handles.uipanel5,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel5,'Visible','on');
handles.Im1=imcomplement(im2double(rgb2gray(handles.im)));
    case 4
set(handles.uipanel1,'Visible','off');
set(handles.uipanel4,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel4,'Visible','on');
handles.Im1=im2double(uint8(handles.dataR));
    case 5
set(handles.uipanel1,'Visible','off');
set(handles.uipanel4,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel4,'Visible','on');
handles.Im1=im2double(uint8(handles.dataR));
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','off');
set(handles.uipanel6,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel6,'Visible','on');
handles.Im2=handles.Im1;
guidata(hObject,handles);

% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu4,'value');
switch val
    case 1
    case 2
set(handles.uipanel1,'Visible','off');
set(handles.uipanel7,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel7,'Visible','on');
    case 3
set(handles.uipanel1,'Visible','off');
set(handles.uipanel8,'position',[0.774 0.003 0.199 0.996]);
set(handles.uipanel8,'Visible','on');
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel7,'Visible','off');
set(handles.uipanel7,'position',[0.568 0.003 0.199 0.996]);
set(handles.uipanel1,'Visible','on');
guidata(hObject,handles);


% --- Executes on button press in pushbutton50.
function pushbutton50_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Im=flip(handles.Im2,2);
axes(handles.axes2);
imshow(Im);
handles.Im2=Im;
     if get(handles.radiobutton10,'value')==1
     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
     handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
     handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
XTick=handles.axes2.XTickLabel;
YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
     end
guidata(hObject,handles);

% --- Executes on button press in pushbutton51.
function pushbutton51_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Im=flip(handles.Im2,1);
axes(handles.axes2);
imshow(Im);
handles.Im2=Im;
     if get(handles.radiobutton10,'value')==1
     set(handles.axes2,'visible','on');
     xlabel('horizontal length(\mum)');
     ylabel('vertical length(\mum)');
     handles.axes2.XGrid='on';
     handles.axes2.YGrid='on';
     handles.axes2.GridColor='r';
     handles.axes2.GridAlpha=1;
     if get(handles.edit11,'string')~=""
     xspacing=str2num(get(handles.edit11,'string'))*handles.d;
     handles.axes2.XTick=xspacing:xspacing:size(handles.Im2,2);
     end
     if get(handles.edit12,'string')~=""
     yspacing=str2num(get(handles.edit12,'string'))*handles.d;
     handles.axes2.YTick=yspacing:yspacing:size(handles.Im2,1);
     end
XTick=handles.axes2.XTickLabel;
YTick=handles.axes2.YTickLabel;
for i=1:length(handles.axes2.XTickLabel)
handles.axes2.XTickLabel{i}=num2str(round(str2num(XTick{i})/handles.d));
end
for i=1:length(handles.axes2.YTickLabel)
handles.axes2.YTickLabel{i}=num2str(round(str2num(YTick{i})/handles.d));
end
     end
guidata(hObject,handles);


% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel8,'Visible','off');
set(handles.uipanel8,'position',[0.568 0.003 0.199 0.996]);
set(handles.uipanel1,'Visible','on');
guidata(hObject,handles);