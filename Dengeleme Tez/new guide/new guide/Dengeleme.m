function varargout = Dengeleme(varargin)
% DENGELEME MATLAB code for Dengeleme.fig
%      DENGELEME, by itself, creates a new DENGELEME or raises the existing
%      singleton*.
%
%      H = DENGELEME returns the handle to a new DENGELEME or the handle to
%      the existing singleton*.
%
%      DENGELEME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DENGELEME.M with the given input arguments.
%
%      DENGELEME('Property','Value',...) creates a new DENGELEME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Dengeleme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Dengeleme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Dengeleme

% Last Modified by GUIDE v2.5 15-Aug-2017 17:36:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Dengeleme_OpeningFcn, ...
                   'gui_OutputFcn',  @Dengeleme_OutputFcn, ...
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


% --- Executes just before Dengeleme is made visible.
function Dengeleme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Dengeleme (see VARARGIN)
% h = waitbar(0,'Lütfen bekleyiniz...','Name','Program Açýlýyor');
% steps = 1000;
% for step = 1:steps
%     waitbar(step / steps)
% end
% close(h)
% Choose default command line output for Dengeleme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Dengeleme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Dengeleme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.uipanel1,'Visible','of');
axes(handles.axes1)
logo1=imread('baki.jpg');
imshow(logo1);
axis off;
axis image;

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Doðrultu Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=1;


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Kenar Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=2;

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Doðrultu - Kenar Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=3;

% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('GPS Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=4;

% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Geometrik Nivelman Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=5;

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles) %% TRÝGONOMETRÝK
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)  
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Düþey Açýlara Göre Trigonometrik Nivelman Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=6;

% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Yükselik Farklarýna Göre Trigonometrik Nivelman Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=7;


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('GPS Nivelmaný');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=8;

% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file_name num ch table
[file, path] = uigetfile ( '*.xlsx;*.xls;' , 'LOAD FILE');
file_name=fullfile(path,file);
[num,tex,table]=xlsread(file_name);
set(handles.uitable1,'data',table);
% h = waitbar(0,'Lütfen Bekleyiniz Veriler Yükleniyor...', 'Name','Veriler aktarýlýyor');
% steps = 1500;
% for step = 1:steps
%     waitbar(step / steps);
% end
% close(h);
if ch == 1 
z1 = num(:,1); z1 = z1(~isnan(z1));
z2 = num(:,2); z2 = z2(~isnan(z2));
z3 = num(:,3); z3 = z3(~isnan(z3));
Z1 = [z1 z2 z3];
z4 = num(:,4); z4 = z4(~isnan(z4));
z5 = num(:,5); z5 = z5(~isnan(z5));
z6 = num(:,6); z6 = z6(~isnan(z6));
Z2 = [z4 z5 z6];
Z = [Z1;Z2];
Dog_olc = num(:,11:14);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zzd=[Dog_olc(:,1:2)];
say=0;
for i=1:length(zzd)
    for j=1:2
    say=say+1;
s=find(Z(:,1)==zzd(i,j));
kord(say,:)=Z(s,:);
    end
end
nxk=Z1(:,2);nyk=Z1(:,3);nak=Z1(:,1);
nxy=Z2(:,2);nyy=Z2(:,3);nay=Z2(:,1);
axes(handles.axes2);
hold on;
kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3]);
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0]);
na=Z(:,1);nn=num2str(na);
dx=5;dy=5;
text(Z(:,2)+1+dx,Z(:,3)+dy,nn);
for i=1:2:length(kord)-1
dline=line([kord(i,2),kord(i+1,2)],[kord(i,3),kord(i+1,3)],'LineStyle','--','Color',[1 0 0]);
end
legend([kpoint,ypoint,dline],'Kesin Koor.','Yaklaþýk Koor.','Doðrultu Ölçü','Location','northoutside','Orientation','horizontal');
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
elseif ch==2
z1 = num(:,1); z1 = z1(~isnan(z1));
z2 = num(:,2); z2 = z2(~isnan(z2));
z3 = num(:,3); z3 = z3(~isnan(z3));
Z1 = [z1 z2 z3];
z4 = num(:,4); z4 = z4(~isnan(z4));
z5 = num(:,5); z5 = z5(~isnan(z5));
z6 = num(:,6); z6 = z6(~isnan(z6));
Z2 = [z4 z5 z6];
Z = [Z1;Z2];
Ken_olc = num(:,7:10);
Ken_olc = Ken_olc(isfinite(Ken_olc(:,1)),:);
zzk=[Ken_olc(:,1:2)];
say=0;
for i=1:length(zzk)
    for j=1:2
    say=say+1;
    s=find(Z(:,1)==zzk(i,j));
    kork(say,:)=Z(s,:);
    end
end
nxk=Z1(:,2);nyk=Z1(:,3);nak=Z1(:,1);
nxy=Z2(:,2);nyy=Z2(:,3);nay=Z2(:,1);
axes(handles.axes2);
hold on;
kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3]);
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0]);
na=Z(:,1);nn=num2str(na);
dx=5;dy=5;
text(Z(:,2)+1+dx,Z(:,3)+dy,nn);
for i=1:2:length(kork)-1
kline=line([kork(i,2),kork(i+1,2)],[kork(i,3),kork(i+1,3)],'Color','r','LineWidth',0.5);
end
legend([kpoint,ypoint,kline],'Kesin Koor.','Yaklaþýk Koor.','Kenar Ölçü','Location','northoutside','Orientation','horizontal');
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
elseif ch == 3 
z1 = num(:,1); z1 = z1(~isnan(z1));
z2 = num(:,2); z2 = z2(~isnan(z2));
z3 = num(:,3); z3 = z3(~isnan(z3));
Z1 = [z1 z2 z3];
z4 = num(:,4); z4 = z4(~isnan(z4));
z5 = num(:,5); z5 = z5(~isnan(z5));
z6 = num(:,6); z6 = z6(~isnan(z6));
Z2 = [z4 z5 z6];
Z = [Z1;Z2];
Ken_olc = num(:,7:10);
Ken_olc = Ken_olc(isfinite(Ken_olc(:,1)),:);
Dog_olc = num(:,11:14);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zzd=[Dog_olc(:,1:2)];
zzk=[Ken_olc(:,1:2)];
say=0;
for i=1:length(zzd)
    for j=1:2
    say=say+1;
    s=find(Z(:,1)==zzd(i,j));
    kord(say,:)=Z(s,:);
    end
end
say=0;
for i=1:length(zzk)
    for j=1:2
    say=say+1;
    s=find(Z==zzk(i,j));
    kork(say,:)=Z(s,:);
    end
end
nxk=Z1(:,2);nyk=Z1(:,3);nak=Z1(:,1);
nxy=Z2(:,2);nyy=Z2(:,3);nay=Z2(:,1);
axes(handles.axes2);
hold on
kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3]);
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0]);
na=Z(:,1);nn=num2str(na);
dx=5;dy=5;
text(Z(:,2)+1+dx,Z(:,3)+dy,nn,'Color','black','FontSize',14)
for i=1:2:length(kord)-1
dline=line([kord(i,2),kord(i+1,2)],[kord(i,3),kord(i+1,3)],'LineStyle','--','Color',[1 0 0]);
end
for i=1:2:length(kork)-1
kline=line([kork(i,2),kork(i+1,2)],[kork(i,3),kork(i+1,3)],'Color','r','LineWidth',0.5);
end
legend([kpoint,ypoint,dline,kline],'Kesin Koor.','Yaklaþýk Koor.','Doðrultu Ölçü','Kenar Ölçü','Location','northoutside','Orientation','horizontal')
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
elseif ch == 4
    k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
k3 = num(:,3); k3 = k3(~isnan(k3));
k4 = num(:,4); k4 = k4(~isnan(k4));
K1 = [k2 k3 k4];
k5 = num(:,5); k5 = k5(~isnan(k5));
k6 = num(:,6); k6 = k6(~isnan(k6));
k7 = num(:,7); k7 = k7(~isnan(k7));
k8 = num(:,8); k8 = k8(~isnan(k8));
K2 = [k6 k7 k8];
k18 = num(:,18); k18 = k18(~isnan(k18));
k19 = num(:,19); k19 = k19(~isnan(k19));
k20 = num(:,20); k20 = k20(~isnan(k20));
K3 = [ k18 k19 k20];
K = [K1;K2];
y=1:1:length(K(:,2));
y=y';
NOKTAD = [k1;k5];
K=[NOKTAD K y];
Dog_olc = num(:,10:14);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zz=[Dog_olc(:,1:2)];
say=0;
for i=1:length(zz);
    for j=1:2
        say=say+1;
        s=find(K(:,1)==zz(i,j));
        kor(say,:)=K(s,:);
    end
end
nxk=K1(:,1);
nyk=K1(:,2);
nyz=K1(:,3);
nak=k1;
nxy=K2(:,1);
nyy=K2(:,2);
nzy=K2(:,3);
nay=k5;
axes(handles.axes2);

hold on
 kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3]);
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0]);
 na=K(:,1);
nn=num2str(na);
text(K(:,2)+3,K(:,3),K(:,4),nn,'Color','black','FontSize',14);
for i=1:2:length(kor)-1
kline=line([kor(i,2),kor(i+1,2)],[kor(i,3),kor(i+1,3)],[kor(i,4),kor(i+1,4)],'LineStyle','--','Color',[1 0 0]);
end
legend([kpoint,ypoint,kline],'Kesin Koor.','Yaklaþýk Koor.','Doðrultu','Location','northoutside','Orientation','horizontal');
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');

elseif ch == 5
k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
K1 = [k1 k2];
k3 = num(:,4); k3 = k3(~isnan(k3));
k4 = num(:,5); k4 = k4(~isnan(k4));
K2 = [k3 k4];
K = [K1;K2];
y=1:1:length(K(:,2));y=y';
K=[K y];    
NOKTAD = [K(:,1)];
Dog_olc = num(:,11:14);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zz=[Dog_olc(:,1:2)];
say=0;
for i=1:length(zz)
    for j=1:2
        say=say+1;
        s=find(K(:,1)==zz(i,j));
        kor(say,:)=K(s,:);
    end
end
nxk=K1(:,2);
nyk=y(1:length(K1(:,1)),:);
nak=K1(:,1);
nxy=K2(:,2);
nyy=y(length(K1(:,1))+1:length(y),:);
nay=K2(:,1);
axes(handles.axes2)
hold on
kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3]);
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0]);
na=K(:,1);
nn=num2str(na);
text(K(:,2)+0.5,K(:,3),nn,'Color','black','FontSize',14);
for i=1:2:length(kor)-1
kline=line([kor(i,2),kor(i+1,2)],[kor(i,3),kor(i+1,3)],'Color','r','LineWidth',0.5);    
end
legend([kpoint,ypoint,kline],'Kesin Koor.','Yaklaþýk Koor.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
elseif ch == 6
    k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
K1 = [k1 k2];
k4 = num(:,4); k4 = k4(~isnan(k4));
k5 = num(:,5); k5 = k5(~isnan(k5));
K2 = [k4 k5];
K = [K1;K2];
y=1:1:length(K(:,2));
y=y';
K=[K y];
NOKTAD = [K(:,1)];
Dog_olc = num(:,7:10);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zz=[Dog_olc(:,1:2)];
say=0;
for i=1:length(zz)
    for j=1:2
        say=say+1;
        s=find(K(:,1)==zz(i,j));
        kor(say,:)=K(s,:);
    end
end
nxk=K1(:,2);
nyk=y(1:length(K1(:,1)),:);
nak=K1(:,1);
nxy=K2(:,2);
nyy=y(length(K1(:,1))+1:length(y),:);
nay=K2(:,1);
axes(handles.axes2);
hold on
kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3])
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0])
na=K(:,1)
nn=num2str(na)
text(K(:,2)+3,K(:,3),nn,'Color','black','FontSize',14)
for i=1:2:length(kor)-1
kline=line([kor(i,2),kor(i+1,2)],[kor(i,3),kor(i+1,3)],'LineStyle','--','Color',[1 0 0])
end
legend([kpoint,ypoint,kline],'Kesin Koor.','Yaklaþýk Koor.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
elseif ch == 7
    k1 = num(:,1); k1 = k1(~isnan(k1));
k2 = num(:,2); k2 = k2(~isnan(k2));
K1 = [k1 k2];
k4 = num(:,4); k4 = k4(~isnan(k4));
k5 = num(:,5); k5 = k5(~isnan(k5));
K2 = [k4 k5];
K = [K1;K2];
y=1:1:length(K(:,2));
y=y';
K=[K y];
NOKTAD = [K(:,1)];
Dog_olc = num(:,7:10);
Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
zz=[Dog_olc(:,1:2)];
say=0;
for i=1:length(zz)
    for j=1:2
        say=say+1;
        s=find(K(:,1)==zz(i,j));
        kor(say,:)=K(s,:);
    end
end
nxk=K1(:,2);
nyk=y(1:length(K1(:,1)),:);
nak=K1(:,1);
nxy=K2(:,2);
nyy=y(length(K1(:,1))+1:length(y),:);
nay=K2(:,1);
axes(handles.axes2);
hold on
kpoint=plot(nxk,nyk,'gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3])
ypoint=plot(nxy,nyy,'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[1,1,0])
na=K(:,1)
nn=num2str(na)
text(K(:,2)+3,K(:,3),nn,'Color','black','FontSize',14)
for i=1:2:length(kor)-1
kline=line([kor(i,2),kor(i+1,2)],[kor(i,3),kor(i+1,3)],'LineStyle','--','Color',[1 0 0])
end
legend([kpoint,ypoint,kline],'Kesin Koor.','Yaklaþýk Koor.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
set(legend,'FontSize',12); 
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')

end

% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
