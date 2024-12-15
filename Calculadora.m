function varargout = Calculadora(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
                   'gui_Singleton', gui_Singleton, ...
                   'gui_OpeningFcn', @Calculadora_OpeningFcn, ...
                   'gui_OutputFcn', @Calculadora_OutputFcn, ...
                   'gui_LayoutFcn', [] , ...
                   'gui_Callback', []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Calculadora_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
handles.current_input = '';  
handles.sol = 0;  
guidata(hObject, handles);

function varargout = Calculadora_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function update_display(handles)
if abs(handles.sol) < 0.00001
    handles.sol = 0;  
end
set(handles.IN, 'String', handles.current_input);
set(handles.SOL, 'String', num2str(handles.sol));

function NUMERO_Callback(hObject, eventdata, handles, numero)
handles.current_input = strcat(handles.current_input, numero);
update_display(handles);
guidata(hObject, handles);

function OPERACION_Callback(hObject, eventdata, handles, operacion)
handles.current_input = strcat(handles.current_input, operacion);
update_display(handles);
guidata(hObject, handles);

function IGUAL_Callback(hObject, eventdata, handles)
try
    result = eval(handles.current_input); 
    handles.sol = result;  
catch
    handles.current_input = 'Error';
    handles.sol = NaN;
end
update_display(handles);
guidata(hObject, handles);

function PI_Callback(hObject, eventdata, handles)
handles.current_input = strcat(handles.current_input, 'pi');
update_display(handles);
guidata(hObject, handles);

function C_Callback(hObject, eventdata, handles)
if ~isempty(handles.current_input)
    handles.current_input = handles.current_input(1:end-1); 
else
    handles.current_input = '';
end
update_display(handles);
guidata(hObject, handles);

function AC_Callback(hObject, eventdata, handles)
handles.current_input = '';
update_display(handles);
guidata(hObject, handles);

function UNO_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '1');
function DOS_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '2');
function TRES_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '3');
function CUATRO_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '4');
function CINCO_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '5');
function SEIS_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '6');
function SIETE_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '7');
function OCHO_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '8');
function NUEVE_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '9');
function CERO_Callback(hObject, eventdata, handles), NUMERO_Callback(hObject, eventdata, handles, '0');

function MAS_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '+');
function MENOS_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '-');
function POR_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '*');
function DIVICION_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '/');
function POTENCIA2_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '^2');
function POTENCIA3_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '^3');
function RAIZ_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '^(1/2)');
function INVERSO_Callback(hObject, eventdata, handles), OPERACION_Callback(hObject, eventdata, handles, '^(-1)');


function SENO_Callback(hObject, eventdata, handles)
handles.current_input = strcat('sin(', handles.current_input, ')');
update_display(handles);
guidata(hObject, handles);

function COS_Callback(hObject, eventdata, handles)
handles.current_input = strcat('cos(', handles.current_input, ')');
update_display(handles);
guidata(hObject, handles);

function TAN_Callback(hObject, eventdata, handles)
handles.current_input = strcat('tan(', handles.current_input, ')');
update_display(handles);
guidata(hObject, handles);


function PUNTO_DECIMAL_Callback(hObject, eventdata, handles)
if ~contains(handles.current_input, '.')
    handles.current_input = strcat(handles.current_input, '.');
end
update_display(handles);
guidata(hObject, handles);

function IN_CreateFcn(hObject, eventdata, handles)