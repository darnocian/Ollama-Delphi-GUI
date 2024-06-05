program Ollma_Client;

{$R *.dres}

uses
  FastMM4,
  System.SysUtils,
  WinApi.Windows,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Unit_Common in 'Unit_Common.pas',
  Unit_SysInfo in 'Unit_SysInfo.pas',
  Unit_MRUManager in 'Unit_MRUManager.pas',
  Unit_ImageDropDown in 'Unit_ImageDropDown.pas',
  SpeechLib_TLB in 'SpeechLib_TLB.pas',
  VirtualTrees.BaseTree in 'Include\VirtualTrees.BaseTree.pas',
  VirtualTrees in 'Include\VirtualTrees.pas',
  Unit_Welcome in 'Unit_Welcome.pas' {Frame_Welcome: TFrame},
  Unit_Main in 'Unit_Main.pas' {Form_RestOllama: T},
  Unit_AliveOllama in 'Unit_AliveOllama.pas' {TForm_AliveOllama},
  Unit_Translator in 'Unit_Translator.pas' {TForm_Translator},
  Unit_About in 'Unit_About.pas' {TForm_About: Form_About},
  Unit_RequestDialog in 'Unit_RequestDialog.pas' {Form_RequestDialog: T},
  Unit_ChattingBoxClass in 'Unit_ChattingBoxClass.pas' {Frame_ChattingBoxClass: TFrame},
  Unit_DosCommander in 'Unit_DosCommander.pas' {TForm_DosCommander};

{$R *.res}

const
  _AppTitle: string   = 'Ollama Client GUI';
  _AppWarning: string = 'Ollama Client GUI is already running...';

var
  _mxHandle: THandle = 0;
begin
  var _RunTime := Application.MainForm = nil;
  if _RunTime then
    begin
      _mxHandle := CreateMutex(nil, False, PChar(_AppTitle));
      if GetLastError = ERROR_ALREADY_EXISTS then
      begin
        var _dummy := MessageBox(0, PChar(_AppWarning), PChar(_AppTitle), MB_OK or MB_ICONINFORMATION);
        Halt(0);
      end;
    end
  else
    begin
      var _dummy := MessageBox(0, PChar(_AppWarning), PChar(_AppTitle), MB_OK or MB_ICONINFORMATION);
      Halt(0);
    end;

  if _mxHandle <> 0 then
  try
    Application.Initialize;

    // For Last Deployment ...
    {
      var _skinfile := CV_AppPath+'skincfg.txt';
      if FileExists(_skinfile) then
      begin
        var _default := TStyleManager.ActiveStyle.Name;
        var _skinname := IOUtils_ReadAllText(_skinfile);
        if not SameText(_default, _skinname) then
        TStyleManager.TrySetStyle(_skinname);

        GV_ApplyedSkin := True;
      end;
     }

    TStyleManager.TrySetStyle('Windows11 Impressive Dark');
    Application.Title := 'Ollama Client GUI';
    Application.CreateForm(TForm_RestOllama, Form_RestOllama);
    Application.CreateForm(TForm_RequestDialog, Form_RequestDialog);
    Application.Run;
  finally
    CloseHandle(_mxHandle);
  end;
end.
