  function varargout = untitled(varargin)
% untitled MATLAB code for untitled.fig
%      untitled, by itself, creates a new untitled or raises the existing
%      singleton*.
%
%      H = untitled returns the handle to a new untitled or the handle to
%      the existing singleton*.
%
%      untitled('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in untitled.M with the given input arguments.
%
%      untitled('Property','Value',...) creates a new untitled or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 15-May-2019 11:25:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;
set(handles.figure1,'Name','ÝMTÝHAN SONUÇLARI')
handles.conn = database('okul','','');
sorgu = 'select * from dersler order by ders_adi';
data = fetch(handles.conn,sorgu);
set(handles.popupmenu1,'String',['Ders Seçiniz';data(:,2)]);

if (nargin == 4)
    handles.ders_adi = varargin{1}.ders_adi;
    handles.ders_id = varargin{1}.ders_id;
else
    handles.ders_adi = 'Ders Seçiniz';
    handles.ders_id = 0;

end
set(handles.popupmenu1,'Value',handles.ders_id+1);
handles.filtre = 1;
popupmenu1_Callback(hObject, eventdata, handles);
popupmenu1_Callback(hObject, eventdata, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
d = get(handles.popupmenu1,'Value');
liste = cellstr(get(handles.popupmenu1,'String'));
handles.ders_adi = liste{d};
handles.ders_id = d-1;
if ( d > 1  )
    
 set(handles.uitable1,'Visible','on');   
 set(handles.text2,'Visible','on'); 
 set(handles.text3,'Visible','on'); 
 set(handles.text4,'Visible','on');    
    
handles.ders_id = d-1;
set(handles.uitable1,'ColumnName',{'No','Adý','Soyadý','E/K','Ara','Final','Harf'});
set(handles.uitable1,'ColumnWidth',{50,120,120,40,50,50,50});

if (handles.filtre == 1)
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d',d-1);
elseif (handles.filtre == 2) 
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d order by final desc limit 3 ',d-1);
elseif (handles.filtre == 3) 
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d order by final asc limit 3 ',d-1);
elseif (handles.filtre == 4) 
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d and ogrenciler.ogr_cinsiyet = ''E'' order by final desc limit 3 ',d-1);
elseif (handles.filtre == 5) 
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d and ogrenciler.ogr_cinsiyet = ''E'' order by final asc limit 3 ',d-1);
elseif (handles.filtre == 6) 
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d and ogrenciler.ogr_cinsiyet = ''K'' order by final desc limit 3 ',d-1);
elseif (handles.filtre == 7) 
sorgu = sprintf('select * from notlar,ogrenciler,dersler where ogrenciler.id = notlar.ogrenci_id and dersler.id = notlar.ders_id and dersler.id = %d and ogrenciler.ogr_cinsiyet = ''K'' order by final asc limit 3 ',d-1);

end
data = fetch(handles.conn,sorgu);
set(handles.uitable1,'Data',data(:,[8,9,10,11,4,5,6]));

sorgu = sprintf('select AVG(ara),AVG(final) from notlar where ders_id = %d',d-1);
data = fetch(handles.conn,sorgu);
handles.ara_ort = round(data{1,1});
handles.final_ort = round(data{1,2});
handles.gecme_ort = round(data{1,1}*0.4 + data{1,2}*0.6);
set(handles.text2,'String',sprintf('Ara Ýmtihan Ortalamasý : %d',handles.ara_ort))
set(handles.text3,'String',sprintf('Final Ortalamasý : %d',handles.final_ort))
set(handles.text4,'String',sprintf('Geçme Ortalamasý : %d',handles.gecme_ort))

else 
 set(handles.uitable1,'Visible','off');   
 set(handles.text2,'Visible','off'); 
 set(handles.text3,'Visible','off'); 
 set(handles.text4,'Visible','off');
end
guidata(hObject,handles);

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


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
secim = get(hObject,'Tag');
 switch secim
     case 'togglebutton1'
         handles.filtre = 1;
     case 'radiobutton1'
         handles.filtre = 2;
     case 'radiobutton2'
         handles.filtre = 3;
     case 'radiobutton3'
         handles.filtre = 4;
     case 'radiobutton4'
         handles.filtre = 5;
     case 'radiobutton5'
         handles.filtre = 6;
     case 'radiobutton6' 
         handles.filtre = 7;
 end
 guidata(hObject,handles)
 popupmenu1_Callback(hObject, eventdata, handles)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (strcmp(handles.ders_adi,'Ders Seçiniz') )
    errordlg('Önce Ders seçmelisiniz','Hata','modal')
else
soru = questdlg('Varsa eski harf notlarý silinecek. Emin misin?','Uyarý','Evet','Hayýr','modal');
    if ( strcmp(soru,'Evet') )
    sorgu_d = sprintf('update notlar set harf = '''' where ders_id = %d',handles.ders_id);
    exec(handles.conn,sorgu_d);
    delete(handles.figure1);
    harf_notu(handles);
    end
end
