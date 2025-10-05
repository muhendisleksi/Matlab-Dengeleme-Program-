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

% Last Modified by GUIDE v2.5 28-Jul-2018 13:53:22

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
function Dengeleme_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Dengeleme (see VARARGIN)
h = waitbar(0,'Lütfen bekleyiniz...','Name','Program Açýlýyor');
steps = 1000;
for step = 1:steps
    waitbar(step / steps)
end
close(h)
% Choose default command line output for Dengeleme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Dengeleme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Dengeleme_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.uipanel1,'Visible','of');
axes(handles.axes1)
logo1=imread('Aglobal2.png');
imshow(logo1);
axis off;
axis image;

% --------------------------------------------------------------------
function Untitled_1_Callback(~, ~, ~)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(~, ~, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Doðrultu Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=1;
cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

% --------------------------------------------------------------------
function Untitled_3_Callback(~, ~, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Kenar Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=2;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Doðrultu - Kenar Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=3;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, ~, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('GPS Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=4;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Geometrik Nivelman Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=5;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

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
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Düþey Açýlara Göre Trigonometrik Nivelman Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=6;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, ~, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('Yükselik Farklarýna Göre Trigonometrik Nivelman Aðlarýnýn Dengelenmesi');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=7;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
set(handles.uipanel2,'Visible','of');
set(handles.uipanel1,'Visible','of');
set(handles.uipushtool1,'Enable','on');
set(handles.uitable1,'data','');
cla(handles.axes2,'reset');
static = sprintf('GPS Nivelmaný');
set(handles.text1, 'String', static);
msgbox('Lütfen Excel Verilerisini Yükleyiniz!', 'Veri Yükleme', 'warn');
ch=8;

cla(handles.axes2,'reset');
set(handles.listbox1,'String','');
set(handles.listbox2,'String','');
set(handles.uipanel2,'Visible','of');
set(handles.uitable1,'Visible','on');
set(handles.Untitled_12,'Enable','Of');
set(handles.uipushtool2,'Enable','of');
set(handles.uipushtool3,'Enable','of');
set(handles.uitoggletool1,'Enable','of');
set(handles.uitoggletool2,'Enable','of');
set(handles.uitoggletool3,'Enable','of');
set(handles.uitoggletool4,'Enable','of');
set(handles.uitoggletool6,'Enable','of');
set(handles.Untitled_11,'Enable','of');
set(handles.Untitled_13,'Enable','of');
clc

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
global file_name num ch table knan nxk nyk nxy nyy
[file, path] = uigetfile ( '*.xlsx;*.xls;' , 'LOAD FILE');
file_name=fullfile(path,file);
[num,tex,table]=xlsread(file_name);
set(handles.uitable1,'data',table);
set(handles.Untitled_12,'Enable','On');
h = waitbar(0,'Lütfen Bekleyiniz Veriler Yükleniyor...', 'Name','Veriler aktarýlýyor');
steps = 1800;
for step = 1:steps
    waitbar(step / steps);
end
close(h);
knan = nansum(cell2mat(table(3,1)));
set(handles.uipushtool3,'Enable','on');
if ch == 1    
    if knan ~= 0
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
        s=Z(:,1)==zzd(i,j);
        kord(say,:)=Z(s,:);
            end
        end
        nxk=Z1(:,2);nyk=Z1(:,3);nak=Z1(:,1);
        nxy=Z2(:,2);nyy=Z2(:,3);nay=Z2(:,1);
        axes(handles.axes2);
        hold on;
        kpoint=plot(nxk,nyk,'gs',...
            'LineWidth',2,...
            'MarkerSize',8,...
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
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        title('Doðrultu Aðlarýnýn Gösterimi','color', 'w')
        xlabel('Y')
        ylabel('X')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')        
        
    else        
        z1 = num(:,1); z1 = z1(~isnan(z1));
        z2 = num(:,2); z2 = z2(~isnan(z2));
        z3 = num(:,3); z3 = z3(~isnan(z3));
        Z = [z1 z2 z3];        
        Dog_olc = num(:,8:11);
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
        nxy=Z(:,2);nyy=Z(:,3);nay=Z(:,1);
        axes(handles.axes2);
        hold on;
        
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
        legend([ypoint,dline],'Yaklaþýk Koor.','Doðrultu Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        title('Doðrultu Aðlarýnýn Gösterimi','color', 'w')
        xlabel('Y')
        ylabel('X')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn') 
        
    end
elseif ch==2    
    if knan ~= 0        
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
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
%         xtickformat('%.3f')
%         ytickformat('%.3f')
%         ztickformat('%.3f')
        title('Kenar Aðlarýnýn Gösterimi','color', 'w')
        xlabel('Y')
        ylabel('X')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
        
    else
        z1 = num(:,1); z1 = z1(~isnan(z1));
        z2 = num(:,2); z2 = z2(~isnan(z2));
        z3 = num(:,3); z3 = z3(~isnan(z3));
        Z = [z1 z2 z3];        
        Ken_olc = num(:,4:7);
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
        nxy=Z(:,2);nyy=Z(:,3);nay=Z(:,1);
        axes(handles.axes2);
        hold on;
        
        ypoint=plot(nxy,nyy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=Z(:,1);nn=num2str(na);
        dx=5;dy=5;
        text(Z(:,2)+2+dx,Z(:,3)+dy,nn);
        for i=1:2:length(kork)-1
        kline=line([kork(i,2),kork(i+1,2)],[kork(i,3),kork(i+1,3)],'Color','r','LineWidth',0.5);
        end
        legend([ypoint,kline],'Yaklaþýk Koor.','Kenar Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        itle('Kenar Aðlarýnýn Gösterimi','color', 'w')
        xlabel('Y')
        ylabel('X')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
        
    end
elseif ch == 3 
    if knan ~= 0
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
        dline=line([kord(i,2),kord(i+1,2)],[kord(i,3),kord(i+1,3)],'LineStyle','--','Color','b','LineWidth',0.5);
        end
        for i=1:2:length(kork)-1
        kline=line([kork(i,2),kork(i+1,2)],[kork(i,3),kork(i+1,3)],'LineStyle',':','Color','r','LineWidth',1.2);
        end
        legend([kpoint,ypoint,dline,kline],'Kesin Koor.','Yaklaþýk Koor.','Doðrultu Ölçü','Kenar Ölçü','Location','northoutside','Orientation','horizontal')
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        title('Doðrultu-Kenar Aðlarýnýn Gösterimi','color', 'w')
        xlabel('Y')
        ylabel('X')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
        
    else        
        z1 = num(:,1); z1 = z1(~isnan(z1));
        z2 = num(:,2); z2 = z2(~isnan(z2));
        z3 = num(:,3); z3 = z3(~isnan(z3));
        Z = [z1 z2 z3];        
        Ken_olc = num(:,4:7);
        Ken_olc = Ken_olc(isfinite(Ken_olc(:,1)),:);
        Dog_olc = num(:,8:11);
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
        nxy=Z(:,2);nyy=Z(:,3);nay=Z(:,1);
        axes(handles.axes2);
        hold on
        ypoint=plot(nxy,nyy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=Z(:,1);nn=num2str(na);
        dx=5;dy=5;
        text(Z(:,2)+1+dx,Z(:,3)+dy,nn,'Color','black','FontSize',14)
        for i=1:2:length(kord)-1
        dline=line([kord(i,2),kord(i+1,2)],[kord(i,3),kord(i+1,3)],'LineStyle','--','Color','b','LineWidth',0.5);
        end
        for i=1:2:length(kork)-1
        kline=line([kork(i,2),kork(i+1,2)],[kork(i,3),kork(i+1,3)],'Color','r','LineWidth',0.5);
        end
        legend([ypoint,dline,kline],'Yaklaþýk Koor.','Doðrultu Ölçü','Kenar Ölçü','Location','northoutside','Orientation','horizontal')
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        title('Doðrultu-Kenar Aðlarýnýn Gösterimi','color', 'w')
        xlabel('Y')
        ylabel('X')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
        
    end
elseif ch == 4
    if knan ~= 0          
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
        nzk=K1(:,3);
        nak=k1;
        nxy=K2(:,1);
        nyy=K2(:,2);
        nzy=K2(:,3);
        nay=k5;
        axes(handles.axes2);

        hold on
         kpoint=plot3(nxk,nyk,nzk,'gs',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','b',...
            'MarkerFaceColor',[0.3,0.9,0.3]);
        ypoint=plot3(nxy,nyy,nzy,'^',...
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
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');
        ylabel('Y');xlabel('X');zlabel('Z');

    else                 
        k1 = num(:,1); k1 = k1(~isnan(k1));
        k2 = num(:,2); k2 = k2(~isnan(k2));
        k3 = num(:,3); k3 = k3(~isnan(k3));
        k4 = num(:,4); k4 = k4(~isnan(k4)); 
        K = [k2 k3 k4];
        y=1:1:length(K(:,2));
        y=y';
        NOKTAD = [k1];
        K=[NOKTAD K y];
        Dog_olc = num(:,6:10);
        Dog_olc = Dog_olc(isfinite(Dog_olc(:,1)),:);
        zz=[Dog_olc(:,1:2)]
        length(zz)
        say=0;
        if  length(zz) > 2
            for i=1:length(zz);
                for j=1:2
                    say=say+1
                    s=find(K(:,1)==zz(i,j))
                    kor(say,:)=K(s,:)
                end
            end
        else            
            for i=1:length(zz)/2;
                for j=1:2
                    say=say+1
                    s=find(K(:,1)==zz(i,j))
                    kor(say,:)=K(s,:)
                end
            end
        end
        nxy=K(:,2);
        nyy=K(:,3);
        nzy=K(:,4);
        nay=k1;
        axes(handles.axes2);
        hold on
        ypoint=plot3(nxy,nyy,nzy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
         na=K(:,1);
        nn=num2str(na);
        text(K(:,2)+3,K(:,3),K(:,4),nn,'Color','black','FontSize',14);
        if  length(zz) > 2
            for i=1:2:length(kor)-2
                kline=line([kor(i,2),kor(i+1,2)],[kor(i,3),kor(i+1,3)],[kor(i,4),kor(i+1,4)],'LineStyle','--','Color',[1 0 0]);
            end
        else
            for i=1:length(zz)/2
                kline=line([kor(i,2),kor(i+1,2)],[kor(i,3),kor(i+1,3)],[kor(i,4),kor(i+1,4)],'LineStyle','--','Color',[1 0 0]);
            end
        end            
        legend([ypoint,kline],'Yaklaþýk Koor.','Doðrultu','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');
        ylabel('Y');xlabel('X');zlabel('Z');
    end
    
elseif ch == 5
    if knan ~= 0  
        k1 = num(:,1); k1 = k1(~isnan(k1));
        k2 = num(:,2); k2 = k2(~isnan(k2));
        K1 = [k1 k2];
        k3 = num(:,4); k3 = k3(~isnan(k3));
        k4 = num(:,5); k4 = k4(~isnan(k4));
        K2 = [k3 k4];
        K = [K1;K2];
        NOKTAD = [K(:,1)];
        y=1:1:length(K(:,2));y=y';
        K=[K NOKTAD];    
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
        nzk=K1(:,2);
        nxk=NOKTAD(1:length(K1(:,1)),:);
        nyk=NOKTAD(1:length(K1(:,1)),:);
        nak=K1(:,1);
        nzy=K2(:,2);
        nyy=NOKTAD(length(K1(:,1))+1:length(y),:);
        nxy=NOKTAD(length(K1(:,1))+1:length(y),:);
        nay=K2(:,1);
        axes(handles.axes2)
        hold on
        kpoint=plot3(nxk,nyk,nzk,'gs',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','b',...
            'MarkerFaceColor',[0.3,0.9,0.3]);
        ypoint=plot3(nxy,nyy,nzy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=K(:,1);
        nn=num2str(na);
        text(K(:,1)+0.1,K(:,3)+0.1,K(:,2),nn,'Color','black','FontSize',14);
        for i=1:2:length(kor)-1
        kline=line([kor(i,1),kor(i+1,1)],[kor(i,3),kor(i+1,3),],[kor(i,2),kor(i+1,2)],'Color','r','LineWidth',0.5);    
        end
        legend([kpoint,ypoint,kline],'Kesin Yükseklik.','Yaklaþýk Yükseklik.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        % Add title and axis labels
        ylabel('Nokta numarasý');xlabel('Nokta numarasý');zlabel('Yükseklik')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
        
    else         
        k1 = num(:,1); k1 = k1(~isnan(k1));
        k2 = num(:,2); k2 = k2(~isnan(k2));
        K = [k1 k2];          
        NOKTAD = [K(:,1)];
        K=[K NOKTAD];
        Dog_olc = num(:,8:11);
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
        nzy=K(:,2);
        nyy=NOKTAD(1:length(K(:,1)),:);
        nxy=NOKTAD(1:length(K(:,1)),:);
        nay=K(:,1);        
        axes(handles.axes2)
        hold on        
        ypoint=plot3(nxy,nyy,nzy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=K(:,1);
        nn=num2str(na);        
        text(K(:,1)+0.1,K(:,3)+0.1,K(:,2),nn,'Color','black','FontSize',14);
        for i=1:2:length(kor)-1
        kline=line([kor(i,1),kor(i+1,1)],[kor(i,3),kor(i+1,3)],[kor(i,2),kor(i+1,2)],'Color','r','LineWidth',0.5);    
        end
        legend([ypoint,kline],'Yaklaþýk Yükseklik.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        % Add title and axis labels
        ylabel('Nokta numarasý');xlabel('Nokta numarasý');zlabel('Yükseklik')
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn')
        
    end
elseif ch == 6
    if knan ~= 0
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
        nzk=K1(:,2);
        nyk=K(1:length(K1(:,1)),1);
        nxk=K(1:length(K1(:,1)),1);
        nak=K1(:,1);
        nzy=K2(:,2);
        nyy=K(length(K1(:,1))+1:length(y),1);
        nxy=K(length(K1(:,1))+1:length(y),1);
        nay=K2(:,1);
        axes(handles.axes2);
        hold on
        kpoint=plot3(nxk,nyk,nzk,'gs',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','b',...
            'MarkerFaceColor',[0.3,0.9,0.3]);
        ypoint=plot3(nxy,nyy,nzy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=K(:,1);
        nn=num2str(na);
        text(K(:,1)+0.1,K(:,1),K(:,2),nn,'Color','black','FontSize',14);
        for i=1:2:length(kor)-1
        kline=line([kor(i,1),kor(i+1,1)],[kor(i,1),kor(i+1,1)],[kor(i,2),kor(i+1,2)],'LineStyle','--','Color',[1 0 0]);
        end
        legend([kpoint,ypoint,kline],'Kesin Yükseklik.','Yaklaþýk Yükseklik.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        % Add title and axis labels
        ylabel('Nokta numarasý');xlabel('Nokta numarasý');zlabel('Yükseklik');
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');
        
    else
        k1 = num(:,1); k1 = k1(~isnan(k1));
        k2 = num(:,2); k2 = k2(~isnan(k2));
        K = [k1 k2];
        y=1:1:length(K(:,2));
        y=y';
        K=[K y];
        NOKTAD = [K(:,1)];
        Dog_olc = num(:,4:8);
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
        nzy=K(:,2);
        nyy=K(1:length(K(:,1)),1);
        nxy=K(1:length(K(:,1)),1);
        nay=K(:,1);
        axes(handles.axes2);
        hold on
        ypoint=plot3(nxy,nyy,nzy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=K(:,1);
        nn=num2str(na);
        text(K(:,1)+0.1,K(:,1),K(:,2),nn,'Color','black','FontSize',14);
        for i=1:2:length(kor)-1
         kline=line([kor(i,1),kor(i+1,1)],[kor(i,1),kor(i+1,1)],[kor(i,2),kor(i+1,2)],'LineStyle','--','Color',[1 0 0]);
        end
        legend([ypoint,kline],'Yaklaþýk Yükseklik.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        % Add title and axis labels
        ylabel('Nokta numarasý');xlabel('Nokta numarasý');zlabel('Yükseklik');
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');        
    end
        
elseif ch == 7
    if knan ~= 0
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
        nzk=K1(:,2);
        nyk=K(1:length(K1(:,1)),1);
        nxk=K(1:length(K1(:,1)),1);
        nak=K1(:,1);
        nzy=K2(:,2);
        nyy=K(length(K1(:,1))+1:length(y),1);
        nxy=K(length(K1(:,1))+1:length(y),1);
        nay=K2(:,1);
        axes(handles.axes2);
        hold on
        kpoint=plot3(nxk,nyk,nzk,'gs',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','b',...
            'MarkerFaceColor',[0.3,0.9,0.3]);
        ypoint=plot3(nxy,nyy,nzy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=K(:,1);
        nn=num2str(na);
        text(K(:,1)+0.1,K(:,1),K(:,2),nn,'Color','black','FontSize',14);
        for i=1:2:length(kor)-1
         kline=line([kor(i,1),kor(i+1,1)],[kor(i,1),kor(i+1,1)],[kor(i,2),kor(i+1,2)],'LineStyle','--','Color',[1 0 0]);
        end
        legend([kpoint,ypoint,kline],'Kesin Yükseklik.','Yaklaþýk Yükseklik.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are red.
        ax.YColor = [1, 1, 1]; % Y labels are blue.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        % Add title and axis labels
        ylabel('Nokta numarasý');xlabel('Nokta numarasý');zlabel('Yükseklik');
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');
       
    else        
        k1 = num(:,1); k1 = k1(~isnan(k1));
        k2 = num(:,2); k2 = k2(~isnan(k2));
        K = [k1 k2];
        y=1:1:length(K(:,2));
        y=y';
        K=[K y];
        NOKTAD = [K(:,1)];
        Dog_olc = num(:,4:8);
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
        nxy=K(:,2);
        nyy=K(1:length(K(:,1)),1);
        nay=K(:,1);
        axes(handles.axes2);
        hold on
        ypoint=plot(nxy,nyy,'^',...
            'LineWidth',2,...
            'MarkerSize',10,...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',[1,1,0]);
        na=K(:,1);
        nn=num2str(na);
        text(K(:,1)+0.1,K(:,1),K(:,2),nn,'Color','black','FontSize',14);
        for i=1:2:length(kor)-1
          kline=line([kor(i,1),kor(i+1,1)],[kor(i,1),kor(i+1,1)],[kor(i,2),kor(i+1,2)],'LineStyle','--','Color',[1 0 0]);
        end
        legend([ypoint,kline],'Yaklaþýk Yükseklik.','Düþey açý Ölçü','Location','northoutside','Orientation','horizontal');
        set(legend,'FontSize',12); 
        ax = gca;
        get(ax) ;
        ax.FontSize = 12;
        ax.XColor = [1, 1, 1]; % X labels are white.
        ax.YColor = [1, 1, 1]; % Y labels are white.
        ax.ZColor = [1, 1, 1]; % Z labels are white.
        % Add title and axis labels
        ylabel('Nokta numarasý (y)');
        xlabel('Yükseklik (x)');
        msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');
        
    end
elseif ch == 8 
axes(handles.axes2);
hold on
kpoint=plot3(num(:,1),num(:,1),num(:,4),'^',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.3,0.9,0.3]);
ax = gca;
get(ax) ;
ax.FontSize = 12;
ax.XColor = [1, 1, 1]; % X labels are white.
ax.YColor = [1, 1, 1]; % Y labels are white.
ax.ZColor = [1, 1, 1]; % Z labels are white.
na=num(:,1);
nn=num2str(na);
text(num(:,1),num(:,1),num(:,4),nn,'Color','black','FontSize',14);
legend([kpoint],'H (elipsoidal) Yükseklik','Location','northoutside','Orientation','horizontal');

% Add title and axis labels
xlabel('Nokta numarasý');
ylabel('Nokta numarasý');
zlabel('Yükseklik');
msgbox({'Verileriniz Yüklendi.','Lütfen Kontrol Edin!'}, 'Veri Yükleme', 'warn');
end
set(handles.uitoggletool1,'Enable','on');
set(handles.uitoggletool2,'Enable','on');
set(handles.uitoggletool3,'Enable','on');
set(handles.uitoggletool4,'Enable','on');
set(handles.uitoggletool6,'Enable','on');
set(handles.Untitled_11,'Enable','on');
set(handles.uipanel1,'Visible','on');
set(handles.uitable1,'Visible','on');


% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if  ch==1
    dogrultuprint    
elseif ch==2
    kenarprint
elseif ch==3
    dogrultu_kenarprint
elseif ch ==4
    gpsaglariprint
elseif ch==5
    geomatiknivelmanprint
elseif ch==6
    triduseynivelmanprint
elseif ch == 7
    triyuksekliknivelmanprint
elseif ch == 8
    GPSnivelmanprint
end
msgbox({'Dengeleme Sonuçlarý','Kaydedilmiþtir!'}, 'Sonuçlar Kaydedildi!', 'warn')
% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temizle = questdlg('Dikkat! Dengeleme veya çizim yapamayabilirsiniz!', ...
	'Verileri Temizle', ...
	'Evet','Hayýr','');
switch temizle
    case 'Evet'
        dessert = 1;
    case 'Hayýr'
    dessert = 2;   
    case ''
        dessert = 0;
end

if dessert == 1
    set(handles.uitable1,'data','');
    cla(handles.axes2,'reset');
    set(handles.listbox1,'String','');
    set(handles.listbox2,'String','');
    set(handles.uipanel2,'Visible','of');
    set(handles.uipanel1,'Visible','of');
    set(handles.uitable1,'Visible','on');
    set(handles.Untitled_12,'Enable','Of');
    set(handles.uipushtool1,'Enable','of');
    set(handles.uipushtool2,'Enable','of');
    set(handles.uipushtool3,'Enable','of');
    set(handles.uitoggletool1,'Enable','of');
    set(handles.uitoggletool2,'Enable','of');
    set(handles.uitoggletool3,'Enable','of');
    set(handles.uitoggletool4,'Enable','of');
    set(handles.uitoggletool6,'Enable','of');
    set(handles.Untitled_11,'Enable','of');
    set(handles.Untitled_13,'Enable','of');
    msgbox({'Dengeleme Modelini','Tekrar Seçiniz!'}, 'Veriler silindi!', 'warn');
    clear all
    clear
    clc
end
% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch file_name  mx KSNKOORD x KSNYUKSEKLIK blnmynlr cevap
if ch == 1    
    static = sprintf('Doðrultu Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    dogrultu(file_name);
    if cevap == 1 || cevap == 0
        set(handles.uipanel2,'Visible','on');
        set(handles.uitable1,'Visible','of');
        KSNKOORD1 = sprintf('%.3f\n',KSNKOORD);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',KSNKOORD1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');
    end
elseif ch == 2    
    static = sprintf('Kenar Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    kenar(file_name)
    if cevap == 1  || cevap == 0 || cevap == []
        KSNKOORD1 = sprintf('%.3f\n',KSNKOORD);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',KSNKOORD1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');   
        set(handles.uipanel2,'Visible','on');
        set(handles.uitable1,'Visible','of');
    end
elseif ch == 3   
    static = sprintf('Doðrultu - Kenar Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    dogrultu_kenar(file_name)
    if cevap == 1 || cevap == 0 
        KSNKOORD1 = sprintf('%.3f\n',KSNKOORD);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',KSNKOORD1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');
        set(handles.uipanel2,'Visible','on');
        set(handles.uitable1,'Visible','of');
    end
elseif ch == 4    
    static = sprintf('GPS Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    gpsaglari(file_name)
    if cevap == 1 || cevap == 0
        set(handles.uipanel2,'Visible','on');
        set(handles.uitable1,'Visible','of');
        x1 = sprintf('%.3f\n',x);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',x1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');
    end
elseif ch == 5
    set(handles.uipanel2,'Visible','on');
    set(handles.uitable1,'Visible','of');
    static = sprintf('Geometrik Nivelman Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    geometriknivelman(file_name)
    if cevap == 1 || cevap == 0
        KSNYUKSEKLIK1 = sprintf('%.3f\n',KSNYUKSEKLIK);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',KSNYUKSEKLIK1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');
        set(handles.Untitled_15,'Enable','of');
    end
elseif ch == 6
    set(handles.uipanel2,'Visible','on');
    set(handles.uitable1,'Visible','of');
    static = sprintf('Düþey Açýlara Göre Tri. Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    triduseynivelman(file_name)
     if cevap == 1 || cevap == 0
         KSNYUKSEKLIK1 = sprintf('%.3f\n',KSNYUKSEKLIK);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',KSNYUKSEKLIK1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');
        set(handles.Untitled_15,'Enable','of');
     end
elseif ch == 7
    set(handles.uipanel2,'Visible','on');
    set(handles.uitable1,'Visible','of');
    static = sprintf('Yükseklik Farkýna Göre Tri. Aðlarýnýn Dengelenme Hesabý');
    set(handles.text2, 'String', static);
    h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    triyuksekliknivelman(file_name)
     if cevap == 1 || cevap == 0
        KSNYUKSEKLIK1 = sprintf('%.3f\n',KSNYUKSEKLIK);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',KSNYUKSEKLIK1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
        set(handles.uipushtool2,'Enable','on');
        set(handles.Untitled_13,'Enable','on');
        set(handles.Untitled_15,'Enable','of');
     end
elseif ch == 8
     set(handles.uipanel2,'Visible','on');
    set(handles.uitable1,'Visible','of');
    static = sprintf('GPS Nivelmaný Dengelenme Hesabý');
    set(handles.text2, 'String', static);
      h = waitbar(0,'Lütfen Bekleyiniz Dengeleme Ýþlemi Gerçekleþiyor...','Name','Dengeleme yapýlýyor...');
    steps = 1000;
    for step = 1:steps
        waitbar(step / steps)
    end
    close(h) 
    GPSnivelman(file_name)
     if cevap == 1 || cevap == 0
        blnmynlr1 = sprintf('%.d\n',blnmynlr);
        mx1 = sprintf('%.3f\n',mx);
        set(handles.listbox1,'String',blnmynlr1,'FontSize',12);
        set(handles.listbox2,'String',mx1,'FontSize',12);
       set(handles.uipushtool2,'Enable','on');
       set(handles.Untitled_13,'Enable','on');
     end
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nokta_ad K1 K2 ch K fi0 lamda landa fi k1 k2 knan 

soru2 = sprintf('Koordinatlarýn WGS84 Datumunda Olduðundan Emin Misiniz?');
    dikkat = questdlg(soru2, ...
	'Devam Edilsin Mi?', ...
	'Evet','Hayýr','');
switch dikkat
    case 'Evet'
        cevap = 1;
    case 'Hayýr'
        cevap = 2;   
    case ''
        cevap = 0;
end
if knan ~= 0
if cevap == 1
    if ch == 4
        x = [K1(:,1);K2(:,1)];y = [K1(:,2);K2(:,2)];z = [K1(:,3);K2(:,3)];datum = 'WGS84';
        for i = 1:length(x)
            cografiKoor(x,y,z,datum);   
            enlem(i) = fi0(i); 
            boylam(i) = lamda(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
        end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
    elseif ch == 1
         x = K(:,3);y = K(:,2);datum = 'WGS84';
         lam0= str2double(inputdlg('Dilim Orta Meridyen Deðeri: ',...
        'DOM', [1 50]));     
         for i = 1:length(x)         
            GausDonusum(x,y,lam0) 
            enlem(i) = fi(i); 
            boylam(i) = landa(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
         end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
    elseif ch == 2
        x = K(:,3);y = K(:,2);datum = 'WGS84';
         lam0= str2double(inputdlg('Dilim Orta Meridyen Deðeri: ',...
        'DOM', [1 50]));     
         for i = 1:length(x)         
            GausDonusum(x,y,lam0) 
            enlem(i) = fi(i); 
            boylam(i) = landa(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
         end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
    elseif ch == 3
        x = K(:,3);y = K(:,2);datum = 'WGS84';
         lam0= str2double(inputdlg('Dilim Orta Meridyen Deðeri: ',...
        'DOM', [1 50]));     
         for i = 1:length(x)         
            GausDonusum(x,y,lam0) 
            enlem(i) = fi(i); 
            boylam(i) = landa(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
         end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
    elseif ch == 8
        BilinmeyenNok= str2double(inputdlg('Bilinmeyen Nokta Numarasý:  ',...
        'Bilinmeyenin Deðeri', [1 50]));
    nokta_ad = [k1;BilinmeyenNok];
    x = k1;y = k2;datum = 'WGS84';
         lam0= str2double(inputdlg('Dilim Orta Meridyen Deðeri: ',...
        'DOM', [1 50]));  
    for i = 1:length(x)         
            GausDonusum(x,y,lam0) 
            enlem(i) = fi(i); 
            boylam(i) = landa(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
         end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
    end
end

else
   if ch == 4
        x = [K1(:,1);K2(:,1)];y = [K1(:,2);K2(:,2)];z = [K1(:,3);K2(:,3)];datum = 'WGS84';
        for i = 1:length(x)
            cografiKoor(x,y,z,datum);   
            enlem(i) = fi0(i); 
            boylam(i) = lamda(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
        end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
    elseif ch == 1
         x = K(:,3);y = K(:,2);datum = 'WGS84';
         lam0= str2double(inputdlg('Dilim Orta Meridyen Deðeri: ',...
        'DOM', [1 50]));     
         for i = 1:length(x)         
            GausDonusum(x,y,lam0) 
            enlem(i) = fi(i); 
            boylam(i) = landa(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
         end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);         
    elseif ch == 3
        x = K(:,3);y = K(:,2);datum = 'WGS84';
         lam0= str2double(inputdlg('Dilim Orta Meridyen Deðeri: ',...
        'DOM', [1 50]));     
         for i = 1:length(x)         
            GausDonusum(x,y,lam0) 
            enlem(i) = fi(i); 
            boylam(i) = landa(i); 
            camera = geopoint(enlem(i),boylam(i));
            camera.Altitude = 500;% camera.Heading = 0;% camera.Tilt = 0;% camera.Roll = 0;
            name{i} = sprintf('%d. Nokta Konumu', nokta_ad(i));
            lat(i) = camera.Latitude;
            lon(i) = camera.Longitude;    
         end
        filename = 'NoktaKonumlari.kml';kmlwritepoint(filename,lat,lon,'Camera',camera,'Name',name);
        winopen(filename);
   end
end
% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s0_dog s0_ken s0 f alf Qvv KSNKOORD ch K1 K2 K YON_BLNM nokta_ad...
x A knan
if knan ~= 0
    if ch == 1
        so = s0_dog;
        noktaAdlari = YON_BLNM;
        boyut = 2;
        elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*abs(sqrt(lamda1(i))); %%%%%%%%%%%%%%%% irrasyonel geliyorr????
            B(i,1) = so*abs(sqrt(lamda2(i))); %%%%%%%%%%%%%%%% Mutlak deðer yaptým ama yine deðiþik oldu!!!
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(2*i);
            KSNKOORDY(i) = KSNKOORD(2*i-1);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K1(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 2
        so = s0_ken;
        noktaAdlari = K2(:,1);
        elips_say = size(A,1);
        for i = 1:length(noktaAdlari)
              noktaAdlari(2*i-1:2*i,:) = K2(:,i);
        end
        boyut = 2;
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;         
            Aa(i,1) = so.*sqrt(lamda1(i));
            B(i,1) = so.*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(2*i);
            KSNKOORDY(i) = KSNKOORD(2*i-1);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K1(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');

    elseif ch == 3
        so = s0_dog;
        noktaAdlari = K(:,1);
        boyut = 2;
        elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(2*i);
            KSNKOORDY(i) = KSNKOORD(2*i-1);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K1(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 4
         so = s0;
         noktaAdlari = nokta_ad;
         boyut = 2;
         elips_say = size(A,1);
        Qdi = diag(Qvv);
        
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end

        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
         % Güven elipsi
         KSNKOORD = x;
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(3*i-2);
            KSNKOORDY(i) = KSNKOORD(3*i-1);
            KSNKOORDZ(i) = KSNKOORD(3*i);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K1(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 5
         so = s0_dog;
         noktaAdlari = nokta_ad;
         boyut = 2;
         elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K2(:,1);
        KoorY = K2(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 6
        so = s0_dog;
         noktaAdlari = nokta_ad;
         boyut = 2;
        Qdi = diag(Qvv);
        elips_say = size(A,1);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K(:,1);
        KoorY = K(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:length(diag(Qvv))/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');  
    elseif ch == 7
        so = s0_dog;
         noktaAdlari = nokta_ad;
         boyut = 2;
        Qdi = diag(Qvv);
        elips_say = size(A,1);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K(:,1);
        KoorY = K(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:length(diag(Qvv))/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 8
        so = s0;
        boyut = 2;
        Qdi = diag(Qvv);
        elips_say = size(A,1);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K2(:,1);
        KoorY = K2(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:length(diag(Qvv))/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    end
    
else
    if ch == 1
        so = s0_dog;
        noktaAdlari = YON_BLNM;
        boyut = 2;
        elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*abs(sqrt(lamda1(i))); %%%%%%%%%%%%%%%% irrasyonel geliyorr????
            B(i,1) = so*abs(sqrt(lamda2(i))); %%%%%%%%%%%%%%%% Mutlak deðer yaptým ama yine deðiþik oldu!!!
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(2*i);
            KSNKOORDY(i) = KSNKOORD(2*i-1);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 3
        so = s0_dog;
        noktaAdlari = K(:,1);
        boyut = 2;
        elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(2*i);
            KSNKOORDY(i) = KSNKOORD(2*i-1);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 4
        so = s0;
         noktaAdlari = nokta_ad;
         boyut = 2;
         elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end

        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
         % Güven elipsi
         KSNKOORD = x;
        for i = 1: length(KSNKOORD)/2
            KSNKOORDX(i) = KSNKOORD(3*i-2);
            KSNKOORDY(i) = KSNKOORD(3*i-1);
            KSNKOORDZ(i) = KSNKOORD(3*i);
        end
        KSNKOORD = [KSNKOORDY' KSNKOORDX'];
        Koordinatlar = [K(:,2:end); KSNKOORD]; %%%KSNKOORD
        KoorX = Koordinatlar(:,2);
        KoorY = Koordinatlar(:,1);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(noktaAdlari(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(noktaAdlari(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
        elseif ch == 5
         so = s0_dog;
         noktaAdlari = nokta_ad;
         boyut = 2;
         elips_say = size(A,1);
        Qdi = diag(Qvv);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K(:,1);
        KoorY = K(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:elips_say/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');
    elseif ch == 6
        so = s0_dog;
         noktaAdlari = nokta_ad;
         boyut = 2;
        Qdi = diag(Qvv);
        elips_say = size(A,1);
        for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K(:,1);
        KoorY = K(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:length(diag(Qvv))/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');  
    elseif ch == 7
        so = s0_dog;
         noktaAdlari = nokta_ad;
         boyut = 2;
        Qdi = diag(Qvv);
        elips_say = size(A,1);
         for i = 1:elips_say/2
            %hata elips elemanlarýný
            Qxi(i,1) = Qdi(2*i-1);
            Qyi(i,1) = Qdi(2*i);
            Qxyi(i,1) = Qvv(2*i-1,2*i);
            tetha(i,1) = 1/2 * (atan((2*Qxyi(i))/(Qxi(i) - Qyi(i))))*200/pi;
            if (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) >0
                tetha(i) = tetha(i) ;
            elseif (Qxi(i) - Qyi(i)) > 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 400;
            elseif  (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) > 0
                tetha(i) = tetha(i) + 200;
            elseif (Qxi(i) - Qyi(i)) < 0 & Qxyi(i) < 0
                tetha(i) = tetha(i) + 200;
            end
            W(i,1) = sqrt((Qxi(i) - Qyi(i))^2 + 4*Qxyi(i)^2);
            lamda1(i,1) = (Qxi(i) + Qyi(i) + W(i))/2;
            lamda2(i,1) = (Qxi(i) + Qyi(i) - W(i))/2;
            Aa(i,1) = so*sqrt(lamda1(i));
            B(i,1) = so*sqrt(lamda2(i));
            %Güven elips elemanlarý
            v = sqrt(finv(1-alf,boyut,f)*2);
            a(i,1) = v * Aa(i);
            b(i,1) = v * B(i);
        end
        for i = 1:length(tetha)
            if isnan(tetha(i)) == 1 
                tetha(i) = 0;
            end
        end
        %baðýl güven elipsinin elemanlarýný
        blnmynlrNo = find(noktaAdlari);
        for i = 1:elips_say/2
            Qe{i,1} = [ Qvv(2*i-1,2*i-1) Qvv(2*i-1,2*i); Qvv(2*i-1,2*i) Qvv(2*i,2*i)];
        end
        % Güven elipsi
        KoorX = K(:,1);
        KoorY = K(:,2);
        figure
        hold on
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);    
            t = -tetha(i):0.01:tetha(i);
             if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            x = xo(i) + Aa(i)*cos(t); 
            y = yo(i) + B(i)*sin(t);       
            plot(x,y,'b','LineWidth', 1.5);
            str = 'Güven elipsi';
            t1 = text(x(10),y(10),str);
            t2 = text(x(20),y(25),num2str(KoorX(i))); t2.FontSize = 12;
            axis equal    

        end

        % Hata elipsi
         X = cell(length(a),1) ;
         Y = cell(length(a),1) ;
         xo = []; yo = [];
        for i = 1:elips_say/2
            xo(i) = KoorX(i);
            yo(i) = KoorY(i);;  
            t = -tetha(i):0.01:tetha(i);
            if -10e-16 < t | t > 10e-16
                t = -3.5:0.01:3;
            end
            X{i} = xo(i) + a(i)*cos(t) ;  
            Y{i} = yo(i) + b(i)*sin(t) ;        
            plot(X{i},Y{i},'r','LineWidth', 1.5)
            str2 = ('Hata elipsi');        
            t3 = text(X{i,1}(1,10),Y{i,1}(1,10),str2);
            t4 = text(X{i,1}(1,50),Y{i,1}(1,50),num2str(KoorX(i))); t4.FontSize = 12;  
            axis equal
        end   

        % Vektör çizimi
        for i = 1:length(diag(Qvv))/2
              x0= KoorX(i);
              y0 = KoorY(i);
              x1 = x0 + Aa(i)*cos(tetha(i)) ;
              y1 =  y0 + Aa(i)*sin(tetha(i))  ;
              plot([x0;x1],[y0;y1],'Color',[0,0.7,0.9],'LineWidth', 1.7);
        end
        grid on
        xlabel('Büyük yarý eksen');
        ylabel('Küçük yarý eksen');    
    end
end
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
