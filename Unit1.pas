unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
HookProc = procedure (State: Boolean); stdcall;
  TForm1 = class(TForm)
    Edit1: TEdit;
    StartHook: TButton;
    StopHook: TButton;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure StartHookClick(Sender: TObject);
    procedure StopHookClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    DllHandle: HWND;
    SetHook: HookProc;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
DllHandle:=LoadLibrary('Project2.dll');
if DllHandle=0 then
  ShowMessage(IntToStr(GetLastError))
else
  @SetHook:=GetProcAddress(DllHandle, 'SetHook');
end;
procedure TForm1.StartHookClick(Sender: TObject);
begin
Sethook(true);
end;

procedure TForm1.StopHookClick(Sender: TObject);
begin
Sethook(true);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if DllHandle<>0 then
  FreeLibrary(DllHandle);
  end;
end.
